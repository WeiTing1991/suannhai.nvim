-- suannhai-nvim/lua/suannhai/groups/treesitter.lua
local M = {}

---@param c table palette
---@param opts suannhai.Config
---@return table
function M.get(c, _opts)
  return {
    -- Identifiers
    ["@variable"] = { fg = c.fg },
    ["@variable.builtin"] = { fg = c.keyword },
    ["@variable.parameter"] = { fg = c.fg },
    ["@variable.member"] = { fg = c.fg },
    ["@variable.special"] = { fg = c.keyword },

    -- Constants
    ["@constant"] = { fg = c.constant },
    ["@constant.builtin"] = { fg = c.constant },
    ["@constant.macro"] = { fg = c.keyword },

    -- Modules
    ["@module"] = { fg = c.comment },
    ["@module.builtin"] = { fg = c.comment },
    ["@label"] = { fg = c.keyword },

    -- Strings
    ["@string"] = { fg = c.string },
    ["@string.documentation"] = { fg = c.comment },
    ["@string.regexp"] = { fg = c.string },
    ["@string.escape"] = { fg = c.constant },
    ["@string.special"] = { fg = c.constant },
    ["@string.special.symbol"] = { fg = c.constant },

    -- Characters
    ["@character"] = { fg = c.string },
    ["@character.special"] = { fg = c.constant },

    -- Booleans & Numbers
    ["@boolean"] = { fg = c.constant },
    ["@number"] = { fg = c.number },
    ["@number.float"] = { fg = c.number },

    -- Types
    ["@type"] = { fg = c.type },
    ["@type.builtin"] = { fg = c.type },
    ["@type.definition"] = { fg = c.type },
    ["@type.qualifier"] = { fg = c.keyword },

    -- Attributes / Annotations
    ["@attribute"] = { fg = c.constant },
    ["@property"] = { fg = c.fg },

    -- Functions
    ["@function"] = { fg = c.func },
    ["@function.builtin"] = { fg = c.func },
    ["@function.call"] = { fg = c.func },
    ["@function.macro"] = { fg = c.keyword },
    ["@function.method"] = { fg = c.func },
    ["@function.method.call"] = { fg = c.func },

    -- Constructor
    ["@constructor"] = { fg = c.type },

    -- Operators & Punctuation
    ["@operator"] = { fg = c.comment },
    ["@punctuation.bracket"] = { fg = c.comment },
    ["@punctuation.delimiter"] = { fg = c.comment },
    ["@punctuation.special"] = { fg = c.comment },

    -- Keywords
    ["@keyword"] = { fg = c.keyword },
    ["@keyword.modifier"] = { fg = c.keyword },
    ["@keyword.type"] = { fg = c.keyword },
    ["@keyword.coroutine"] = { fg = c.keyword },
    ["@keyword.function"] = { fg = c.keyword },
    ["@keyword.operator"] = { fg = c.comment },
    ["@keyword.import"] = { fg = c.keyword },
    ["@keyword.export"] = { fg = c.keyword },
    ["@keyword.repeat"] = { fg = c.keyword },
    ["@keyword.return"] = { fg = c.keyword },
    ["@keyword.debug"] = { fg = c.keyword },
    ["@keyword.exception"] = { fg = c.keyword },
    ["@keyword.conditional"] = { fg = c.keyword },
    ["@keyword.conditional.ternary"] = { fg = c.keyword },
    ["@keyword.directive"] = { fg = c.comment },
    ["@keyword.directive.define"] = { fg = c.comment },
    ["@keyword.storage"] = { fg = c.keyword },

    -- Comments
    ["@comment"] = { fg = c.comment },
    ["@comment.documentation"] = { fg = c.comment },
    ["@comment.error"] = { fg = c.error },
    ["@comment.warning"] = { fg = c.warning },
    ["@comment.info"] = { fg = c.info },
    ["@comment.hint"] = { fg = c.hint },
    ["@comment.todo"] = { fg = c.fg, bold = true },
    ["@comment.note"] = { fg = c.fg, bold = true },

    -- Tags (HTML/JSX)
    ["@tag"] = { fg = c.type },
    ["@tag.attribute"] = { fg = c.func },
    ["@tag.delimiter"] = { fg = c.comment },
    ["@tag.builtin"] = { fg = c.type },

    -- Markup (Markdown)
    ["@markup"] = { fg = c.fg },
    ["@markup.heading"] = { fg = c.func, bold = true },
    ["@markup.italic"] = { italic = true },
    ["@markup.strong"] = { bold = true },
    ["@markup.strikethrough"] = { strikethrough = true },
    ["@markup.underline"] = { underline = true },
    ["@markup.raw"] = { fg = c.string },
    ["@markup.raw.markdown_inline"] = { fg = c.constant },
    ["@markup.link"] = { fg = c.type },
    ["@markup.link.label"] = { fg = c.type },
    ["@markup.link.url"] = { fg = c.string, underline = true },
    ["@markup.list"] = { fg = c.comment },
    ["@markup.list.checked"] = { fg = c.ok },
    ["@markup.list.unchecked"] = { fg = c.comment },
    ["@markup.math"] = { fg = c.number },

    -- Diff
    ["@diff.plus"] = { fg = c.git.add },
    ["@diff.minus"] = { fg = c.git.delete },
    ["@diff.delta"] = { fg = c.git.change },

    -- Misc
    ["@none"] = {},
    ["@annotation"] = "PreProc",
  }
end

return M
