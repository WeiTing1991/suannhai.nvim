-- suannhai-nvim/lua/suannhai/groups/init.lua
local Util = require("suannhai.util")

local M = {}

-- Plugin name -> group module name
M.plugins = {
  ["gitsigns.nvim"]           = "gitsigns",
  ["telescope.nvim"]          = "telescope",
  ["fzf-lua"]                 = "fzf",
  ["blink.cmp"]               = "blink",
  ["snacks.nvim"]             = "snacks",
  ["lazy.nvim"]               = "lazy",
  ["neo-tree.nvim"]           = "neo-tree",
  ["mini.nvim"]               = "mini",
}

---@param name string
---@return table
function M.get_group(name)
  return Util.mod("suannhai.groups." .. name)
end

---@param name string
---@param colors table
---@param opts suannhai.Config
---@return table
function M.get(name, colors, opts)
  local mod = M.get_group(name)
  return mod.get(colors, opts)
end

---@param colors table
---@param opts suannhai.Config
---@return table, table
function M.setup(colors, opts)
  opts = opts or {}
  opts.plugins = opts.plugins or {}

  -- Core groups always load
  local groups = {
    base = true,
    syntax = true,
    treesitter = true,
    semantic_tokens = true,
    terminal = true,
  }

  -- Plugin groups
  if opts.plugins.all then
    for _, group in pairs(M.plugins) do
      groups[group] = true
    end
  elseif opts.plugins.auto and package.loaded.lazy then
    local ok, lazy_config = pcall(function()
      return require("lazy.core.config").plugins
    end)
    if ok and lazy_config then
      for plugin, group in pairs(M.plugins) do
        if lazy_config[plugin] then
          groups[group] = true
        end
      end
      -- mini.nvim umbrella
      if lazy_config["mini.nvim"] then
        groups["mini"] = true
      end
    end
  end

  -- Per-plugin overrides
  for plugin, group in pairs(M.plugins) do
    local use = opts.plugins[group]
    use = use == nil and opts.plugins[plugin] or use
    if use ~= nil then
      if type(use) == "table" then
        use = use.enabled
      end
      groups[group] = use or nil
    end
  end

  local names = vim.tbl_keys(groups)
  table.sort(names)

  local ret = {}
  local terminal_colors = nil

  for _, group in ipairs(names) do
    for k, v in pairs(M.get(group, colors, opts)) do
      if k == "_terminal_colors" then
        terminal_colors = v
      else
        ret[k] = v
      end
    end
  end

  Util.resolve(ret)

  -- User hook
  if opts.on_highlights then
    opts.on_highlights(ret, colors)
  end

  -- Re-attach terminal colors after user hook (not a highlight group)
  if terminal_colors then
    ret._terminal_colors = terminal_colors
  end

  return ret, groups
end

return M
