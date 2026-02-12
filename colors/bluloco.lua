local bluloco = require("bluloco")
local config = bluloco.config

if config.style == "dark" then
  vim.o.background = "dark"
elseif config.style == "light" then
  vim.o.background = "light"
end

bluloco.load()
