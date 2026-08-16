-- suannhai-nvim/lua/suannhai/palettes/init.lua
local Util = require("suannhai.util")

local M = {}

---@param style string
---@param opts suannhai.Config
---@return table
function M.setup(style, opts)
  local raw = vim.deepcopy(Util.mod("suannhai.palettes." .. style))

  local is_light = raw.appearance == "light"

  -- Derived neutrals
  raw.bg_dark = is_light and Util.blend(raw.bg, "#ffffff", 0.7) or Util.darken(raw.bg, 0.15)
  raw.selection = Util.blend_bg(raw.border, 0.6, raw.bg)
  raw.line_nr = Util.blend_bg(raw.comment, 0.4, raw.bg)
  raw.cursor_line = Util.blend_bg(raw.surface, 0.5, raw.bg)

  -- Diagnostics derived from accents
  raw.warning = raw.func
  raw.info = raw.type
  raw.hint = raw.comment
  raw.ok = raw.string

  -- Diff backgrounds
  raw.diff = {
    add = Util.blend_bg(raw.string, 0.15, raw.bg),
    delete = Util.blend_bg(raw.error, 0.15, raw.bg),
    change = Util.blend_bg(raw.constant, 0.12, raw.bg),
    text = Util.blend_bg(raw.constant, 0.30, raw.bg),
  }

  -- Git colors (foreground)
  raw.git = {
    add = raw.string,
    delete = raw.error,
    change = raw.constant,
  }

  -- Terminal colors (ANSI 0-15), matching WezTerm mapping
  -- ansi: [surface, keyword, string, func, type, number, constant, fg]
  -- brights: [comment, bright_keyword, bright_string, bright_func, bright_type, bright_number, bright_constant, bright_fg]
  local bright_amount = is_light and 0.3 or 0.25
  raw.terminal = {
    [0] = raw.surface, -- black
    [1] = raw.keyword, -- red
    [2] = raw.string, -- green
    [3] = raw.func, -- yellow
    [4] = raw.type, -- blue
    [5] = raw.number, -- magenta
    [6] = raw.constant, -- cyan
    [7] = raw.fg, -- white
    [8] = raw.comment, -- bright black
    [9] = Util.brighten(raw.keyword, bright_amount), -- bright red
    [10] = Util.brighten(raw.string, bright_amount), -- bright green
    [11] = Util.brighten(raw.func, bright_amount), -- bright yellow
    [12] = Util.brighten(raw.type, bright_amount), -- bright blue
    [13] = Util.brighten(raw.number, bright_amount), -- bright magenta
    [14] = Util.brighten(raw.constant, bright_amount), -- bright cyan
    [15] = is_light and raw.bg or "#ffffff", -- bright white
  }

  raw.none = "NONE"

  -- User hook
  if opts.on_colors then
    opts.on_colors(raw)
  end

  return raw
end

return M
