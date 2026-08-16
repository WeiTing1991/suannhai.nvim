-- suannhai-nvim/lua/suannhai/theme.lua
local M = {}

---@param style string variant name (e.g. "jiufen")
---@param opts? suannhai.Config
function M.setup(style, opts)
  opts = require("suannhai.config").extend(opts)

  local colors = require("suannhai.palettes").setup(style, opts)
  local groups = require("suannhai.groups").setup(colors, opts)

  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "suannhai-" .. style

  local terminal_colors = nil

  for group, hl in pairs(groups) do
    if group == "_terminal_colors" then
      terminal_colors = hl
    else
      hl = type(hl) == "string" and { link = hl } or hl
      vim.api.nvim_set_hl(0, group, hl)
    end
  end

  if terminal_colors then
    for i = 0, 15 do
      vim.g["terminal_color_" .. i] = terminal_colors[i]
    end
  end

  return colors, groups, opts
end

return M
