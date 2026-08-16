-- suannhai-nvim/lua/suannhai/groups/semantic_tokens.lua
local M = {}

---@param c table palette
---@param opts suannhai.Config
---@return table
function M.get(c, _opts)
  return {
    ["@lsp.type.class"] = "@type",
    ["@lsp.type.comment"] = "@comment",
    ["@lsp.type.decorator"] = { fg = c.constant },
    ["@lsp.type.enum"] = "@type",
    ["@lsp.type.enumMember"] = { fg = c.constant },
    ["@lsp.type.function"] = "@function",
    ["@lsp.type.interface"] = "@type",
    ["@lsp.type.keyword"] = "@keyword",
    ["@lsp.type.macro"] = { fg = c.keyword },
    ["@lsp.type.method"] = "@function.method",
    ["@lsp.type.namespace"] = "@module",
    ["@lsp.type.number"] = "@number",
    ["@lsp.type.operator"] = "@operator",
    ["@lsp.type.parameter"] = "@variable.parameter",
    ["@lsp.type.property"] = "@property",
    ["@lsp.type.string"] = "@string",
    ["@lsp.type.struct"] = "@type",
    ["@lsp.type.type"] = "@type",
    ["@lsp.type.typeParameter"] = "@type",
    ["@lsp.type.variable"] = "@variable",

    ["@lsp.mod.deprecated"] = { strikethrough = true },
    ["@lsp.mod.readonly"] = { fg = c.constant },
    ["@lsp.mod.defaultLibrary"] = { fg = c.type },

    ["@lsp.typemod.function.defaultLibrary"] = "@function.builtin",
    ["@lsp.typemod.variable.defaultLibrary"] = { fg = c.type },
  }
end

return M
