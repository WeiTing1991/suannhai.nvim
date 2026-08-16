-- suannhai-nvim/lua/suannhai/groups/mini.lua
local M = {}

function M.get(c, _opts)
  return {
    MiniCursorword = { underline = true },
    MiniCursorwordCurrent = { underline = true },

    MiniIndentscopeSymbol = { fg = c.border },
    MiniIndentscopePrefix = { nocombine = true },

    MiniStatuslineDevinfo = { fg = c.fg, bg = c.surface },
    MiniStatuslineFileinfo = { fg = c.fg, bg = c.surface },
    MiniStatuslineFilename = { fg = c.comment, bg = c.bg },
    MiniStatuslineInactive = { fg = c.comment, bg = c.bg },
    MiniStatuslineModeNormal = { fg = c.bg, bg = c.type, bold = true },
    MiniStatuslineModeInsert = { fg = c.bg, bg = c.string, bold = true },
    MiniStatuslineModeVisual = { fg = c.bg, bg = c.number, bold = true },
    MiniStatuslineModeReplace = { fg = c.bg, bg = c.keyword, bold = true },
    MiniStatuslineModeCommand = { fg = c.bg, bg = c.func, bold = true },

    MiniTablineCurrent = { fg = c.fg, bg = c.bg, bold = true },
    MiniTablineVisible = { fg = c.comment, bg = c.surface },
    MiniTablineHidden = { fg = c.comment, bg = c.surface },
    MiniTablineModifiedCurrent = { fg = c.constant, bg = c.bg, bold = true },
    MiniTablineModifiedVisible = { fg = c.constant, bg = c.surface },
    MiniTablineModifiedHidden = { fg = c.constant, bg = c.surface },
    MiniTablineFill = { bg = c.surface },
    MiniTablineTabpagesection = { fg = c.bg, bg = c.keyword },

    MiniDiffSignAdd = { fg = c.git.add },
    MiniDiffSignChange = { fg = c.git.change },
    MiniDiffSignDelete = { fg = c.git.delete },

    MiniPickNormal = { fg = c.fg, bg = c.surface },
    MiniPickBorder = { fg = c.border, bg = c.surface },
    MiniPickMatchCur = { bold = true },
    MiniPickMatchMarked = { fg = c.keyword, bold = true },
    MiniPickMatchRanges = { fg = c.keyword },

    MiniIconsAzure = { fg = c.type },
    MiniIconsBlue = { fg = c.type },
    MiniIconsCyan = { fg = c.type },
    MiniIconsGreen = { fg = c.string },
    MiniIconsGrey = { fg = c.comment },
    MiniIconsOrange = { fg = c.constant },
    MiniIconsPurple = { fg = c.number },
    MiniIconsRed = { fg = c.keyword },
    MiniIconsYellow = { fg = c.func },
  }
end

return M
