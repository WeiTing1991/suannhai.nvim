-- suannhai-nvim/lua/suannhai/config.lua
local M = {}

---@class suannhai.Config
---@field transparent? boolean
---@field on_colors? fun(colors: table)
---@field on_highlights? fun(highlights: table, colors: table)
---@field plugins? table
M.defaults = {
  transparent = false,
  on_colors = function(colors) end,
  on_highlights = function(highlights, colors) end,
  plugins = {
    all = true,
    auto = true,
  },
}

---@type suannhai.Config
M.options = nil

---@param opts? suannhai.Config
function M.setup(opts)
  M.options = vim.tbl_deep_extend("force", {}, M.defaults, opts or {})
end

---@param opts? suannhai.Config
---@return suannhai.Config
function M.extend(opts)
  return opts and vim.tbl_deep_extend("force", {}, M.options or M.defaults, opts) or (M.options or M.defaults)
end

setmetatable(M, {
  __index = function(_, k)
    if k == "options" then
      return M.defaults
    end
  end,
})

return M
