-- suannhai-nvim/lua/suannhai/groups/syntax.lua
local M = {}

---@param c table palette
---@param opts suannhai.Config
---@return table
function M.get(c, opts)
  return {
    Comment = { fg = c.comment },
    Constant = { fg = c.constant },
    String = { fg = c.string },
    Character = { fg = c.string },
    Number = { fg = c.number },
    Boolean = { fg = c.constant },
    Float = { fg = c.number },

    Identifier = { fg = c.fg },
    Function = { fg = c.func },

    Statement = { fg = c.keyword },
    Conditional = { fg = c.keyword },
    Repeat = { fg = c.keyword },
    Label = { fg = c.keyword },
    Operator = { fg = c.comment },
    Keyword = { fg = c.keyword },
    Exception = { fg = c.keyword },

    PreProc = { fg = c.comment },
    Include = { fg = c.keyword },
    Define = { fg = c.comment },
    Macro = { fg = c.keyword },
    PreCondit = { fg = c.keyword },

    Type = { fg = c.type },
    StorageClass = { fg = c.keyword },
    Structure = { fg = c.type },
    Typedef = { fg = c.type },

    Special = { fg = c.constant },
    SpecialChar = { fg = c.constant },
    Delimiter = { fg = c.comment },
    Debug = { fg = c.keyword },
    Tag = { fg = c.type },

    Error = { fg = c.error },
    Todo = { fg = c.fg, bold = true },
    Underlined = { underline = true },

    Added = { fg = c.git.add },
    Changed = { fg = c.git.change },
    Removed = { fg = c.git.delete },
  }
end

return M
