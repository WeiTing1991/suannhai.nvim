-- suannhai-nvim/lua/suannhai/util.lua
local M = {}

--- Convert hex string to RGB table
---@param hex string
---@return number, number, number
function M.hex_to_rgb(hex)
  hex = hex:gsub("#", "")
  return tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16)
end

--- Convert RGB values to hex string
---@param r number
---@param g number
---@param b number
---@return string
function M.rgb_to_hex(r, g, b)
  return string.format("#%02x%02x%02x", math.floor(r + 0.5), math.floor(g + 0.5), math.floor(b + 0.5))
end

--- Blend two hex colors. alpha=0 returns bg, alpha=1 returns fg.
---@param fg string hex color
---@param bg string hex color
---@param alpha number 0-1
---@return string hex color
function M.blend(fg, bg, alpha)
  local r1, g1, b1 = M.hex_to_rgb(fg)
  local r2, g2, b2 = M.hex_to_rgb(bg)
  local r = r1 * alpha + r2 * (1 - alpha)
  local g = g1 * alpha + g2 * (1 - alpha)
  local b = b1 * alpha + b2 * (1 - alpha)
  return M.rgb_to_hex(r, g, b)
end

--- Blend a color toward a background color
---@param color string hex color
---@param alpha number 0-1
---@param bg string hex background
---@return string hex color
function M.blend_bg(color, alpha, bg)
  return M.blend(color, bg, alpha)
end

--- Brighten a hex color by the given amount (0-1)
---@param color string hex color
---@param amount? number 0-1, default 0.3
---@return string hex color
function M.brighten(color, amount)
  amount = amount or 0.3
  return M.blend(color, "#ffffff", amount)
end

--- Darken a hex color by the given amount (0-1)
---@param color string hex color
---@param amount? number 0-1, default 0.3
---@return string hex color
function M.darken(color, amount)
  amount = amount or 0.3
  return M.blend(color, "#000000", amount)
end

--- Safely require a module
---@param modname string
---@return table
function M.mod(modname)
  local ok, mod = pcall(require, modname)
  if not ok then
    error("suannhai: failed to load module " .. modname .. ": " .. tostring(mod))
  end
  return mod
end

--- Resolve string links in a highlights table.
--- If a value is a string, replace it with { link = value }.
---@param highlights table
function M.resolve(highlights)
  for group, hl in pairs(highlights) do
    if type(hl) == "string" then
      highlights[group] = { link = hl }
    end
  end
end

return M
