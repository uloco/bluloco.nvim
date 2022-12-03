---@diagnostic disable: undefined-global
local M = {}

local defaultConfig = {
  style       = "auto", -- auto | light | dark
  transparent = false,
  italics     = false,
}

M.config = defaultConfig

function M.setup(options)
  M.config = vim.tbl_deep_extend("force", {}, defaultConfig, options or {})
end

function M.load()
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


  if (M.config.transparent == true) then
    theme = lush.merge({ theme, transparent })
  end

  if (M.config.italics == true) then
    theme = lush.merge({ theme, italics })
  end

  lush(theme)
end

return M
