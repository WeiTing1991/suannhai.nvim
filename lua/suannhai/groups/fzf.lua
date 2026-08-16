-- suannhai-nvim/lua/suannhai/groups/fzf.lua
local M = {}

function M.get(c, opts)
  local transparent = opts.transparent
  return {
    FzfLuaNormal       = { fg = c.fg, bg = transparent and c.none or c.surface },
    FzfLuaBorder       = { fg = c.border, bg = transparent and c.none or c.surface },
    FzfLuaTitle        = { fg = c.func, bold = true },
    FzfLuaHeaderBind   = { fg = c.keyword },
    FzfLuaHeaderText   = { fg = c.comment },
    FzfLuaFzfMatch     = { fg = c.keyword },
    FzfLuaFzfCursorLine = { bg = c.selection },
    FzfLuaFzfNormal    = { fg = c.fg },
    FzfLuaFzfPointer   = { fg = c.keyword },
    FzfLuaFzfSeparator = { fg = c.border },
    FzfLuaCursorLine   = { bg = c.selection },
    FzfLuaPreviewNormal = { fg = c.fg, bg = transparent and c.none or c.bg },
    FzfLuaPreviewBorder = { fg = c.border, bg = transparent and c.none or c.bg },
    FzfLuaPreviewTitle = { fg = c.func },
  }
end

return M
