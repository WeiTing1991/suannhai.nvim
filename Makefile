.PHONY: test lint

test:
	nvim --headless --noplugin -u NONE -l tests/test_config.lua
	nvim --headless --noplugin -u NONE -l tests/test_util.lua
	nvim --headless --noplugin -u NONE -l tests/test_palettes.lua

lint:
	stylua --check lua
