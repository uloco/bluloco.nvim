local lush = require('lush')
local hsl = lush.hsl

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
  bgFloat     = hsl("#252932"),
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
  primary     = hsl("#3691ff"),
  selection   = hsl("#274670"),
  search      = hsl("#1A7247"),
  diffAdd     = hsl("#105B3D"),
  diffChange  = hsl("#10415B"),
  diffDelete  = hsl("#522E34"),
  added       = hsl("#177F55"),
  changed     = hsl("#1B6E9B"),
  delted      = hsl("#A14D5B"),
  diffText    = hsl("#10415B").lighten(12),
  error       = hsl("#ff2e3f"),
  errorBG     = hsl("#FDCFD1"),
  warning     = hsl("#da7a43"),
  warningBG   = hsl("#F2DBCF"),
  info        = hsl("#3691ff"),
  infoBG      = hsl("#D4E3FA"),
  hint        = hsl("#7982DA")
}

local light = {
  bg          = hsl("#F9F9F9"),
  bgFloat     = hsl("#F0F0F0"),
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
  primary     = hsl("#0099e1"),
  selection   = hsl("#d2ecff"),
  search      = hsl("#b1eacf"),
  diffAdd     = hsl("#c5f6c8"),
  diffChange  = hsl("#C2E4FF"),
  diffDelete  = hsl("#fac1c6"),
  added       = hsl("#3cbc66"),
  changed     = hsl("#0099e1"),
  deleted     = hsl("#FA7883"),
  diffText    = hsl("#C2E4FF").darken(4),
  error       = hsl("#ff0000"),
  errorBG     = hsl("#FCE4E4"),
  warning     = hsl("#ff8f3a"),
  warningBG   = hsl("#FBE4D5"),
  info        = hsl("#0099e1"),
  infoBG      = hsl("#D2ECFF"),
  hint        = hsl("#7982DA"),
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

t.grey3 = t.shade3.mix(t.primary, 3)
t.grey5 = t.shade5.mix(t.primary, 5)
t.grey7 = t.shade7.mix(t.primary, 7)
t.grey10 = t.shade10.mix(t.primary, 10)
t.grey20 = t.shade20.mix(t.primary, 10)
t.grey25 = t.shade25.mix(t.primary, 10)
t.grey30 = t.shade30.mix(t.primary, 10)

t.white = hsl("#ffffff")
t.green = hsl("#008200")

-- Call lush with our lush-spec.
-- ignore the "theme" variable for now
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
  local sym = injected_functions.sym

  return {
    -- Normal { fg = t.fg, bg = "NONE" }, -- normal text
    Normal { fg = t.fg }, -- normal text
    CursorLine { bg = t.grey3 }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    CursorColumn { CursorLine }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    Whitespace { fg = t.grey10 },
    Comment { fg = t.comment },
    LineNr { Comment }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr { Comment }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    Search { bg = t.search },
    IncSearch { bg = t.cursor.mix(t.bg, 10), fg = t.bg },
    CurSearch { Search },
    NormalFloat { bg = t.bgFloat, blend = 5 }, -- Normal text in floating windows.
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
    EndOfBuffer { Normal }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    TermCursor { Cursor }, -- cursor in a focused terminal
    TermCursorNC {}, -- cursor in an unfocused terminal
    ErrorMsg { fg = t.error }, -- error messages on the command line
    VertSplit { fg = t.grey30 }, -- the column separating vertically split windows
    Winseparator { VertSplit }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    Folded { bg = t.grey10, fg = t.bg }, -- line used for closed folds
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
    -- TabLineSel { bg = t.shade10, sp = t.primary, gui = "underline" }, -- tab pages line, active tab page label
    TabLineSel { bg = t.primary, fg = t.shade3 }, -- tab pages line, active tab page label

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
    Operator { fg = t.punctuation }, -- "sizeof", "+", "*", etc.
    -- Keyword        { Statement }, --  any other keyword
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
    -- Special { Character }, -- (preferred) any special symbol
    -- SpecialChar {}, --  special character in a constant
    Tag { fg = t.tag, gui = "underline" }, --    you can use CTRL-] on this
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
    sym("@function.builtin") { fg = t.method },
    sym("@parameter") { fg = t.parameter },
    sym("@field") { Property },
    sym("@property") { Property },
    sym("@label") { fg = t.label }, -- For labels: `label:` in C and `:label:` in Lua.
    sym("@type") { Type },
    sym("@type.builtin") { Statement },
    sym("@namespace") { Statement },
    sym("@annotation") { sym("@label") }, -- For labels: `label:` in C and `:label:` in Lua.
    sym("@text") { Normal },
    sym("@text.strong") { Bold },
    sym("@text.italic") { Italic },
    sym("@text.underline") { Underlined },
    sym("@text.title") { Statement },
    sym("@text.literal") { Property },
    sym("@text.uri") { fg = t.tag, underline = true }, -- Any URI like a link or email.
    sym("@variable") { Normal }, -- Variable names that are defined by the languages, like `this` or `self`.
    sym("@variable.builtin") { Statement }, -- Variable names that are defined by the languages, like `this` or `self`.
    --     -- sym"@string.special"    { }, -- SpecialChar
    --     -- sym"@character.special" { }, -- SpecialChar
    --     -- sym"@function.macro"    { }, -- Macro
    --     -- sym"@debug"             { }, -- Debug

    -- Language Overrides
    -- JSON
    sym("@label.json") { fg = t.property }, -- For labels: `label:` in C and `:label:` in Lua.

    -- help files
    sym("@label.help") { sym "@text.uri" },


    --  gitsigns
    GitSignsAdd { fg = t.added },
    GitSignsChange { fg = t.changed },
    GitSignsDelete { fg = t.delted },

    -- TODO: improve bufferline

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
    LspSagaCodeActionContent { fg = t.method },

    -- finder
    LspSagaLspFinderBorder { LspFloatWinBorder },
    LspSagaAutoPreview { LspFloatWinBorder },
    LspSagaFinderSelection { bg = t.selection },
    TargetFileName { fg = t.property },
    FinderParam { fg = t.constant },
    DefinitionsIcon { fg = t.string },
    Definitions { Title },
    DefinitionCount { fg = t.number },
    ReferencesIcon { fg = t.string },
    References { Title },
    ReferencesCount { fg = t.number },
    ImplementsIcon { fg = t.string },
    Implements { Title },
    ImplementsCount { fg = t.number },

    --finder spinner
    FinderSpinnerBorder { LspFloatWinBorder },
    FinderSpinnerTitle { LspSagaCodeActionTitle },
    FinderSpinner { fg = t.primary, bold = true },


    LspSagaBorderTitle { Title },
    LspSagaHoverBorder { LspFloatWinBorder },
    LspSagaRenameBorder { LspFloatWinBorder },
    LspSagaDefPreviewBorder { LspFloatWinBorder },
    LspSagaSignatureHelpBorder { LspFloatWinBorder },

    LspSagaDiagnosticBorder { LspFloatWinBorder },
    LspSagaDiagnosticHeader { LspSagaCodeActionTitle },

    -- lightbulb
    LspSagaLightBulb { fg = t.attribute }



    -- TODO: trouble
    -- TODO: help files
    -- TODO: cmp + preview / docs etc


  }
end)
return theme



-- -- vi:nowrap
