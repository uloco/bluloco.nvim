---@diagnostic disable: undefined-global
local bluloco = require("bluloco")
local config = bluloco.config
local load = bluloco.load

if (config.style == "dark") then
  vim.o.background = "dark"
elseif (config.style == "light") then
  vim.o.background = "light"
end

load()
