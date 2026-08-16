-- suannhai-nvim/lua/suannhai/groups/lazy.lua
local M = {}

function M.get(c, opts)
  return {
    LazyButton = { fg = c.fg, bg = c.surface },
    LazyButtonActive = { fg = c.bg, bg = c.keyword },
    LazyH1 = { fg = c.bg, bg = c.keyword, bold = true },
    LazyH2 = { fg = c.func, bold = true },
    LazyComment = { fg = c.comment },
    LazyNormal = { fg = c.fg, bg = c.bg },
    LazySpecial = { fg = c.constant },
    LazyProgressDone = { fg = c.keyword },
    LazyProgressTodo = { fg = c.border },
    LazyReasonPlugin = { fg = c.type },
    LazyReasonCmd = { fg = c.func },
    LazyReasonEvent = { fg = c.constant },
    LazyReasonFt = { fg = c.string },
    LazyReasonKeys = { fg = c.number },
    LazyReasonStart = { fg = c.keyword },
  }
end

return M
