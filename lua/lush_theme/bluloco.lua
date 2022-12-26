local lush = require('lush')
local hsl = lush.hsl
local config = require("bluloco").config

-- Lush.hsl provides a number of convenience functions for:
--
--   Relative adjustment (rotate(), saturate(), desaturate(), lighten(), darken())
--   Absolute adjustment (prefix above with abs_)
--   Combination         (mix())
--   Overrides           (hue(), saturation(), lightness())
--   Access              (.h, .s, .l)
--   Coercion            (tostring(), "Concatination: " .. color)
--   Helpers             (readable())
--
--   Adjustment functions have shortcut aliases, ro, sa, de, li, da
--                                               abs_sa, abs_de, abs_li, abs_da

-- gui:   a string containing any of the following format modifier
--        values, separated by space or comma.

-- bold:          boolean, enables or disables bold.
-- italic:        boolean, enables or disables italics.
-- underline:     boolean, enables or disables underline.
-- underlineline: boolean, enables or disables double underline.
-- underdouble:   boolean, underlineline in nvim 0.8
-- undercurl:     boolean, enables or disables undercurl.
-- underdot:      boolean, enables or disables underdot.
-- underdotted:   boolean, underdot in nvim 0.8
-- underdash:     boolean, enables or disables underdash.
-- underdashed:   boolean, underdash in nvim 0.8
-- strikethrough: boolean, enables or disables strikethrough.
-- reverse:       boolean, enables or disables flipping fg and bg values.
-- standout:      boolean, enables or disables standout.
-- nocombine:     boolean, enables or disables nocombine.



local dark = {
  -- syntax
  bg          = hsl("#282C34"),
  bgFloat     = hsl("#21242D"),
  fg          = hsl("#ABB2BF"),
  cursor      = hsl("#FFCC00"),
  keyword     = hsl("#10B1FE"),
  comment     = hsl("#636D83"),
  punctuation = hsl("#7A82DA"),
  method      = hsl("#3FC56B"),
  type        = hsl("#FF6480"),
  string      = hsl("#F9C859"),
  number      = hsl("#FF78F8"),
  constant    = hsl("#9F7EFE"),
  tag         = hsl("#3691FF"),
  attribute   = hsl("#FF936A"),
  property    = hsl("#CE9887"),
  parameter   = hsl("#8bcdef"),
  label       = hsl("#50acae"),

  -- workspace
  primary            = hsl("#3691ff"),
  selection          = hsl("#274670"),
  search             = hsl("#1A7247"),
  diffAdd            = hsl("#105B3D"),
  diffChange         = hsl("#10415B"),
  diffDelete         = hsl("#522E34"),
  added              = hsl("#177F55"),
  changed            = hsl("#1B6E9B"),
  deleted            = hsl("#A14D5B"),
  diffText           = hsl("#10415B").lighten(12),
  error              = hsl("#ff2e3f"),
  errorBG            = hsl("#FDCFD1"),
  warning            = hsl("#da7a43"),
  warningBG          = hsl("#F2DBCF"),
  info               = hsl("#3691ff"),
  infoBG             = hsl("#D4E3FA"),
  hint               = hsl("#7982DA"),
  mergeCurrent       = hsl("#4B3D3F"),
  mergeCurrentLabel  = hsl("#604B47"),
  mergeIncoming      = hsl("#2F476B"),
  mergeIncomingLabel = hsl("#305C95"),
  mergeParent        = hsl(235, 28, 32),
  mergeParentLabel   = hsl(235, 29, 41),

  -- terminal
  terminalBlack         = hsl("#42444d"),
  terminalRed           = hsl("#fc2e51"),
  terminalGreen         = hsl("#25a45c"),
  terminalYellow        = hsl("#ff9369"),
  terminalBlue          = hsl("#3375fe"),
  terminalMagenta       = hsl("#9f7efe"),
  terminalCyan          = hsl("#4483aa"),
  terminalWhite         = hsl("#cdd3e0"),
  terminalBrightBlack   = hsl("#8f9aae"),
  terminalBrightRed     = hsl("#ff637f"),
  terminalBrightGreen   = hsl("#3fc56a"),
  terminalBrightYellow  = hsl("#f9c858"),
  terminalBrightBlue    = hsl("#10b0fe"),
  terminalBrightMagenta = hsl("#ff78f8"),
  terminalBrightCyan    = hsl("#5fb9bc"),
  terminalBrightWhite   = hsl("#ffffff"),
}

local light = {
  -- syntax
  bg          = hsl("#F9F9F9"),
  bgFloat     = hsl("#ECEDEE"),
  fg          = hsl("#383A42"),
  cursor      = hsl("#F31459"),
  keyword     = hsl("#0098DD"),
  comment     = hsl("#A0A1A7"),
  punctuation = hsl("#7A82DA"),
  method      = hsl("#23974A"),
  type        = hsl("#D52753"),
  string      = hsl("#C5A332"),
  number      = hsl("#CE33C0"),
  constant    = hsl("#823FF1"),
  tag         = hsl("#275FE4"),
  attribute   = hsl("#DF631C"),
  property    = hsl("#A05A48"),
  parameter   = hsl("#40B8C5"),
  label       = hsl("#3a8ab2"),

  -- workspace
  primary            = hsl("#0099e1"),
  selection          = hsl("#d2ecff"),
  search             = hsl("#b1eacf"),
  diffAdd            = hsl("#c5f6c8"),
  diffChange         = hsl("#C2E4FF"),
  diffDelete         = hsl("#fac1c6"),
  added              = hsl("#3cbc66"),
  changed            = hsl("#0099e1"),
  deleted            = hsl("#FA7883"),
  diffText           = hsl("#C2E4FF").darken(4),
  error              = hsl("#ff0000"),
  errorBG            = hsl("#FCE4E4"),
  warning            = hsl("#ff8f3a"),
  warningBG          = hsl("#FBE4D5"),
  info               = hsl("#0099e1"),
  infoBG             = hsl("#D2ECFF"),
  hint               = hsl("#7982DA"),
  mergeCurrent       = hsl("#F1E8E6"),
  mergeCurrentLabel  = hsl("#E5D4D0"),
  mergeIncoming      = hsl("#DFEDF6"),
  mergeIncomingLabel = hsl("#CAE3F4"),
  mergeParent        = hsl(233, 60, 95),
  mergeParentLabel   = hsl(233, 60, 90),

  -- terminal
  terminalBlack         = hsl("#373a41"),
  terminalRed           = hsl("#d52652"),
  terminalGreen         = hsl("#239749"),
  terminalYellow        = hsl("#df621b"),
  terminalBlue          = hsl("#275fe4"),
  terminalMagenta       = hsl("#823ef0"),
  terminalCyan          = hsl("#26608c"),
  terminalWhite         = hsl("#b9bac1"),
  terminalBrightBlack   = hsl("#676a77"),
  terminalBrightRed     = hsl("#ff637f"),
  terminalBrightGreen   = hsl("#3cbc66"),
  terminalBrightYellow  = hsl("#c5a231"),
  terminalBrightBlue    = hsl("#0099e0"),
  terminalBrightMagenta = hsl("#ce32c0"),
  terminalBrightCyan    = hsl("#6d92ba"),
  terminalBrightWhite   = hsl("#d3d3d3"),
}

local t = dark

if (vim.o.background == "light") then
  t = light
end

local function shade(color, value)
  if (vim.o.background == "light") then
    return color.darken(value)
  else
    return color.lighten(value)
  end
end

-- t.shade1 = shade(t.bg, 1)
-- t.shade2 = shade(t.bg, 2)
t.shade3 = shade(t.bg, 3)
t.shade4 = shade(t.bg, 4)
t.shade5 = shade(t.bg, 5)
t.shade6 = shade(t.bg, 6)
t.shade7 = shade(t.bg, 7)
t.shade8 = shade(t.bg, 8)
t.shade9 = shade(t.bg, 9)
t.shade10 = shade(t.bg, 10)
t.shade20 = shade(t.bg, 20)
t.shade25 = shade(t.bg, 25)
t.shade30 = shade(t.bg, 30)
t.shade40 = shade(t.bg, 40)
t.shade50 = shade(t.bg, 50)
t.shade60 = shade(t.bg, 60)
t.shade70 = shade(t.bg, 70)
t.shade80 = shade(t.bg, 80)
t.shade90 = shade(t.bg, 90)

t.grey3 = t.shade3.mix(t.primary, 3)
t.grey5 = t.shade5.mix(t.primary, 5)
t.grey7 = t.shade7.mix(t.primary, 7)
t.grey10 = t.shade10.mix(t.primary, 10)
t.grey20 = t.shade20.mix(t.primary, 10)
t.grey25 = t.shade25.mix(t.primary, 10)
t.grey30 = t.shade30.mix(t.primary, 10)
t.grey40 = t.shade40.mix(t.primary, 12)


t.white = hsl("#ffffff")
t.green = hsl("#008200")


-- -- terminal colors
if (config.terminal == true) then
  vim.g.terminal_color_0  = t.terminalBlack.hex
  vim.g.terminal_color_1  = t.terminalRed.hex
  vim.g.terminal_color_2  = t.terminalGreen.hex
  vim.g.terminal_color_3  = t.terminalYellow.hex
  vim.g.terminal_color_4  = t.terminalBlue.hex
  vim.g.terminal_color_5  = t.terminalMagenta.hex
  vim.g.terminal_color_6  = t.terminalCyan.hex
  vim.g.terminal_color_7  = t.terminalWhite.hex
  vim.g.terminal_color_8  = t.terminalBrightBlack.hex
  vim.g.terminal_color_9  = t.terminalBrightRed.hex
  vim.g.terminal_color_10 = t.terminalBrightGreen.hex
  vim.g.terminal_color_11 = t.terminalBrightYellow.hex
  vim.g.terminal_color_12 = t.terminalBrightBlue.hex
  vim.g.terminal_color_13 = t.terminalBrightMagenta.hex
  vim.g.terminal_color_14 = t.terminalBrightCyan.hex
  vim.g.terminal_color_15 = t.terminalBrightWhite.hex
end


-- Call lush with our lush-spec.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
  local sym = injected_functions.sym

  return {
    Normal { fg = t.fg, bg = t.bg }, -- normal text
    CursorLine { bg = t.grey7 }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    CursorColumn { CursorLine }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    Whitespace { fg = t.grey10 },
    Comment { fg = t.comment },
    LineNr { Comment }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr { Comment }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    Search { bg = t.search },
    IncSearch { bg = t.cursor.mix(t.bg, 10), fg = t.bg },
    CurSearch { Search },
    NormalFloat { bg = t.bgFloat, blend = 5 }, -- Normal text in floating windows.
    NormalSB { bg = t.bgFloat }, -- Normal text in floating windows.
    ColorColumn { Whitespace }, -- used for the columns set with 'colorcolumn'
    Conceal {}, -- placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor { bg = t.cursor, fg = t.bg }, -- character under the cursor
    lCursor { Normal }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    CursorIM { Normal }, -- like Cursor, but used when in IME mode |CursorIM|
    Directory { fg = t.keyword }, -- directory names (and other special names in listings)
    DiffAdd { bg = t.diffAdd }, -- diff mode: Added line |diff.txt|
    DiffChange { bg = t.diffChange }, -- diff mode: Changed line |diff.txt|
    DiffDelete { bg = t.diffDelete }, -- diff mode: Deleted line |diff.txt|
    DiffText { bg = t.diffText }, -- diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer { fg = t.punctuation }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    TermCursor { Cursor }, -- cursor in a focused terminal
    TermCursorNC {}, -- cursor in an unfocused terminal
    ErrorMsg { fg = t.error }, -- error messages on the command line
    VertSplit { fg = t.grey30 }, -- the column separating vertically split windows
    Winseparator { VertSplit }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    Folded { bg = t.shade7, fg = t.tag }, -- line used for closed folds
    SignColumn { Normal }, -- column where |signs| are displayed
    FoldColumn { SignColumn }, -- 'foldcolumn'
    Substitute { IncSearch }, -- |:substitute| replacement text highlighting
    -- MatchParen { gui = "reverse" }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    MatchParen { bg = t.punctuation, fg = t.bg }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg { Normal }, -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea { Normal }, -- Area for messages and cmdline
    -- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg { fg = t.primary }, -- |more-prompt|
    NonText { fg = t.shade30 }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    NormalNC { Normal }, -- normal text in non-current windows
    -- Pmenu { bg = t.bg, blend = 5 },
    Pmenu { NormalFloat },
    PmenuSel { bg = t.selection }, -- Popup menu: selected item.
    PmenuSbar { bg = t.grey5 }, -- Popup menu: scrollbar.
    PmenuThumb { bg = t.shade20 }, -- Popup menu: Thumb of the scrollbar.
    Question { fg = t.primary }, -- |hit-enter| prompt and yes/no questions
    QuickFixLine { bg = t.primary, fg = t.white }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    SpecialKey { fg = t.attribute }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    -- TODO: spelling
    -- SpellBad     { gui = "undercurl", sp = t.error  }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    -- SpellCap     { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    -- SpellLocal   { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare    { }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.

    StatusLine { bg = t.grey10, gui = "" }, -- status line of current window
    StatusLineNC { bg = t.shade5 }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.

    TabLine { bg = t.shade3, fg = t.shade30 }, -- tab pages line, not active tab page label
    TabLineFill { bg = t.bg }, -- tab pages line, where there are no labels
    TabLineSel { bg = t.shade10, sp = t.primary, gui = "underline" }, -- tab pages line, active tab page label

    Title { fg = t.primary }, -- titles for output from ":set all", ":autocmd" etc.
    Visual { bg = t.selection }, -- Visual mode selection
    VisualNOS { bg = t.selection }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg { fg = t.warning }, -- warning messages
    WildMenu { bg = t.selection }, -- current match in 'wildmenu' completion

    Constant { fg = t.constant }, -- (preferred) any constant
    String { fg = t.string }, --   a string constant: "this is a string"
    Character { fg = t.attribute }, --  a character constant: 'c', '\n'
    Number { fg = t.number }, --   a number constant: 234, 0xff
    Boolean { fg = t.keyword }, --  a boolean constant: TRUE, false
    -- Float          { }, --    a floating point constant: 2.3e10
    Identifier { fg = t.fg }, -- (preferred) any variable name
    Function { fg = t.method }, -- function name (also: methods for classes)
    Method { fg = t.method }, -- function name (also: methods for classes)
    Property { fg = t.property },
    Field { Property },
    Parameter { fg = t.parameter },
    Statement { fg = t.keyword }, -- (preferred) any statement
    -- Conditional    { }, --  if, then, else, endif, switch, etc.
    -- Repeat         { }, --   for, do, while, etc.
    -- Label          { }, --    case, default, etc.
    Punctuation { fg = t.punctuation }, -- "sizeof", "+", "*", etc.
    Operator { fg = t.punctuation }, -- "sizeof", "+", "*", etc.
    Keyword { Statement }, --  any other keyword
    -- Exception      { }, --  try, catch, throw
    PreProc { fg = t.keyword }, -- (preferred) generic Preprocessor
    -- Include        { }, --  preprocessor #include
    -- Define         { }, --   preprocessor #define
    -- Macro          { }, --    same as Define
    -- PreCondit      { }, --  preprocessor #if, #else, #endif, etc.
    Type { fg = t.type }, -- (preferred) int, long, char, etc.
    Struct { Type },
    Class { Type },
    -- StorageClass   { }, -- static, register, volatile, etc.
    -- Structure      { }, --  struct, union, enum, etc.
    -- Typedef        { }, --  A typedef
    Special { Character }, -- (preferred) any special symbol
    Attribute { Character }, -- (preferred) any special symbol
    -- SpecialChar {}, --  special character in a constant
    Tag { fg = t.tag }, --    you can use CTRL-] on this
    -- Delimiter {}, --  character that needs attention
    -- SpecialComment { }, -- special things inside a comment
    -- Debug          { }, --    debugging statements
    Underlined { gui = "underline" }, -- (preferred) text that stands out, HTML links
    Bold { gui = "bold" },
    Italic { gui = "italic" },
    -- ("Ignore", below, may be invisible...)
    Ignore { fg = t.bg }, -- (preferred) left blank, hidden  |hl-Ignore|
    Error { ErrorMsg }, -- (preferred) any erroneous construct
    Todo { bg = t.info, fg = t.white }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- These groups are for the native LSP client and diagnostic system. Some
    -- other LSP clients may use these groups, or use their own. Consult your
    -- LSP client's documentation.

    -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- LspReferenceText            { } , -- Used for highlighting "text" references
    -- LspReferenceRead            { } , -- Used for highlighting "read" references
    -- LspReferenceWrite           { } , -- Used for highlighting "write" references
    -- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    -- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
    -- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

    -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
    --
    DiagnosticError { Error }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticWarn { WarningMsg }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticInfo { fg = t.info }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticHint { fg = t.hint }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticVirtualTextError { DiagnosticError, bg = t.bg.mix(t.error, 20) }, -- Used for "Error" diagnostic virtual text.
    DiagnosticVirtualTextWarn { DiagnosticWarn, bg = t.bg.mix(t.warning, 20) }, -- Used for "Warn" diagnostic virtual text.
    DiagnosticVirtualTextInfo { DiagnosticInfo, bg = t.bg.mix(t.info, 20) }, -- Used for "Info" diagnostic virtual text.
    DiagnosticVirtualTextHint { DiagnosticHint, bg = t.bg.mix(t.hint, 20) }, -- Used for "Hint" diagnostic virtual text.
    DiagnosticUnderlineError { gui = "undercurl", sp = t.error }, -- Used to underline "Error" diagnostics.
    DiagnosticUnderlineWarn { gui = "undercurl", sp = t.warning }, -- Used to underline "Warn" diagnostics.
    DiagnosticUnderlineInfo { gui = "undercurl", sp = t.info }, -- Used to underline "Info" diagnostics.
    DiagnosticUnderlineHint { gui = "undercurl", sp = t.hint }, -- Used to underline "Hint" diagnostics.
    -- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    -- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
    -- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
    -- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
    -- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
    -- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.

    -- These groups are for the neovim tree-sitter highlights.
    -- As of writing, tree-sitter support is a WIP, group names may change.
    -- By default, most of these groups link to an appropriate Vim group,
    -- TSError -> Error for example, so you do not have to define these unless
    -- you explicitly want to support Treesitter's improved syntax awareness.


    -- TSError              { }, -- For syntax/parser errors.
    sym("@constructor") { fg = t.type },
    sym("@punctuation") { fg = t.punctuation },
    sym("@punctuation.bracket") { fg = t.punctuation },
    sym("@punctuation.delimiter") { fg = t.punctuation },
    sym("@punctuation.special") { fg = t.punctuation },
    sym("@symbol") { fg = t.constant },
    sym("@constant") { fg = t.constant },
    sym("@constant.builtin") { fg = t.keyword },
    sym("@string.escape") { Character },
    sym("@function") { fg = t.method },
    sym("@function.call") { fg = t.method },
    sym("@function.builtin") { fg = t.method },
    sym("@parameter") { fg = t.parameter },
    sym("@field") { Property },
    sym("@property") { Property },
    sym("@label") { fg = t.label }, -- For labels: `label:` in C and `:label:` in Lua.
    sym("@type") { Type },
    sym("@type.builtin") { fg = t.keyword },
    sym("@type.qualifier") { Statement },
    sym("@namespace") { Statement },
    sym("@annotation") { sym("@label") }, -- For labels: `label:` in C and `:label:` in Lua.
    sym("@text") { Identifier },
    sym("@text.strong") { Bold },
    sym("@text.italic") { Italic },
    sym("@text.underline") { Underlined },
    sym("@text.title") { fg = t.keyword },
    sym("@text.literal") { Property },
    sym("@text.uri") { fg = t.tag, sp = t.tag, gui = "underline" }, -- Any URI like a link or email.
    sym("@variable") { Identifier }, -- Variable names that are defined by the languages, like `this` or `self`.
    sym("@variable.builtin") { Statement }, -- Variable names that are defined by the languages, like `this` or `self`.
    sym("@tag") { Tag },
    sym("@attribute") { fg = t.label }, -- Variable names that are defined by the languages, like `this` or `self`.
    sym("@tag.attribute") { fg = t.attribute }, -- Variable names that are defined by the languages, like `this` or `self`.
    sym("@error") { Error }, -- Variable names that are defined by the languages, like `this` or `self`.
    sym("@warning") { WarningMsg },
    sym("@info") { fg = t.info },


    --     -- sym"@string.special"    { }, -- SpecialChar
    --     -- sym"@character.special" { }, -- SpecialChar
    --     -- sym"@function.macro"    { }, -- Macro
    --     -- sym"@debug"             { }, -- Debug

    -- Language Overrides
    -- JSON
    sym("@label.json") { fg = t.property }, -- For labels: `label:` in C and `:label:` in Lua.
    -- help files
    sym("@label.help") { sym "@text.uri" },
    -- html
    sym("@text.uri.html") { gui = "underline" },


    --  gitsigns
    GitSignsAdd { fg = t.added },
    GitSignsChange { fg = t.changed },
    GitSignsDelete { fg = t.deleted },

    -- TODO: improve bufferline
    BufferlineFill { NormalFloat },
    -- BufferlineBackground { bg = t.bg },
    -- BufferlineDevIconLua { bg = t.bg, fg = t.keyword },
    -- BufferlineDevIconLuaSelected { bg = t.bg, fg = t.keyword },
    -- BufferlineBufferVisible { bg = t.bg },
    -- BufferlineBufferSelected { bg = t.bg },

    -- BufferlineIndicatorVisible { bg = t.type }, -- shows which buffers are visible in windows currently

    -- BufferLineSeparatorSelected { fg = t.type, sp = t.primary, gui = "underline" },
    -- BufferLineWarningDiagnosticSelected { fg = t.warning, sp = t.primary, gui = "underline" },
    -- BufferLineErrorDiagnosticSelected { fg = t.error, sp = t.primary, gui = "underline" },
    -- BufferLineInfoDiagnosticSelected { fg = t.info, sp = t.primary, gui = "underline" },
    -- BufferLineHintDiagnosticSelected { fg = t.hint, sp = t.primary, gui = "underline" },
    -- BufferLineTabSeparatorSelected { sp = t.primary, gui = "underline" },
    -- BufferLineCloseButtonSelected { sp = t.primary, gui = "underline" },
    -- BufferLineDiagnosticSelected { sp = t.primary, gui = "underline" },
    -- BufferLineDevIconLuaSelected { sp = t.primary, gui = "underline" },
    -- BufferLineIndicatorSelected { sp = t.primary, gui = "underline" },
    -- BufferLineDuplicateSelected { sp = t.primary, gui = "underline" },
    -- BufferLineModifiedSelected { sp = t.primary, gui = "underline" },
    -- BufferLineNumbersSelected { sp = t.primary, gui = "underline" },
    -- BufferLineBufferSelected { sp = t.primary, gui = "underline" },
    -- BufferLinePickSelected { sp = t.primary, gui = "underline" },
    -- BufferLineTabSelected { sp = t.primary, gui = "underline" },
    -- BufferLineWarningSelected { fg = t.warning, sp = t.primary, gui = "underline" },
    -- BufferLineErrorSelected { fg = t.error, sp = t.primary, gui = "underline" },
    -- BufferLineInfoSelected { fg = t.info, sp = t.primary, gui = "underline" },
    -- BufferLineHintSelected { fg = t.hint, sp = t.primary, gui = "underline" },

    -- BarBar

    BufferCurrent { Normal },
    BufferCurrentIndex { BufferCurrent },
    BufferCurrentIcon { BufferCurrentIndex },
    BufferCurrentMod { BufferCurrent },
    BufferCurrentSign { fg = t.keyword, bg = BufferCurrent.bg },
    BufferCurrentTarget { BufferCurrent, fg = t.type },
    BufferCurrentWARN { fg = DiagnosticWarn.fg, bg = BufferCurrent.bg },
    BufferCurrentINFO { fg = DiagnosticInfo.fg, bg = BufferCurrent.bg },
    BufferCurrentERROR { fg = DiagnosticError.fg, bg = BufferCurrent.bg },
    BufferCurrentHINT { fg = DiagnosticHint.fg, bg = BufferCurrent.bg },

    BufferInactive { fg = t.shade40, bg = t.bgFloat },
    BufferInactiveIcon { BufferInactive },
    BufferInactiveIndex { BufferInactive },
    BufferInactiveMod { BufferInactive },
    BufferInactiveSign { BufferInactive },
    BufferInactiveTarget { BufferInactive, fg = t.type },
    BufferInactiveWARN { BufferCurrentWARN, bg = BufferInactive.bg },
    BufferInactiveINFO { BufferCurrentINFO, bg = BufferInactive.bg },
    BufferInactiveERROR { BufferCurrentERROR, bg = BufferInactive.bg },
    BufferInactiveHINT { BufferCurrentHINT, bg = BufferInactive.bg },

    BufferVisible { BufferCurrent, bg = t.bgFloat },
    BufferVisibleIndex { BufferVisible },
    BufferVisibleIcon { BufferVisibleIndex },
    BufferVisibleMod { BufferVisible },
    BufferVisibleSign { BufferVisible },
    BufferVisibleTarget { BufferVisible, fg = t.type },
    BufferVisibleWARN { BufferInactiveWARN },
    BufferVisibleINFO { BufferInactiveINFO },
    BufferVisibleERROR { BufferInactiveERROR },
    BufferVisibleHINT { BufferInactiveHINT },

    BufferAlternate { BufferInactive },
    BufferAlternateIndex { BufferAlternate },
    BufferAlternateIcon { BufferAlternateIndex },
    BufferAlternateMod { BufferInactiveMod },
    BufferAlternateSign { BufferInactiveSign, fg = t.constant },
    BufferAlternateTarget { BufferAlternate, fg = t.type },
    BufferAlternateWARN { BufferInactiveWARN },
    BufferAlternateINFO { BufferInactiveINFO },
    BufferAlternateERROR { BufferInactiveERROR },
    BufferAlternateHINT { BufferInactiveHINT },

    BufferTabpages { BufferInactive, fg = t.fg },
    BufferTabpageFill { BufferTabpages, fg = t.bg },
    BufferOffset { BufferTabpageFill },

    -- Telescope

    -- Sets the highlight for selected items within the picker.
    -- TelescopeSelection  {},
    -- TelescopeSelectionCaret  {},
    TelescopeMultiSelection { fg = t.attribute },
    TelescopeMultiIcon { fg = t.primary },

    -- -- "Normal" in the floating windows created by telescope.
    -- TelescopeNormal { fg = t.fg, bg = t.bg },
    -- TelescopeNormal { fg = t.fg, bg = t.bg, blend = 5 },
    TelescopeNormal { NormalFloat },
    -- TelescopePreviewNormal  {},
    -- TelescopePromptNormal { fg = t.fg, bg = t.bg },
    -- TelescopeResultsNormal  {},

    -- -- Border highlight groups.
    -- --   Use TelescopeBorder to override the default.
    -- --   Otherwise set them specifically

    TelescopeBorder { NormalFloat, fg = t.punctuation },
    -- TelescopePromptBorder  {},
    -- TelescopeResultsBorder  {},
    -- TelescopePreviewBorder  {},

    -- -- Title highlight groups.
    -- --   Use TelescopeTitle to override the default.
    -- --   Otherwise set them specifically
    -- TelescopeTitle  {fg = t.constant},
    -- TelescopePromptTitle  {},
    -- TelescopeResultsTitle  {},
    -- TelescopePreviewTitle  {},

    -- TelescopePromptCounter  {},

    -- -- Used for highlighting characters that you match.
    TelescopeMatching { fg = t.keyword },

    -- -- Used for the prompt prefix
    TelescopePromptPrefix { fg = t.punctuation },

    -- -- Used for highlighting the matched line inside Previewer. Works only for (vim_buffer_ previewer)
    -- TelescopePreviewLine  {},
    -- TelescopePreviewMatch  {},

    -- TelescopePreviewPipe  {},
    -- TelescopePreviewCharDev  {},
    -- TelescopePreviewDirectory  {},
    -- TelescopePreviewBlock  {},
    TelescopePreviewLink { fg = t.label },
    TelescopePreviewSocket { fg = t.property },
    -- TelescopePreviewRead  {},
    TelescopePreviewWrite { fg = t.type },
    TelescopePreviewExecute { fg = t.method },
    -- TelescopePreviewHyphen  {},
    -- TelescopePreviewSticky  {},
    TelescopePreviewSize { fg = t.number },
    TelescopePreviewUser { fg = t.property },
    TelescopePreviewGroup { fg = t.property },
    TelescopePreviewDate { fg = t.string },
    -- TelescopePreviewMessage  {},
    -- TelescopePreviewMessageFillchar  {},

    -- -- Used for Picker specific Results highlighting
    TelescopeResultsClass { Class },
    -- TelescopeResultsConstant  {},
    TelescopeResultsField { Field },
    -- TelescopeResultsFunction  {},
    -- TelescopeResultsMethod  {},
    -- TelescopeResultsOperator  {},
    -- TelescopeResultsStruct  {},
    TelescopeResultsVariable { Identifier },

    -- TelescopeResultsLineNr  {},
    -- TelescopeResultsIdentifier  {},
    -- TelescopeResultsNumber  {},
    -- TelescopeResultsComment  {},
    TelescopeResultsSpecialComment { Comment },

    -- -- Used for git status Results highlighting
    -- TelescopeResultsDiffChange  {},
    -- TelescopeResultsDiffAdd  {},
    -- TelescopeResultsDiffDelete  {},
    -- TelescopeResultsDiffUntracked  {},

    LspFloatWinNormal { NormalFloat },
    LspFloatWinBorder { fg = t.punctuation },

    -- code action
    LspSagaCodeActionBorder { LspFloatWinBorder },
    LspSagaCodeActionTitle { fg = t.constant },
    LspSagaCodeActionContent { fg = t.primary },

    -- finder
    LspSagaLspFinderBorder { LspFloatWinBorder },
    LspSagaAutoPreview { LspFloatWinBorder },
    LspSagaFinderSelection { bg = t.selection },
    TargetFileName { Identifier },
    FinderParam { fg = t.constant },
    DefinitionsIcon { fg = t.punctuation },
    Definitions { Title },
    DefinitionCount { fg = t.attribute },
    ReferencesIcon { fg = t.punctuation },
    References { Title },
    ReferencesCount { fg = t.attribute },
    ImplementsIcon { fg = t.punctuation },
    Implements { Title },
    ImplementsCount { fg = t.attribute },

    --finder spinner
    FinderSpinnerBorder { LspFloatWinBorder },
    FinderSpinnerTitle { Identifier },
    FinderSpinner { fg = t.primary, bold = true },


    LspSagaBorderTitle { Title },
    LspSagaHoverBorder { LspFloatWinBorder },
    LspSagaRenameBorder { LspFloatWinBorder },
    LspSagaDefPreviewBorder { LspFloatWinBorder },
    LspSagaSignatureHelpBorder { LspFloatWinBorder },

    LspSagaDiagnosticBorder { LspFloatWinBorder },
    LspSagaDiagnosticHeader { LspSagaCodeActionTitle },

    -- lightbulb
    LspSagaLightBulb { fg = t.attribute },

    -- -- outline
    LSOutlineFile { Identifier },
    LSOutlineModule { Statement },
    LSOutlineNamespace { Statement },
    LSOutlinePackage { Statement },
    LSOutlineClass { Type },
    LSOutlineMethod { Method },
    LSOutlineProperty { Property },
    LSOutlineField { Property },
    LSOutlineConstructor { sym "@constructor" },
    LSOutlineEnum { Type },
    LSOutlineInterface { Type },
    LSOutlineFunction { Method },
    LSOutlineVariable { Identifier },
    LSOutlineConstant { Constant },
    LSOutlineString { String },
    LSOutlineNumber { Number },
    LSOutlineBoolean { Boolean },
    LSOutlineArray { Operator },
    LSOutlineObject { Operator },
    LSOutlineKey { Statement },
    LSOutlineNull { LSOutlineBoolean },
    LSOutlineEnumMember { Type },
    LSOutlineStruct { Type },
    LSOutlineEvent { Statement },
    LSOutlineOperator { Operator },
    LSOutlineTypeParameter { Type },
    LSOutlineTypeAlias { Type },
    LSOutlineParameter { sym "@parameter" },
    LSOutlineStaticMethod { Method },
    LSOutlineMacro { Method },
    OutlineIndentOdd { Whitespace },
    OutlineIndentEvn { Whitespace },

    -- Trouble
    TroubleCount { fg = t.number },
    TroubleNormal { bg = t.bgFloat },
    -- TroubleTextInformation {},
    -- TroubleSignWarning {},
    TroubleLocation { fg = t.attribute },
    -- TroubleWarning {},
    -- TroublePreview {},
    -- TroubleTextError {},
    -- TroubleSignInformation {},
    -- TroubleIndent {},
    -- TroubleSource {},
    -- TroubleSignHint {},
    -- TroubleSignOther {},
    -- TroubleFoldIcon {},
    -- TroubleTextWarning {},
    -- TroubleCode {},
    -- TroubleInformation {},
    -- TroubleSignError { fg = t.number},
    -- TroubleFile {},
    -- TroubleHint {},
    -- TroubleTextHint {},
    TroubleText {},


    -- Cmp
    CmpDocumentation { fg = t.fg, bg = t.bgFloat },
    CmpDocumentationBorder { fg = t.punctuation, bg = t.bgFloat },

    CmpItemAbbr { fg = t.fg },
    CmpItemAbbrDeprecated { fg = t.fg, gui = "strikethrough" },
    CmpItemAbbrMatch { fg = t.primary },
    CmpItemAbbrMatchFuzzy { fg = t.primary },

    CmpItemMenu { fg = t.attribute },

    CmpItemKindDefault { fg = t.fg },

    CmpItemKindKeyword { fg = t.keyword },

    CmpItemKindVariable { fg = t.fg },
    CmpItemKindConstant { fg = t.constant },
    CmpItemKindReference { fg = t.fg },
    CmpItemKindValue { fg = t.fg },

    CmpItemKindFunction { fg = t.method },
    CmpItemKindMethod { fg = t.method },
    CmpItemKindConstructor { fg = t.type },

    CmpItemKindClass { fg = t.type },
    CmpItemKindInterface { fg = t.type },
    CmpItemKindStruct { fg = t.type },
    CmpItemKindEvent { fg = t.label },
    CmpItemKindEnum { fg = t.type },
    CmpItemKindUnit { fg = t.number },

    CmpItemKindModule { fg = t.yellow },

    CmpItemKindProperty { fg = t.property },
    CmpItemKindField { fg = t.property },
    CmpItemKindTypeParameter { fg = t.type },
    CmpItemKindEnumMember { fg = t.type },
    CmpItemKindOperator { fg = t.punctuation },
    CmpItemKindSnippet { fg = t.label },

    -- nvim illuminate
    IlluminatedWordText { bg = t.grey7 },
    IlluminatedWordRead { bg = t.grey7 },
    IlluminatedWordWrite { bg = t.grey7 },

    CursorWord = { bg = t.grey7 },
    CursorWord0 = { bg = t.grey7 },
    CursorWord1 = { bg = t.grey7 },

    -- mason
    MasonNormal { NormalFloat },
    MasonHeader { bg = t.primary, fg = t.bg },
    MasonHeaderSecondary { bg = t.constant, fg = t.bg },

    MasonHighlight { fg = t.primary },
    MasonHighlightBlock { bg = t.primary, fg = t.bg },
    MasonHighlightBlockBold { bg = t.primary, fg = t.bg, gui = "bold" },

    MasonHighlightSecondary { fg = t.constant },
    MasonHighlightBlockSecondary { bg = t.constant, fg = t.bg },
    MasonHighlightBlockBoldSecondary { bg = t.constant, fg = t.bg, gui = "bold" },

    MasonLink { sym("@text.uri") },

    MasonMuted { fg = t.shade50 },
    MasonMutedBlock { bg = t.shade40, fg = t.bg },
    MasonMutedBlockBold { bg = t.shade40, fg = t.bg, gui = "bold" },

    MasonError { Error },

    MasonHeading { gui = "bold,underline", fg = t.fg },

    -- which-key
    WhichKey { Character },
    WhichKeyGroup { Tag },
    WhichKeySeparator { Operator },
    WhichKeyDesc { sym "@text.title" },
    -- WhichKeyFloat {},
    -- WhichKeyBorder {},
    -- WhichKeyValue { Character },

    --   -- Diffview
    DiffviewStatusAdded { fg = t.method },
    DiffviewStatusModified { fg = t.keyword },
    DiffviewStatusRenamed { fg = t.keyword },
    DiffviewStatusCopied { fg = t.keyword },
    DiffviewStatusTypeChanged { fg = t.keyword },
    DiffviewStatusUnmerged { fg = t.number },
    DiffviewStatusUnknown { fg = t.property },
    DiffviewStatusDeleted { fg = t.type },
    -- DiffviewStatusBroken {},
    DiffviewStatusIgnored { fg = t.comment },
    DiffviewFilePanelInsertions { fg = t.added },
    DiffviewFilePanelDeletions { fg = t.deleted },
    DiffviewFilePanelRootPath { fg = t.tag },
    DiffviewFilePanelTitle { fg = t.constant },
    DiffviewFilePanelCounter { fg = t.attribute },
    -- DiffviewFilePanelFileName {},
    DiffviewFilePanelPath { Comment },
    DiffviewFilePanelConflicts { fg = t.number },
    DiffviewFolderName { Directory },
    -- DiffviewFolderSign {},
    -- DiffviewReference {},
    DiffviewPrimary { fg = t.keyword },
    DiffviewSecondary { fg = t.tag },


    -- nvim tree
    NvimTreeNormal { bg = t.bgFloat },
    NvimTreeNormalNC { bg = t.bgFloat },
    NvimTreeWindowPicker { fg = t.fg, bg = t.selection, gui = "bold" },
    NvimTreeIndentMarker { fg = t.punctuation },

    NvimTreeRootFolder { fg = t.tag },
    NvimTreeFolderIcon { fg = t.keyword },
    NvimTreeFolderName { fg = t.tag },
    NvimTreeOpenedFolderName { fg = t.keyword },
    NvimTreeSpecialFile { fg = t.constant },
    NvimTreeExecFile { fg = t.method },

    NvimTreeGitStaged { fg = t.method },
    NvimTreeGitDirty { fg = t.type },
    NvimTreeGitMerge { fg = t.number },
    NvimTreeGitDeleted { fg = t.deleted },
    NvimTreeGitNew { fg = t.method },

    GitConflictCurrent { bg = t.mergeCurrent, blend = 5 },
    GitConflictIncoming { bg = t.mergeIncoming, blend = 5 },
    GitConflictAncestor { bg = t.mergeParent, blend = 5 },
    GitConflictCurrentLabel { bg = t.mergeCurrentLabel, blend = 5 },
    GitConflictIncomingLabel { bg = t.mergeIncomingLabel, blend = 5 },
    GitConflictAncestorLabel { bg = t.mergeParentLabel, blend = 5 },

    -- -- Notify.
    NotifyBackground { NormalFloat },
    NotifyERRORBorder { Normal, fg = t.error },
    NotifyWARNBorder { Normal, fg = t.warning },
    NotifyINFOBorder { Normal, fg = t.info },
    NotifyDEBUGBorder { Normal, fg = t.punctuation },
    NotifyTRACEBorder { Normal, fg = t.property },
    NotifyERRORIcon { NotifyERRORBorder },
    NotifyWARNIcon { NotifyWARNBorder },
    NotifyINFOIcon { NotifyINFOBorder },
    NotifyDEBUGIcon { NotifyDEBUGBorder },
    NotifyTRACEIcon { NotifyTRACEBorder },
    NotifyERRORTitle { NotifyERRORBorder },
    NotifyWARNTitle { NotifyWARNBorder },
    NotifyINFOTitle { NotifyINFOBorder },
    NotifyDEBUGTitle { NotifyDEBUGBorder },
    NotifyTRACETitle { NotifyTRACEBorder },

    -- -- Visual Multi.
    -- VM_Extend = { bg = colors.selection_inactive },
    -- VM_Cursor = { bg = colors.selection_inactive, sp = colors.fg, underline = true },
    -- VM_Insert = { sp = colors.fg, underline = true },
    -- VM_Mono = { fg = colors.bg, bg = colors.comment },


    -- hlargs (semantic parameter highlighting)
    Hlargs { sym "@parameter" },

    -- basic highlighting without treesitter

    -- javascript
    javaScript { Identifier },
    javaScriptIdentifier { Statement },
    javaScriptFunction { Statement },
    javaScriptParens { Punctuation },
    javaScriptBraces { Punctuation },
    javaScriptNumber { Number },

    -- typescript
    typeScriptImport { Statement },
    typeScriptExport { Statement },
    typeScriptIdentifier { Statement },
    typescriptVariable { Statement },
    typeScriptFunction { Statement },
    typescriptPredefinedType { sym "@type.builtin" },
    typescriptClassStatic { Statement },
    typescriptNodeGlobal { Statement },
    typescriptExceptions { Statement },
    typeScriptParens { Punctuation },
    typeScriptBraces { Punctuation },
    typescriptTypeBrackets { Punctuation },
    typescriptInterfaceTypeParameter { Punctuation },
    typescriptConditionalType { Punctuation },
    typeScriptNumber { Number },
    typeScriptAliasDeclaration { Type },
    typeScriptTypeReference { Type },
    typeScriptTypeParameter { Type },
    typescriptClassName { Type },
    typescriptClassHeritage { Type },
    typescriptProp { Property },
    typescriptOperator { Operator },
    typescriptBinaryOp { Operator },
    typescriptDocNotation { fg = t.shade50 },
    typescriptDocTags { typescriptDocNotation },

    -- json
    jsonKeyword { Property },
    jsonQuote { String },
    jsonBraces { Punctuation },
    jsonBraces { jsonBraces },

    --html
    htmlTagName { Tag },
    htmlSpecialTagName { Tag },
    htmlTag { htmlTagName },
    htmlEndTag { htmlTagName },
    htmlTagN { htmlTagName },
    htmlArg { Special },
    htmlSpecialChar { Constant },

    -- css
    cssProp { Property },
    cssBraces { Punctuation },
    cssNoise { Punctuation },
    cssSelectorOp { Punctuation },
    cssSelectorOp2 { Punctuation },
    cssAttrComma { Punctuation },
    cssClassNameDot { Punctuation },
    cssFunctionComma { Punctuation },
    cssClassName { Special },
    cssIdentifier { Type },
    cssImportant { Statement },
    cssTagName { Tag },
    cssUrl { String, gui = "underline" },
    cssUnitDecorators { Constant },

    -- rust
    rustModPathSep { Punctuation },
    rustFoldBraces { Punctuation },
    rustBoxPlacementBalance { Punctuation },
    rustSigil { Punctuation },
    rustStorage { Statement },

    -- ruby
    rubyConstant { Constant },
    rubyCurlyBlockDelimiter { Punctuation },
    rubyInterpolation { Punctuation },
    rubyInterpolationDelimiter { Punctuation },
    rubyStringDelimiter { String },
    rubyKeywordAsMethod { Function },

    -- python
    pythonDecorator { sym "@annotation" },
    pythonDecoratorName { sym "@annotation" },
    pythonAttribute { Property },
    pythonBuiltin { sym "@type.builtin" },

    -- yaml
    yamlBlockMappingKey { Property },
    yamlKeyValueDelimiter { Punctuation },
    yamlNodeTag { Statement },

  }
end)
return theme


-- -- vi:nowrap
