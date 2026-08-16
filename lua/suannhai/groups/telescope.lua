-- suannhai-nvim/lua/suannhai/groups/telescope.lua
local M = {}

function M.get(c, opts)
  local transparent = opts.transparent
  return {
    TelescopeNormal         = { fg = c.fg, bg = transparent and c.none or c.surface },
    TelescopeBorder         = { fg = c.border, bg = transparent and c.none or c.surface },
    TelescopeTitle          = { fg = c.func, bold = true },
    TelescopePromptNormal   = { fg = c.fg, bg = transparent and c.none or c.surface },
    TelescopePromptBorder   = { fg = c.border, bg = transparent and c.none or c.surface },
    TelescopePromptTitle    = { fg = c.func, bold = true },
    TelescopePromptPrefix   = { fg = c.keyword },
    TelescopePromptCounter  = { fg = c.comment },
    TelescopeResultsNormal  = { fg = c.fg, bg = transparent and c.none or c.surface },
    TelescopeResultsBorder  = { fg = c.border, bg = transparent and c.none or c.surface },
    TelescopeResultsTitle   = { fg = c.func },
    TelescopePreviewNormal  = { fg = c.fg, bg = transparent and c.none or c.bg },
    TelescopePreviewBorder  = { fg = c.border, bg = transparent and c.none or c.bg },
    TelescopePreviewTitle   = { fg = c.func },
    TelescopeSelection      = { bg = c.selection },
    TelescopeSelectionCaret = { fg = c.keyword },
    TelescopeMatching       = { fg = c.keyword, bold = true },
    TelescopeMultiSelection = { fg = c.type },
    TelescopeMultiIcon      = { fg = c.type },
  }
end

return M
