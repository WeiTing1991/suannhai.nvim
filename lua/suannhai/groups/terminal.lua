-- suannhai-nvim/lua/suannhai/groups/terminal.lua
local M = {}

---@param c table palette
---@param opts suannhai.Config
---@return table
function M.get(c, opts)
  return {
    _terminal_colors = c.terminal,
  }
end

return M
