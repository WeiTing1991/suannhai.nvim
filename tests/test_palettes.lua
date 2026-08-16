local project_root = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":h:h")
package.path = project_root .. "/lua/?.lua;" .. project_root .. "/lua/?/init.lua;" .. package.path

local h = dofile(project_root .. "/tests/helpers.lua")
local config = require("suannhai.config")

config.setup()

h.describe("palettes", function()
  local styles = {
    "jiufen", "lam-ni", "hue-poo",
    "rouiro", "sumi", "koiai", "torinoko", "shironeri",
  }

  for _, style in ipairs(styles) do
    h.it("palette " .. style .. " has required fields", function()
      local palette = require("suannhai.palettes." .. style)
      h.assert_type(palette.bg, "string")
      h.assert_type(palette.fg, "string")
      h.assert_type(palette.surface, "string")
      h.assert_type(palette.border, "string")
      h.assert_type(palette.comment, "string")
      h.assert_type(palette.keyword, "string")
      h.assert_type(palette.func, "string")
      h.assert_type(palette.string, "string")
      h.assert_type(palette.type, "string")
      h.assert_type(palette.number, "string")
      h.assert_type(palette.constant, "string")
      h.assert_type(palette.error, "string")
      h.assert_true(palette.appearance == "dark" or palette.appearance == "light")
    end)

    h.it("palette " .. style .. " produces valid derived colors", function()
      local palettes = require("suannhai.palettes")
      local colors = palettes.setup(style, config.options)
      h.assert_type(colors.bg_dark, "string")
      h.assert_type(colors.selection, "string")
      h.assert_type(colors.line_nr, "string")
      h.assert_type(colors.cursor_line, "string")
      h.assert_type(colors.warning, "string")
      h.assert_type(colors.info, "string")
      h.assert_type(colors.hint, "string")
      h.assert_type(colors.ok, "string")
      h.assert_type(colors.diff, "table")
      h.assert_type(colors.git, "table")
      h.assert_type(colors.terminal, "table")
      -- clear cached module for next iteration
      package.loaded["suannhai.palettes." .. style] = nil
    end)
  end
end)

h.report()
