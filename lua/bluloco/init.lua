---@diagnostic disable: undefined-global
local status, lush = pcall(require, 'lush')
local M = {}

if (not status) then return end

local defaultConfig = {
  transparent = false,
}

local transparent = lush(function()
  return {
    Normal { bg = "NONE" }, -- normal text
  }
end)

function M.setup(options)
  local config = vim.tbl_deep_extend("force", {}, defaultConfig, options or {})
  vim.g.colors_name = 'bluloco'
  package.loaded['lush_theme.bluloco'] = nil

  vim.o.background = "light"
  local bluloco = require('lush_theme.bluloco')

  local theme = bluloco -- add config differences with lush.merge

  if (config.transparent == true) then
    theme = lush.merge({ bluloco, transparent })
  end
  -- require('lush')(theme)
end

return M
