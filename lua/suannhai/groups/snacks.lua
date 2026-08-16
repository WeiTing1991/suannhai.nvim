-- suannhai-nvim/lua/suannhai/groups/snacks.lua
local M = {}

function M.get(c, opts)
  local transparent = opts.transparent
  return {
    SnacksNormal = { fg = c.fg, bg = transparent and c.none or c.surface },
    SnacksBorder = { fg = c.border },
    SnacksTitle = { fg = c.func, bold = true },
    SnacksNotifierInfo = { fg = c.info },
    SnacksNotifierWarn = { fg = c.warning },
    SnacksNotifierError = { fg = c.error },
    SnacksNotifierDebug = { fg = c.comment },
    SnacksNotifierTrace = { fg = c.hint },
    SnacksDashboardHeader = { fg = c.keyword },
    SnacksDashboardFooter = { fg = c.comment },
    SnacksDashboardKey = { fg = c.constant },
    SnacksDashboardIcon = { fg = c.type },
    SnacksDashboardDesc = { fg = c.fg },
    SnacksDashboardSpecial = { fg = c.func },
    SnacksIndent = { fg = c.border },
    SnacksIndentScope = { fg = c.comment },
  }
end

return M
