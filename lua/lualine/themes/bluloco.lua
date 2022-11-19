local dark = {
  bg       = "#282C34",
  fg       = "#8691A3",
  normalFG = "#abb2bf",
  green    = "#3FC56B",
  red      = "#FF6480",
  purple   = "#9F7EFE",
  blue     = "#3691FF",
  grey3    = "#2d333e",
  grey7    = "#384252",
  grey20   = "#4a5a73",
}

local light = {
  bg       = "#F9F9F9",
  fg       = "#6D7281",
  normalFG = "#383A42",
  green    = "#23974A",
  red      = "#D52753",
  purple   = "#823FF1",
  blue     = "#275FE4",
  grey3    = "#ededee",
  grey7    = "#dee1e3",
  grey20   = "#b9c2c6",
}

local t = dark

if (vim.o.background == "light") then
  t = light
end

return {
  normal = {
    a = { bg = t.grey20, fg = t.normalFG },
    b = { bg = t.grey7, fg = t.fg },
    c = { bg = t.grey3, fg = t.fg }
  },
  insert = {
    a = { bg = t.blue, fg = t.bg },
    b = { bg = t.grey7, fg = t.blue },
    c = { bg = t.grey3, fg = t.fg }
  },
  visual = {
    a = { bg = t.purple, fg = t.bg },
    b = { bg = t.grey7, fg = t.purple },
    c = { bg = t.grey3, fg = t.fg }
  },
  replace = {
    a = { bg = t.red, fg = t.bg },
    b = { bg = t.grey7, fg = t.red },
    c = { bg = t.grey3, fg = t.fg }
  },
  command = {
    a = { bg = t.green, fg = t.bg },
    b = { bg = t.grey7, fg = t.green },
    c = { bg = t.grey3, fg = t.fg }
  },
  inactive = {
    a = { bg = t.grey20, fg = t.grey3, },
    b = { bg = t.grey3, fg = t.grey20 },
    c = { bg = t.grey3, fg = t.grey20 }
  }
}
