# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Fixed

- Swap misplaced Torinoko and Shironeri preview screenshots

## [0.1.0] - 2026-08-16

### Added

- LICENSE file and preview assets
- Palette sync script (`scripts/sync-palettes.py`) to fetch colors from suannhai-theme
- CI palette sync check
- Selene Lua linter in CI
- Changelog enforcement on PRs
- Release workflow for tagged versions

### Changed

- README: add header badges, navigation links, preview images, and build step docs

## [0.1.0] - 2026-08-15

### Added

- Initial release with 8 colorscheme variants
- Formosa: Jiufen (dark), Lam-ni (dark), Hue-poo (light)
- Nippon: Rouiro (dark), Sumi (dark), Koiai (dark), Torinoko (light), Shironeri (light)
- Plugin support: gitsigns, telescope, fzf-lua, blink.cmp, snacks, lazy, neo-tree, mini
- `on_colors` and `on_highlights` hooks
- `transparent` mode
- Auto-detection of installed plugins via lazy.nvim
- Tests and stylua formatting CI
