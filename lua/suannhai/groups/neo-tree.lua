-- suannhai-nvim/lua/suannhai/groups/neo-tree.lua
local M = {}

function M.get(c, opts)
  local transparent = opts.transparent
  return {
    NeoTreeNormal          = { fg = c.fg, bg = transparent and c.none or c.surface },
    NeoTreeNormalNC        = { fg = c.fg, bg = transparent and c.none or c.surface },
    NeoTreeDimText         = { fg = c.comment },
    NeoTreeDirectoryIcon   = { fg = c.type },
    NeoTreeDirectoryName   = { fg = c.type },
    NeoTreeRootName        = { fg = c.func, bold = true },
    NeoTreeFileName        = { fg = c.fg },
    NeoTreeFileIcon        = { fg = c.comment },
    NeoTreeIndentMarker    = { fg = c.border },
    NeoTreeExpander        = { fg = c.comment },
    NeoTreeGitAdded        = { fg = c.git.add },
    NeoTreeGitModified     = { fg = c.git.change },
    NeoTreeGitDeleted      = { fg = c.git.delete },
    NeoTreeGitConflict     = { fg = c.constant },
    NeoTreeGitUntracked    = { fg = c.comment },
    NeoTreeGitIgnored      = { fg = c.border },
    NeoTreeFloatBorder     = { fg = c.border },
    NeoTreeFloatTitle      = { fg = c.func },
    NeoTreeTitleBar        = { fg = c.bg, bg = c.func },
    NeoTreeCursorLine      = { bg = c.selection },
    NeoTreeWinSeparator    = { fg = c.border },
  }
end

return M
