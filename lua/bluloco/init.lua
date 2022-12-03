---@diagnostic disable: undefined-global
local status, lush = pcall(require, 'lush')
local M = {}

if (not status) then return end

local defaultConfig = {
  style       = "auto", -- auto | light | dark
  transparent = false,
  italics     = false,
}

M.config = defaultConfig

function M.setup(options)
  M.config = vim.tbl_deep_extend("force", {}, defaultConfig, options or {})
end

return M
