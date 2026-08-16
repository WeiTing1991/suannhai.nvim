-- suannhai-nvim/lua/suannhai/init.lua
local config = require("suannhai.config")

local M = {}

---@param opts? suannhai.Config
function M.setup(opts)
  config.setup(opts)
end

---@param style string variant name (e.g. "jiufen")
function M.load(style)
  local ok, err = pcall(function()
    return require("suannhai.theme").setup(style)
  end)
  if not ok then
    vim.notify("suannhai: failed to load colorscheme: " .. tostring(err), vim.log.levels.ERROR)
  end
end

return M
