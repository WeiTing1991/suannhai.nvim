local project_root = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":h:h")
package.path = project_root .. "/lua/?.lua;" .. project_root .. "/lua/?/init.lua;" .. package.path

local h = dofile(project_root .. "/tests/helpers.lua")
local config = require("suannhai.config")

h.describe("config defaults", function()
  h.it("has correct default values", function()
    h.assert_eq(config.defaults.transparent, false)
    h.assert_type(config.defaults.on_colors, "function")
    h.assert_type(config.defaults.on_highlights, "function")
    h.assert_eq(config.defaults.plugins.all, true)
    h.assert_eq(config.defaults.plugins.auto, true)
  end)
end)

h.describe("config.setup()", function()
  h.it("uses defaults when called with no args", function()
    config.setup()
    h.assert_eq(config.options.transparent, false)
    h.assert_eq(config.options.plugins.all, true)
  end)

  h.it("merges user options with defaults", function()
    config.setup({ transparent = true })
    h.assert_eq(config.options.transparent, true)
    h.assert_eq(config.options.plugins.all, true)
  end)

  h.it("overrides plugin settings", function()
    config.setup({ plugins = { all = false, auto = false } })
    h.assert_eq(config.options.plugins.all, false)
    h.assert_eq(config.options.plugins.auto, false)
  end)
end)

h.describe("config.extend()", function()
  h.it("returns current options when called with nil", function()
    config.setup({ transparent = true })
    local result = config.extend()
    h.assert_eq(result.transparent, true)
  end)

  h.it("merges additional opts on top of current options", function()
    config.setup({ transparent = true })
    local result = config.extend({ transparent = false })
    h.assert_eq(result.transparent, false)
    -- original not mutated
    h.assert_eq(config.options.transparent, true)
  end)
end)

h.report()
