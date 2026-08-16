local project_root = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":h:h")
package.path = project_root .. "/lua/?.lua;" .. project_root .. "/lua/?/init.lua;" .. package.path

local h = dofile(project_root .. "/tests/helpers.lua")
local util = require("suannhai.util")

h.describe("util.hex_to_rgb()", function()
  h.it("converts black", function()
    local r, g, b = util.hex_to_rgb("#000000")
    h.assert_eq(r, 0)
    h.assert_eq(g, 0)
    h.assert_eq(b, 0)
  end)

  h.it("converts white", function()
    local r, g, b = util.hex_to_rgb("#ffffff")
    h.assert_eq(r, 255)
    h.assert_eq(g, 255)
    h.assert_eq(b, 255)
  end)

  h.it("converts arbitrary color", function()
    local r, g, b = util.hex_to_rgb("#E05A4E")
    h.assert_eq(r, 224)
    h.assert_eq(g, 90)
    h.assert_eq(b, 78)
  end)

  h.it("handles without hash prefix", function()
    local r, g, b = util.hex_to_rgb("ff0000")
    h.assert_eq(r, 255)
    h.assert_eq(g, 0)
    h.assert_eq(b, 0)
  end)
end)

h.describe("util.rgb_to_hex()", function()
  h.it("converts black", function()
    h.assert_eq(util.rgb_to_hex(0, 0, 0), "#000000")
  end)

  h.it("converts white", function()
    h.assert_eq(util.rgb_to_hex(255, 255, 255), "#ffffff")
  end)

  h.it("rounds fractional values", function()
    h.assert_eq(util.rgb_to_hex(127.6, 0, 0), "#800000")
  end)
end)

h.describe("util.blend()", function()
  h.it("alpha=0 returns bg", function()
    h.assert_eq(util.blend("#ff0000", "#0000ff", 0), "#0000ff")
  end)

  h.it("alpha=1 returns fg", function()
    h.assert_eq(util.blend("#ff0000", "#0000ff", 1), "#ff0000")
  end)

  h.it("alpha=0.5 returns midpoint", function()
    local result = util.blend("#ff0000", "#0000ff", 0.5)
    h.assert_eq(result, "#800080")
  end)
end)

h.describe("util.brighten()", function()
  h.it("brightens toward white", function()
    local result = util.brighten("#000000", 0.5)
    h.assert_eq(result, "#808080")
  end)
end)

h.describe("util.darken()", function()
  h.it("darkens toward black", function()
    local result = util.darken("#ffffff", 0.5)
    h.assert_eq(result, "#808080")
  end)
end)

h.describe("util.resolve()", function()
  h.it("converts string values to link tables", function()
    local highlights = {
      Normal = { fg = "#ffffff" },
      NormalFloat = "Normal",
    }
    util.resolve(highlights)
    h.assert_eq(highlights.NormalFloat, { link = "Normal" })
    h.assert_eq(highlights.Normal, { fg = "#ffffff" })
  end)
end)

h.report()
