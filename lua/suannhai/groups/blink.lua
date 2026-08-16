-- suannhai-nvim/lua/suannhai/groups/blink.lua
local M = {}

function M.get(c, opts)
  local transparent = opts.transparent
  return {
    BlinkCmpMenu            = { fg = c.fg, bg = transparent and c.none or c.surface },
    BlinkCmpMenuBorder      = { fg = c.border, bg = transparent and c.none or c.surface },
    BlinkCmpMenuSelection   = { bg = c.selection },
    BlinkCmpLabel           = { fg = c.fg },
    BlinkCmpLabelMatch      = { fg = c.keyword, bold = true },
    BlinkCmpLabelDeprecated = { fg = c.comment, strikethrough = true },
    BlinkCmpKind            = { fg = c.type },
    BlinkCmpKindFunction    = { fg = c.func },
    BlinkCmpKindMethod      = { fg = c.func },
    BlinkCmpKindVariable    = { fg = c.fg },
    BlinkCmpKindField       = { fg = c.fg },
    BlinkCmpKindKeyword     = { fg = c.keyword },
    BlinkCmpKindClass       = { fg = c.type },
    BlinkCmpKindStruct      = { fg = c.type },
    BlinkCmpKindInterface   = { fg = c.type },
    BlinkCmpKindModule      = { fg = c.constant },
    BlinkCmpKindProperty    = { fg = c.fg },
    BlinkCmpKindConstant    = { fg = c.constant },
    BlinkCmpKindSnippet     = { fg = c.string },
    BlinkCmpKindText        = { fg = c.comment },
    BlinkCmpKindValue       = { fg = c.constant },
    BlinkCmpKindEnum        = { fg = c.type },
    BlinkCmpKindEnumMember  = { fg = c.constant },
    BlinkCmpDoc             = { fg = c.fg, bg = transparent and c.none or c.surface },
    BlinkCmpDocBorder       = { fg = c.border, bg = transparent and c.none or c.surface },
    BlinkCmpSignatureHelp       = { fg = c.fg, bg = transparent and c.none or c.surface },
    BlinkCmpSignatureHelpBorder = { fg = c.border, bg = transparent and c.none or c.surface },
  }
end

return M
