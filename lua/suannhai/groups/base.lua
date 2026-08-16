-- suannhai-nvim/lua/suannhai/groups/base.lua
local M = {}

---@param c table palette
---@param opts suannhai.Config
---@return table
function M.get(c, opts)
  local transparent = opts.transparent

  return {
    Normal       = { fg = c.fg, bg = transparent and c.none or c.bg },
    NormalFloat  = { fg = c.fg, bg = transparent and c.none or c.surface },
    NormalNC     = { fg = c.fg, bg = transparent and c.none or c.bg },
    FloatBorder  = { fg = c.border, bg = transparent and c.none or c.surface },
    FloatTitle   = { fg = c.fg, bg = transparent and c.none or c.surface },

    Cursor       = { fg = c.bg, bg = c.fg },
    CursorLine   = { bg = transparent and c.none or c.cursor_line },
    CursorLineNr = { fg = c.fg },
    CursorColumn = { bg = transparent and c.none or c.cursor_line },
    LineNr       = { fg = c.line_nr },
    SignColumn   = { fg = c.comment },

    ColorColumn  = { bg = c.surface },
    Conceal      = { fg = c.comment },

    Visual       = { bg = c.selection },
    Search       = { fg = c.fg, bg = c.border },
    IncSearch    = { fg = c.bg, bg = c.constant },
    CurSearch    = { fg = c.bg, bg = c.constant },
    Substitute   = { fg = c.bg, bg = c.keyword },

    Pmenu        = { fg = c.fg, bg = c.surface },
    PmenuSel     = { bg = c.selection },
    PmenuSbar    = { bg = c.surface },
    PmenuThumb   = { bg = c.border },
    PmenuKind    = { fg = c.type, bg = c.surface },
    PmenuKindSel = { fg = c.type, bg = c.selection },

    StatusLine   = { fg = c.fg, bg = transparent and c.none or c.surface },
    StatusLineNC = { fg = c.comment, bg = transparent and c.none or c.surface },
    TabLine      = { fg = c.comment, bg = c.surface },
    TabLineFill  = { bg = c.bg },
    TabLineSel   = { fg = c.fg, bg = c.bg },

    WinBar       = { bg = transparent and c.none or c.bg },
    WinBarNC     = { bg = transparent and c.none or c.bg },
    WinSeparator = { fg = c.border },
    VertSplit    = { fg = c.border },

    Folded       = { fg = c.comment, bg = c.selection },
    FoldColumn   = { fg = c.comment, bg = transparent and c.none or c.bg },

    DiffAdd      = { bg = c.diff.add },
    DiffChange   = { bg = c.diff.change },
    DiffDelete   = { bg = c.diff.delete },
    DiffText     = { bg = c.diff.text },

    DiagnosticError          = { fg = c.error },
    DiagnosticWarn           = { fg = c.warning },
    DiagnosticInfo           = { fg = c.info },
    DiagnosticHint           = { fg = c.hint },
    DiagnosticOk             = { fg = c.ok },
    DiagnosticUnderlineError = { undercurl = true, sp = c.error },
    DiagnosticUnderlineWarn  = { undercurl = true, sp = c.warning },
    DiagnosticUnderlineInfo  = { undercurl = true, sp = c.info },
    DiagnosticUnderlineHint  = { undercurl = true, sp = c.hint },
    DiagnosticUnderlineOk    = { undercurl = true, sp = c.ok },

    Error        = { fg = c.error },
    ErrorMsg     = { fg = c.error },
    WarningMsg   = { fg = c.warning },
    ModeMsg      = { fg = c.ok },
    MoreMsg      = { fg = c.type },
    Question     = { fg = c.ok },

    MatchParen   = { fg = c.constant, bold = true },
    NonText      = { fg = c.border },
    SpecialKey   = { fg = c.border },
    Whitespace   = { fg = c.border },

    Directory    = { fg = c.type },
    Title        = { fg = c.func, bold = true },
    QuickFixLine = { bg = c.selection },
    MsgSeparator = { fg = c.border },

    SpellBad     = { sp = c.error, undercurl = true },
    SpellCap     = { sp = c.warning, undercurl = true },
    SpellLocal   = { sp = c.info, undercurl = true },
    SpellRare    = { sp = c.hint, undercurl = true },

    -- LSP references
    LspReferenceRead  = { bg = c.selection },
    LspReferenceWrite = { bg = c.selection },
    LspReferenceText  = { bg = c.selection },
    LspSignatureActiveParameter = { fg = c.warning },
  }
end

return M
