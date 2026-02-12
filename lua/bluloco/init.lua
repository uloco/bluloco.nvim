local M = {}

local isGui = vim.fn.has("gui_running") == 1

local defaultConfig = {
  style = "auto", -- auto | light | dark
  transparent = false,
  italics = false,
  terminal = isGui,
  guicursor = true,
  rainbow_headings = false,
  float_window = "default", -- default | transparent
}

M.config = defaultConfig

function M.setup(options)
  M.config = vim.tbl_deep_extend("force", {}, defaultConfig, options or {})

  -- Set cursor color
  if M.config.guicursor then
    vim.opt.guicursor = "n-v-c-sm:block-Cursor,i-ci-ve:ver25-Cursor,r-cr-o:hor20-Cursor"
  end
end

function M.load()
  local variant = vim.o.background == "light" and "light" or "dark"

  -- Load pre-compiled theme (no lush needed)
  local theme = require("bluloco.theme." .. variant)
  -- Clear cache so switching background works
  package.loaded["bluloco.theme." .. variant] = nil

  vim.g.colors_name = "bluloco"

  -- Apply terminal colors
  if M.config.terminal then
    local terminal = require("bluloco.theme.terminal_" .. variant)
    package.loaded["bluloco.theme.terminal_" .. variant] = nil
    for key, val in pairs(terminal) do
      vim.g[key] = val
    end
  end

  -- Apply transparent float window override
  if M.config.transparent and M.config.float_window == "transparent" then
    local float_groups = {
      "NormalFloat",
      "NormalSB",
      "BufferInactive",
      "BufferVisible",
      "TroubleNormal",
      "CmpDocumentation",
      "CmpDocumentationBorder",
      "BlinkCmpDoc",
      "BlinkCmpDocBorder",
      "NvimTreeNormal",
      "NvimTreeNormalNC",
    }
    for _, group in ipairs(float_groups) do
      if theme[group] then
        theme[group] = vim.tbl_extend("force", theme[group], { bg = "NONE" })
      end
    end
  end

  -- Apply transparent overrides
  if M.config.transparent and not isGui then
    local transparent_groups = {
      "Normal",
      "NormalSB",
      "BufferlineFill",
      "TroubleNormal",
      "NvimTreeNormal",
      "NvimTreeNormalNC",
      "BufferInactive",
    }
    for _, group in ipairs(transparent_groups) do
      if theme[group] then
        theme[group] = vim.tbl_extend("force", theme[group], { bg = "NONE" })
      else
        theme[group] = { bg = "NONE" }
      end
    end
    -- BufferVisible should look like BufferCurrent when transparent
    if theme.BufferCurrent then
      theme.BufferVisible = vim.tbl_extend("force", theme.BufferCurrent, {})
    end
  end

  -- Apply italics overrides
  if M.config.italics then
    local italic_groups = {
      "Statement",
      "Boolean",
      "Comment",
      "@tag.attribute",
      "@annotation",
    }
    for _, group in ipairs(italic_groups) do
      if theme[group] then
        theme[group] = vim.tbl_extend("force", theme[group], { italic = true })
      end
    end
  end

  -- Apply rainbow headings overrides
  if M.config.rainbow_headings then
    local rainbow_map = {
      { "1", "RainbowRed" },
      { "2", "RainbowYellow" },
      { "3", "RainbowBlue" },
      { "4", "RainbowOrange" },
      { "5", "RainbowGreen" },
      { "6", "RainbowViolet" },
    }
    for _, pair in ipairs(rainbow_map) do
      local level, rainbow_group = pair[1], pair[2]
      if theme[rainbow_group] then
        local attrs = vim.tbl_extend("force", theme[rainbow_group], {})
        theme["@markup.heading." .. level] = attrs
        theme["markdownH" .. level] = attrs
      end
    end
  end

  -- Apply bufferline override
  local bufferlineInstalled = pcall(require, "bufferline")
  if bufferlineInstalled and theme.Statement then
    theme.TabLineSel = { bg = theme.Statement.fg }
  end

  -- Apply all highlight groups
  for group, attrs in pairs(theme) do
    vim.api.nvim_set_hl(0, group, attrs)
  end
end

return M
