local config = require("bluloco").config
local theme = require('lush_theme.bluloco')
local lush = require('lush')

vim.g.colors_name = 'bluloco'
package.loaded['lush_theme.bluloco'] = nil

local transparent = lush(function()
  return {
    Normal { bg = "NONE" }, -- normal text
  }
end)


if (config.transparent == true) then
  theme = lush.merge({ theme, transparent })
end

lush(theme)
