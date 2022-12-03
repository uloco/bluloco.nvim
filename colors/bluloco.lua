---@diagnostic disable: undefined-global
local config = require("bluloco").config
local theme = require('lush_theme.bluloco')
local lush = require('lush')

vim.g.colors_name = 'bluloco'
package.loaded['lush_theme.bluloco'] = nil

local transparent = lush(function()
  return {
    Normal { theme.Normal, bg = "NONE" }, -- normal text
  }
end)

-- local italics = lush.extends({ theme }).with(function()
local italics = lush(function(injected_functions)
  local sym = injected_functions.sym
  return {
    Statement { theme.Statement, gui = "italic" },
    Boolean { theme.Boolean, gui = "italic" },
    Comment { theme.Comment, gui = "italic" },
    sym("@tag.attribute") { theme["@tag.attribute"], gui = "italic" },
    sym("@annotation") { theme["@annotation"], gui = "italic" },
  }
end)


if (config.transparent == true) then
  theme = lush.merge({ theme, transparent })
end

if (config.italics == true) then
  theme = lush.merge({ theme, italics })
end

lush(theme)
