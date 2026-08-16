#!/usr/bin/env python3
"""Fetch color definitions from suannhai-theme and generate Lua palette files.

Usage:
    python3 scripts/sync-palettes.py                  # fetch from GitHub main branch
    python3 scripts/sync-palettes.py --local ../colors  # read from local directory
"""

import argparse
import json
import sys
import urllib.request
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent
PALETTES_DIR = REPO_ROOT / "lua" / "suannhai" / "palettes"

GITHUB_RAW = "https://raw.githubusercontent.com/WeiTing1991/suannhai-theme/main/colors"

COLOR_FILES = [
    "formosa-hue-poo.json",
    "formosa-jiufen.json",
    "formosa-lam-ni.json",
    "nippon-koiai.json",
    "nippon-rouiro.json",
    "nippon-shironeri.json",
    "nippon-sumi.json",
    "nippon-torinoko.json",
]

# JSON nested keys -> flat Lua keys
KEY_MAP = {
    "background": "bg",
    "foreground": "fg",
    "function": "func",
}


def json_to_lua_name(json_name: str) -> str:
    """formosa-jiufen.json -> jiufen, nippon-rouiro.json -> rouiro"""
    stem = Path(json_name).stem
    for prefix in ("formosa-", "nippon-"):
        if stem.startswith(prefix):
            return stem[len(prefix):]
    return stem


def fetch_json(name: str, local_dir: str | None) -> dict:
    """Load a color JSON file from local path or GitHub."""
    if local_dir:
        path = Path(local_dir) / name
        with open(path) as f:
            return json.load(f)

    url = f"{GITHUB_RAW}/{name}"
    with urllib.request.urlopen(url) as resp:
        return json.loads(resp.read().decode())


def extract_palette(data: dict) -> list[tuple[str, str]]:
    """Extract (lua_key, value) pairs from JSON color data."""
    entries: list[tuple[str, str]] = []

    for group in ("neutrals", "accents", "diagnostic"):
        for role, info in data.get(group, {}).items():
            lua_key = KEY_MAP.get(role, role)
            entries.append((lua_key, info["hex"]))

    entries.append(("appearance", data["appearance"]))
    return entries


def render_lua(lua_name: str, entries: list[tuple[str, str]]) -> str:
    """Render a Lua palette file from extracted entries."""
    lines = [
        f"-- suannhai-nvim/lua/suannhai/palettes/{lua_name}.lua",
        "---@class suannhai.Palette",
        "return {",
    ]

    # Group: neutrals (first 5), accents (next 6), diagnostic (next 1), meta (last)
    groups = [
        entries[:5],    # neutrals
        entries[5:11],  # accents
        entries[11:12], # diagnostic
        entries[12:],   # appearance
    ]

    for i, group in enumerate(groups):
        for key, val in group:
            lines.append(f'  {key} = "{val}",')
        if i < len(groups) - 1:
            lines.append("")

    lines.append("}")
    lines.append("")
    return "\n".join(lines)


def main() -> int:
    parser = argparse.ArgumentParser(description="Sync palettes from suannhai-theme")
    parser.add_argument(
        "--local",
        dest="local_dir",
        help="Path to local colors/ directory (default: fetch from GitHub)",
    )
    args = parser.parse_args()

    if not PALETTES_DIR.is_dir():
        print(f"error: palettes directory not found: {PALETTES_DIR}", file=sys.stderr)
        return 1

    changed = []
    source = args.local_dir or "GitHub"
    print(f"source: {source}\n")

    for name in COLOR_FILES:
        lua_name = json_to_lua_name(name)
        lua_path = PALETTES_DIR / f"{lua_name}.lua"

        try:
            data = fetch_json(name, args.local_dir)
        except Exception as e:
            print(f"error fetching {name}: {e}", file=sys.stderr)
            return 1

        entries = extract_palette(data)
        content = render_lua(lua_name, entries)

        existing = lua_path.read_text() if lua_path.exists() else ""
        if content != existing:
            lua_path.write_text(content)
            changed.append(lua_name)
            print(f"  updated: {lua_name}")
        else:
            print(f"  unchanged: {lua_name}")

    if changed:
        print(f"\n{len(changed)} palette(s) updated: {', '.join(changed)}")
    else:
        print("\nall palettes up to date")

    return 0


if __name__ == "__main__":
    sys.exit(main())
