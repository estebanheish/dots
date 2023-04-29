vim.g.colors_name = 'kiss'

local black  = { "#0a0a0a", 235, 'black' }
local black2 = { "#141414", 235, 'black' }
local black3 = { "#181818", 235, 'black' }
local gray5  = { "#282828", 235, 'black' }
local gray4  = { "#2c2c2c", 236, 'gray' }
local gray3  = { "#333333", 236, 'gray' }
local gray2  = { "#3b3b3b", 237, 'gray' }
local gray   = { "#555555", 240, 'gray' }
local white2 = { "#e2e2e2", 254, 'white' }
local white  = { "#f6f6f6", 255, 'white' }

local red           = { "#ff6c62", 203, 'red' }
local orange_bright = { "#ff8f86", 210, 'red' }
local orange        = { "#f09483", 210, 'orange' }
local yellow        = { "#f9f1a5", 229, 'yellow'}
local yellow2       = { "#ffcda8", 223, 'yellow' }
local green         = { "#09f7a0", 49, 'green'}
local green2        = { "#82ffa1", 49,  'green' }
local purple        = { "#9691ff", 105, 'purple' }
local purple_light  = { "#c4b7ff", 147, 'purple' }
local cyan          = { "#6bdfe6", 80,  'cyan' }
local turquoise     = { "#21bfc2", 37,  'turquoise' }
local blue          = { "#3fb2ff", 39,  'blue' }
local blue2         = { "#3482d1", 68,  'blue' }
local blue3         = { "#79b8ff", 111, 'blue' }
local magenta2      = { "#ec6a88", 204, 'magenta'}
local magenta       = { "#ff7ab2", 211, 'magenta' }

local background = black3

--[[ These are the ones you should edit. ]]
-- This is the only highlight that must be defined separately.
local highlight_group_normal = {fg = white, bg = background }

-- This is where the rest of your highlights should go.
local highlight_groups = {
	--[[ 4.1. Text Analysis ]]
	Comment = {fg = white2, style = 'italic'},
	NonText = {fg = gray_darker},
	EndOfBuffer = 'NonText',
	Whitespace  = 'NonText',

	--[[ 4.1.1. Literals]]
	Constant = {fg = white},
	String = {fg = green2},
	Character = {fg = yellow},
	Number  = {fg = magenta},
	Boolean = {fg = yellow},
	Float   = 'Number',

	--[[ 4.1.2. Identifiers]]
	Identifier = {fg = highlight_group_normal.fg},
	Function = {fg = blue},

	--[[ 4.1.3. Syntax]]
	Statement   = {fg = purple},
	Conditional = {fg = purple, style = 'italic'},
	Repeat   = {fg = purple, style = 'italic'},
	Label    = {fg = turquoise, style = 'bold'},
	Operator = {fg = white2, style = 'bold'},
	Keyword  = {fg = purple},
	Exception = {fg = red, style = 'bold'},
	Noise = 'Delimiter',

	--[[ 4.1.4. Metatextual Information]]
	PreProc = {fg = cyan},
	Include = {fg = green_light, style = 'nocombine'},
	Define = {fg = blue, style = 'nocombine'},
	Macro  = {fg = blue, style = 'italic'},
	PreCondit = {fg = tan, style = 'italic'},

	--[[ 4.1.5. Semantics]]
	Type         = {fg = cyan},
	StorageClass = {fg = orange_light, style = 'bold'},
	Structure = {fg = orange, style = 'bold'},
	Typedef = {fg = orange, style = 'italic'},

	--[[ 4.1.6. Edge Cases]]
	Special = {fg = purple_light, style = 'bold'},
	SpecialChar = {fg = red_light, style = 'italic'},
	SpecialKey = 'Character',
	Tag = 'Underlined',
	Delimiter = {fg = white},
	SpecialComment = {fg = gray, style = {'bold', 'nocombine'}},
	Debug = 'WarningMsg',

	--[[ 4.1.7. Help Syntax]]
	Underlined = {fg = turqoise, style = 'underline'},
	Ignore = {fg = gray},
	Error = {fg = red, bg = background, style = 'bold'},
	Todo = {fg = turquoise, bg = background, style = 'bold'},
	Hint = {fg = blue, bg = background, style = 'bold'},
	Info = {fg = green2, bg = background, style = 'bold'},
	Warning = {fg = yellow, bg = background, style = 'bold'},

	--[[ 4.2... Editor UI  ]]
	--[[ 4.2.1. Status Line]]
	StatusLine = {fg = green_light, bg = gray_darker},
	StatusLineNC = function(self) return {fg = gray, bg = self.StatusLine.bg} end,
	StatusLineTerm = 'StatusLine',
	StatusLineTermNC = 'StatusLineNC',

	--[[ 4.2.2. Separators]]
	FloatBorder = {fg = gray},
	TabLine = function(self) return {fg = highlight_group_normal.fg, bg = self.StatusLine.bg} end,
	TabLineFill = function(self) return {fg = self.TabLine.bg, bg = black} end,
	TabLineSel = function(self) return {fg = self.TabLine.fg, bg = highlight_group_normal.bg} end,
	Title = {style = 'bold'},
	VertSplit = {fg = white},

	--[[ 4.2.3. Conditional Line Highlighting]]
	Conceal = 'NonText',
	CursorLine   = {bg = gray5},
	CursorLineNr = {fg = blue},
	debugBreakpoint = 'ErrorMsg',
	debugPC = 'ColorColumn',
	LineNr  = {fg = gray},
	QuickFixLine = function(self) return {bg = self.StatusLine.bg} end,
	-- Visual    = {style = 'inverse'},
	Visual    = {bg = gray2},
	VisualNOS = {bg = orange},

	--[[ 4.2.4. Popup Menu]]
	Pmenu = {fg = highlight_group_normal.fg, bg = gray5},
	PmenuSbar = {bg = gray5},
	PmenuSel  = {fg = white2, bg = gray3},
	PmenuThumb = {bg = gray5},
	WildMenu = 'PmenuSel',

	--[[ 4.2.5. Folds]]
	FoldColumn = {bg = gray_darker, style = 'bold'},
	Folded = {fg = purple_light,  bg = gray2, style = 'italic'},

	--[[ 4.2.6. Diffs]]
	DiffAdd    = {fg = black, bg = green_dark},
	DiffChange = {},
	DiffDelete = function(self) return {fg = self.DiffAdd.fg, bg = red} end,
	DiffText   = function(self) return {fg = self.DiffAdd.fg, bg = yellow} end,

	--[[ 4.2.7. Searching]]
	IncSearch  = {style = 'inverse'},
	MatchParen = {fg = yellow, style = {'bold', 'underline'}},
	Search = {style = {'underline', color = white}},

	--[[ 4.2.8. Spelling]]
	SpellBad   = {style = {'undercurl', color = red}},
	SpellCap   = {style = {'undercurl', color = yellow}},
	SpellLocal = {style = {'undercurl', color = green}},
	SpellRare  = {style = {'undercurl', color = orange}},

	--[[ 4.2.9. Conditional Column Highlighting]]
	ColorColumn = {style = 'inverse'},
	SignColumn  = {},

	--[[ 4.2.10. Messages]]
	ErrorMsg = {fg = red, style = 'bold'},
	HintMsg  = {fg = magenta, style = 'italic'},
	InfoMsg  = {fg = pink_light, style = 'italic'},
	ModeMsg  = {fg = yellow},
	WarningMsg = {fg = orange, style = 'bold'},
	Question   = {fg = orange_light, style = 'underline'},

	--[[ 4.2.11. LSP / Diagnostics ]]
	DiagnosticError = 'Error',
	DiagnosticFloatingError = 'ErrorMsg',
	DiagnosticSignError = 'DiagnosticFloatingError',

	DiagnosticWarn = 'Warning',
	DiagnosticFloatingWarn = 'WarningMsg',
	DiagnosticSignWarn = 'DiagnosticFloatingWarn',

	DiagnosticHint = 'Hint',
	DiagnosticFloatingHint = 'HintMsg',
	DiagnosticSignHint = 'DiagnosticFloatingHint',

	DiagnosticInfo = 'Info',
	DiagnosticFloatingInfo = 'InfoMsg',
	DiagnosticSignInfo = 'DiagnosticFloatingInfo',

	DiagnosticUnderlineError = {style = {'undercurl', color = red}},
	DiagnosticUnderlineHint  = {style = {'undercurl', color = magenta}},
	DiagnosticUnderlineInfo  = {style = {'undercurl', color = pink_light}},
	DiagnosticUnderlineWarn = {style = {'undercurl', color = orange}},

	LspDiagnosticsDefaultError = 'DiagnosticError',
	LspDiagnosticsFloatingError = 'DiagnosticFloatingError',
	LspDiagnosticsSignError = 'DiagnosticSignError',

	LspDiagnosticsDefaultWarning = 'DiagnosticWarn',
	LspDiagnosticsFloatingWarning = 'DiagnosticFloatingWarn',
	LspDiagnosticsSignWarning = 'DiagnosticSignWarn',

	LspDiagnosticsDefaultHint = 'DiagnosticHint',
	LspDiagnosticsFloatingHint = 'DiagnosticFloatingHint',
	LspDiagnosticsSignHint = 'DiagnosticSignHint',

	LspDiagnosticsDefaultInformation = 'DiagnosticInfo',
	LspDiagnosticsFloatingInformation = 'DiagnosticFloatingInfo',
	LspDiagnosticsSignInformation = 'DiagnosticSignInfo',

	LspDiagnosticsUnderlineError = 'DiagnosticUnderlineError',
	LspDiagnosticsUnderlineHint  = 'DiagnosticUnderlineHint',
	LspDiagnosticsUnderlineInfo  = 'DiagnosticUnderlineInfo',
	LspDiagnosticsUnderlineWarning = 'DiagnosticUnderlineWarn',

	--[[ 4.2.12. Cursor ]]
	Cursor   = {style = 'inverse'},
	CursorIM = 'Cursor',
	CursorColumn = {bg = gray_dark},

	--[[ 4.2.13. Misc ]]
	Directory = {fg = ice, style = 'bold'},

	--[[ 4.3. Programming Languages
		Everything in this section is OPTIONAL. Feel free to remove everything
		here if you don't want to define it, or add more if there's something
		missing.
	]]
	--[[ 4.3.1. C ]]
	cConstant    = 'Constant',
	cCustomClass = 'Type',

	--[[ 4.3.2. C++ ]]
	cppSTLexception = 'Exception',
	cppSTLnamespace = 'String',

	--[[ 4.3.3 C# ]]
	csBraces = 'Delimiter',
	csClass  = 'Structure',
	csClassType = 'Type',
	csContextualStatement = 'Conditional',
	csEndColon = 'Delimiter',
	csGeneric  = 'Typedef',
	csInterpolation = 'Include',
	csInterpolationDelimiter = 'SpecialChar',
	csLogicSymbols  = 'Operator',
	csModifier = 'Keyword',
	csNew = 'Operator',
	csNewType = 'Type',
	csParens  = 'Delimiter',
	csPreCondit  = 'PreProc',
	csQuote = 'Delimiter',
	csRepeat  = 'Repeat',
	csStorage = 'StorageClass',
	csUnspecifiedStatement = 'Statement',
	csXmlTag = 'Define',
	csXmlTagName = 'Define',
	razorCode = 'PreProc',
	razorcsLHSMemberAccessOperator = 'Noise',
	razorcsRHSMemberAccessOperator = 'razorcsLHSMemberAccessOperator',
	razorcsStringDelimiter = 'razorhtmlValueDelimiter',
	razorcsTypeNullable = 'Special',
	razorcsUnaryOperatorKeyword = 'Operator',
	razorDelimiter = 'Delimiter',
	razorEventAttribute = 'PreCondit',
	razorFor  = 'razorIf',
	razorhtmlAttribute = 'htmlArg',
	razorhtmlAttributeOperator = 'Operator',
	razorhtmlTag = 'htmlTag',
	razorhtmlValueDelimiter = 'Delimiter',
	razorIf  = 'PreCondit',
	razorImplicitExpression = 'PreProc',
	razorLine = 'Constant',
	razorUsing = 'Include',

	--[[ 4.3.4. CSS ]]
	cssAtRule          = 'PreCondit',
	cssAttr            = 'Keyword',
	cssAttrComma       = 'Noise',
	cssAttrRegion      = 'Keyword',
	cssBraces          = 'Delimiter',
	cssClassName       = 'Identifier',
	cssClassNameDot    = 'Noise',
	cssFlexibleBoxAttr = 'cssAttr',
	cssFunctionComma   = 'Noise',
	cssImportant       = 'Exception',
	cssNoise           = 'Noise',
	cssProp            = 'Label',
	cssPseudoClass     = 'Special',
	cssPseudoClassId   = 'cssSelectorOp',
	cssSelectorOp      = 'Operator',
	cssTagName         = 'Structure',
	cssUnitDecorators  = 'Type',
	scssAmpersand      = 'Special',
	scssAttribute      = 'Noise',
	scssBoolean        = 'Boolean',
	scssDefault        = 'Keyword',
	scssElse           = 'scssIf',
	scssMixinName      = function(self)
		local super = self.cssClassName
		return {bg = super.bg, fg = super.fg, style = 'italic'}
	end,
	scssIf             = 'PreCondit',
	scssInclude        = 'Include',
	scssSelectorChar   = 'Delimiter',
	scssDefinition     = 'PreProc',
	scssSelectorName   = 'Identifier',
	scssVariable       = 'Define',
	scssVariableAssignment = 'Operator',

	--[[ 4.3.5. Dart ]]
	dartLibrary = 'Statement',

	--[[ 4.3.6. dot ]]
	dotKeyChar = 'Character',
	dotType    = 'Type',

	--[[ 4.3.7. Go ]]
	goBlock    = 'Delimiter',
	goBoolean  = 'Boolean',
	goBuiltins = 'Operator',
	goField    = 'Identifier',
	goFloat    = 'Float',
	goFormatSpecifier = 'Character',
	goFunction = 'Function',
	goFunctionCall   = 'goFunction',
	goFunctionReturn = {},
	goMethodCall = 'goFunctionCall',
	goParamType  = 'goReceiverType',
	goPointerOperator = 'SpecialChar',
	goPredefinedIdentifiers = 'Constant',
	goReceiver     = 'goBlock',
	goReceiverType = 'goTypeName',
	goSimpleParams = 'goBlock',
	goType = 'Type',
	goTypeConstructor = 'goFunction',
	goTypeName  = 'Type',
	goVarAssign = 'Identifier',
	goVarDefs   = 'goVarAssign',

	--[[ 4.3.8. HTML ]]
	htmlArg    = 'Label',
	htmlBold   = {fg = highlight_group_normal.fg, style = 'bold'},
	htmlTitle  = 'htmlBold',
	htmlEndTag = 'htmlTag',
	htmlH1 = 'markdownH1',
	htmlH2 = 'markdownH2',
	htmlH3 = 'markdownH3',
	htmlH4 = 'markdownH4',
	htmlH5 = 'markdownH5',
	htmlH6 = 'markdownH6',
	htmlItalic  = {style = 'italic'},
	htmlSpecialTagName = 'Keyword',
	htmlTag  = 'Special',
	htmlTagN = 'Typedef',
	htmlTagName = 'Type',

	--[[ 4.3.9. Java ]]
	javaClassDecl = 'Structure',

	--[[ 4.3.10. JavaScript ]]
	jsFuncBlock   = 'Function',
	jsObjectKey   = 'Type',
	jsReturn      = 'Keyword',
	jsVariableDef = 'Identifier',

	--[[ 4.3.11. JSON ]]
	jsonBraces = 'luaBraces',
	jsonEscape = 'SpecialChar',
	jsonKeywordMatch = 'Operator',
	jsonNull   = 'Constant',
	jsonQuote  = 'Delimiter',
	jsonString = 'String',
	jsonStringSQError = 'Exception',

	--[[ 4.3.12. Lua ]]
	luaBraces   = 'Structure',
	luaBrackets = 'Delimiter',
	luaBuiltin  = 'Keyword',
	luaComma    = 'Delimiter',
	luaFuncArgName = 'Identifier',
	luaFuncCall = 'Function',
	luaFuncId   = 'luaNoise',
	luaFuncKeyword = 'Type',
	luaFuncName   = 'Function',
	luaFuncParens = 'Delimiter',
	luaFuncTable  = 'Structure',
	luaIn     = 'luaRepeat',
	luaLocal  = 'Type',
	luaNoise  = 'Delimiter',
	luaParens = 'Delimiter',
	luaSpecialTable = 'Structure',
	luaSpecialValue = 'Function',
	luaStringLongTag = function(self)
		local delimiter = self.Delimiter
		return {bg = delimiter.bg, fg = delimiter.fg, style = 'italic'}
	end,

	--[[ 4.3.12. Make ]]
	makeCommands   = 'Statment',
	makeSpecTarget = 'Type',

	--[[ 4.3.13. Markdown ]]
	markdownCode = 'mkdCode',
	markdownCodeDelimiter = 'mkdCodeDelimiter',
	markdownH1 = {fg = red, style = 'bold'},
	markdownH2 = {fg = orange, style = 'bold'},
	markdownH3 = {fg = yellow, style = 'bold'},
	markdownH4 = {fg = green_dark, style = 'bold'},
	markdownH5 = {fg = cyan, style = 'bold'},
	markdownH6 = {fg = purple_light, style = 'bold'},
	markdownLinkDelimiter = 'mkdDelimiter',
	markdownLinkText = 'mkdLink',
	markdownLinkTextDelimiter = 'markdownLinkDelimiter',
	markdownUrl = 'mkdURL',
	mkdBold = 'Ignore',
	mkdBoldItalic = 'mkdBold',
	mkdCode = 'Keyword',
	mkdCodeDelimiter = 'mkdBold',
	mkdCodeEnd = 'mkdCodeStart',
	mkdCodeStart = 'mkdCodeDelimiter',
	mkdDelimiter = 'Delimiter',
	mkdHeading = 'Delimiter',
	mkdItalic  = 'mkdBold',
	mkdLineBreak = 'NonText',
	mkdLink = 'Underlined',
	mkdListItem  = 'Special',
	mkdRule = function(self) return {fg = self.Ignore.fg, style = {'underline', color = self.Delimiter.fg}} end,
	mkdURL = 'htmlString',

	--[[ 4.3.20. Python ]]
	pythonBrackets    = 'Delimiter',
	pythonBuiltinFunc = 'Operator',
	pythonBuiltinObj  = 'Type',
	pythonBuiltinType = 'Type',
	pythonClass       = 'Structure',
	pythonClassParameters = 'pythonParameters',
	pythonDecorator  = 'PreProc',
	pythonDottedName = 'Identifier',
	pythonError     = 'Error',
	pythonException = 'Exception',
	pythonInclude   = 'Include',
	pythonIndentError = 'pythonError',
	pythonLambdaExpr  = 'pythonOperator',
	pythonOperator = 'Operator',
	pythonParam    = 'Identifier',
	pythonParameters = 'Delimiter',
	pythonSelf = 'Statement',
	pythonSpaceError = 'pythonError',
	pythonStatement  = 'Statement',

	--[[ 4.3.21. Ruby ]]
	rubyClass  = 'Structure',
	rubyDefine = 'Define',
	rubyInterpolationDelimiter = 'Delimiter',

	--[[ 4.3.23. Scala ]]
	scalaKeyword = 'Keyword',
	scalaNameDefinition = 'Identifier',

	--[[ 4.3.24. shell ]]
	shDerefSimple = 'SpecialChar',
	shFunctionKey = 'Function',
	shLoop  = 'Repeat',
	shParen = 'Delimiter',
	shQuote = 'Delimiter',
	shSet   = 'Statement',
	shTestOpr = 'Debug',

	--[[ 4.3.25. Solidity ]]
	solBuiltinType  = 'Type',
	solContract     = 'Typedef',
	solContractName = 'Function',

	--[[ 4.3.26. TOML ]]
	tomlComment = 'Comment',
	tomlDate  = 'Special',
	tomlFloat = 'Float',
	tomlKey   = 'Label',
	tomlTable = 'Structure',

	--[[ 4.3.27. VimScript ]]
	vimCmdSep   = 'Delimiter',
	vimFunction = 'Function',
	vimFgBgAttrib = 'Constant',
	vimHiCterm = 'Label',
	vimHiCtermFgBg = 'vimHiCterm',
	vimHiGroup = 'Typedef',
	vimHiGui   = 'vimHiCterm',
	vimHiGuiFgBg = 'vimHiGui',
	vimHiKeyList = 'Operator',
	vimIsCommand = 'Identifier',
	vimOption = 'Keyword',
	vimScriptDelim = 'Ignore',
	vimSet = 'String',
	vimSetEqual = 'Operator',
	vimSetSep   = 'Delimiter',
	vimUserFunc = 'vimFunction',

	--[[ 4.3.28. XML ]]
	xmlAttrib = 'htmlArg',
	xmlEndTag = 'xmlTag',
	xmlEqual  = 'Operator',
	xmlTag    = 'htmlTag',
	xmlTagName = 'htmlTagName',

	--[[ 4.3.29. SQL ]]
	sqlKeyword = 'Keyword',
	sqlParen   = 'Delimiter',
	sqlSpecial = 'Constant',
	sqlStatement = 'Statement',
	sqlParenFunc = 'Function',

	--[[ 4.3.30. dos INI ]]
	dosiniHeader = 'Title',
	dosiniLabel  = 'Label',

	--[[ 4.3.31. Crontab ]]
	crontabDay  = 'StorageClass',
	crontabDow  = 'String',
	crontabHr   = 'Number',
	crontabMin  = 'Float',
	crontabMnth = 'Structure',

	--[[ 4.3.32. PlantUML ]]
	plantumlArrowLR   = 'Statement',
	plantumlColonLine = {},
	plantumlMindmap   = 'Label',
	plantumlMindmap2  = 'Label',

	--[[ 4.3.33. YAML ]]
	yamlInline = 'Delimiter',
	yamlKey = 'Label',

	--[[ 4.3.34. Git ]]
	diffAdded = 'DiffAdd',
	diffRemoved = 'DiffDelete',
	gitcommitHeader = 'SpecialComment',
	gitcommitDiscardedFile = 'gitcommitSelectedFile',
	gitcommitOverFlow = 'Error',
	gitcommitSelectedFile = 'Directory',
	gitcommitSummary  = 'Title',
	gitcommitUntrackedFile = 'gitcommitSelectedFile',
	gitconfigAssignment = 'String',
	gitconfigEscape = 'SpecialChar',
	gitconfigNone  = 'Operator',
	gitconfigSection = 'Structure',
	gitconfigVariable = 'Label',
	gitrebaseBreak = 'Keyword',
	gitrebaseCommit = 'Tag',
	gitrebaseDrop = 'Exception',
	gitrebaseEdit = 'Define',
	gitrebaseExec = 'PreProc',
	gitrebaseFixup = 'gitrebaseSquash',
	gitrebaseMerge = 'PreProc',
	gitrebasePick  = 'Include',
	gitrebaseReset = 'gitrebaseLabel',
	gitrebaseReword  = 'gitrebasePick',
	gitrebaseSquash  = 'Macro',
	gitrebaseSummary = 'Title',

	--[[ 4.3.35. Vimtex ]]
	texMathRegion = 'Number',
	texMathSub   = 'Number',
	texMathSuper = 'Number',
	texMathRegionX  = 'Number',
	texMathRegionXX = 'Number',

	--[[ 4.3.36. Coq ]]
	coqConstructor   = 'Constant',
	coqDefBinderType = 'coqDefType',
	coqDefContents1  = 'coqConstructor',
	coqDefType  = 'Typedef',
	coqIndBinderTerm  = 'coqDefBinderType',
	coqIndConstructor = 'Delimiter',
	coqIndTerm = 'Type',
	coqKwd = 'Keyword',
	coqKwdParen   = 'Function',
	coqProofDelim = 'coqVernacCmd',
	coqProofDot   = 'coqTermPunctuation',
	coqProofPunctuation = 'coqTermPunctuation',
	coqRequire = 'Include',
	coqTactic  = 'Operator',
	coqTermPunctuation = 'Delimiter',
	coqVernacCmd = 'Statement',
	coqVernacPunctuation = 'coqTermPunctuation',

	--[[ 4.3.37 Help ]]
	helpHeader = 'Label',
	helpOption = 'Keyword',
	helpHeadline = 'Title',
	helpSectionDelim = 'Delimiter',
	helpHyperTextJump = 'Underlined',

	--[[ 4.3.38 Man ]]
	-- manBold = function(self) return vim.tbl_extend('force', self.mkdCode, {style = 'nocombine'}) end,
	manOptionDesc = 'Special',
	manReference = 'Tag',
	manUnderline = 'Label',

	--[[ 4.3.39 Rust ]]
	rustAssert = 'Debug',
	rustCharacterDelimiter = 'rustNoise',
	rustIdentifier = 'Identifier',
	rustStaticLifetime = 'rustStorage',
	rustStringDelimiter = 'rustNoise',

	--[[ 4.3.40 XXD ]]
	xxdAddress = 'Label',
	xxdAscii = 'Character',
	xxdDot = 'Ignore',
	xxdSep = 'Delimiter',

	--[[ 4.4. Plugins
		Everything in this section is OPTIONAL. Feel free to remove everything
		here if you don't want to define it, or add more if there's something
		missing.
	]]
	--[[ 4.4.1. ALE ]]
	ALEErrorSign   = 'DiagnosticSignError',
	ALEWarningSign = 'DiagnosticSignWarn',

	--[[ 4.4.2. coc.nvim ]]
	CocErrorHighlight = 'DiagnosticUnderlineError',
	CocErrorSign = 'DiagnosticSignError',
	CocHintHighlight  = 'DiagnosticUnderlineHint',
	CocHintSign  = 'DiagnosticSignHint',
	CocInfoHighlight  = 'DiagnosticUnderlineInfo',
	CocInfoSign  = 'DiagnosticSignInfo',
	CocWarningHighlight = 'DiagnosticUnderlineWarn',
	CocWarningSign = 'DiagnosticSignWarn',

	--[[ 4.4.2. vim-jumpmotion / vim-easymotion ]]
	EasyMotion = 'IncSearch',
	JumpMotion = 'EasyMotion',

	--[[ 4.4.4. vim-gitgutter / vim-signify / gitsigns.nvim ]]
	GitGutterAdd    = {fg = green},
	GitGutterChange = {fg = yellow},
	GitGutterDelete = {fg = red},
	GitGutterChangeDelete = {fg = orange},

	SignifySignAdd    = 'GitGutterAdd',
	SignifySignChange = 'GitGutterChange',
	SignifySignDelete = 'GitGutterDelete',
	SignifySignChangeDelete = 'GitGutterChangeDelete',

	GitSignsAdd = 'GitGutterAdd',
	GitSignsChange = 'GitGutterChange',
	GitSignsDelete = 'GitGutterDelete',

	--[[ 4.4.5. vim-indent-guides ]]
	IndentGuidesOdd  = {bg = gray_darker},
	IndentGuidesEven = {bg = gray},

	--[[ 4.4.7. NERDTree ]]
	NERDTreeCWD = 'Label',
	NERDTreeUp  = 'Operator',
	NERDTreeDir = 'Directory',
	NERDTreeDirSlash = 'Delimiter',
	NERDTreeOpenable = 'NERDTreeDir',
	NERDTreeClosable = 'NERDTreeOpenable',
	NERDTreeExecFile = 'Function',
	NERDTreeLinkTarget = 'Tag',

	--[[ 4.4.8. nvim-treesitter ]]
	['@constant.builtin'] = '@constant',
	['@constant.macro'] = '@define',
	['@constructor'] = '@function',
	['@function.builtin'] = '@function',
	['@function.macro'] = '@macro',
	['@namespace'] = 'Directory',
	['@string.escape'] = '@string.special',
	['@tag'] = 'Tag',
	['@text.danger'] = 'ErrorMsg',
	['@text.uri'] = '@test.underlined',
	['@text.warning'] = 'WarningMsg',

	--[[ 4.4.9. barbar.nvim ]]
	BufferAlternate       = function(self) return {fg = self.BufferVisible.fg, bg = gray_dark} end,
	BufferAlternateERROR  = function(self) return {fg = self.ErrorMsg.fg, bg = gray_dark} end,
	BufferAlternateHINT   = function(self) return {fg = self.HintMsg.fg, bg = gray_dark} end,
	BufferAlternateIndex  = function(self) return {fg = self.Number.fg, bg = gray_dark} end,
	BufferAlternateINFO   = function(self) return {fg = self.InfoMsg.fg, bg = gray_dark} end,
	BufferAlternateMod    = function(self) return {fg = self.BufferVisibleMod.fg, bg = gray_dark, style = 'bold'} end,
	BufferAlternateSign   = {fg = teal, bg = gray_dark},
	BufferAlternateTarget = function(self) return {fg = self.BufferAlternateSign.fg, bg = gray_dark, style = 'italic'} end,
	BufferAlternateWARN   = function(self) return {fg = self.WarningMsg.fg, bg = gray_dark} end,

	BufferCurrent       = 'TabLineSel',
	BufferCurrentERROR  = function(self) return {fg = self.ErrorMsg.fg, bg = self.BufferCurrent.bg} end,
	BufferCurrentHINT   = function(self) return {fg = self.HintMsg.fg, bg = self.BufferCurrent.bg} end,
	BufferCurrentIndex  = function(self) return {fg = self.Number.fg, bg = self.BufferCurrent.bg} end,
	BufferCurrentINFO   = function(self) return {fg = self.InfoMsg.fg, bg = self.BufferCurrent.bg} end,
	BufferCurrentMod    = {fg = tan, bg = black, style = 'bold'},
	BufferCurrentSign   = 'HintMsg',
	BufferCurrentTarget = 'BufferCurrentSign',
	BufferCurrentWARN   = function(self) return {fg = self.WarningMsg.fg, bg = self.BufferCurrent.bg} end,

	BufferInactive       = 'BufferVisible',
	BufferInactiveERROR  = function(self) return {fg = self.ErrorMsg.fg, bg = self.BufferInactive.bg} end,
	BufferInactiveHINT   = function(self) return {fg = self.HintMsg.fg, bg = self.BufferInactive.bg} end,
	BufferInactiveIndex  = function(self) return {fg = self.Number.fg, bg = self.BufferInactive.bg} end,
	BufferInactiveINFO   = function(self) return {fg = self.InfoMsg.fg, bg = self.BufferInactive.bg} end,
	BufferInactiveMod    = 'BufferVisibleMod',
	BufferInactiveSign   = 'BufferVisibleSign',
	BufferInactiveTarget = 'BufferVisibleTarget',
	BufferInactiveWARN   = function(self) return {fg = self.WarningMsg.fg, bg = self.BufferInactive.bg} end,

	BufferTabpages    = {style = 'bold'},
	BufferTabpageFill = 'TabLineFill',

	BufferVisible       = 'TabLine',
	BufferVisibleERROR  = function(self) return {fg = self.ErrorMsg.fg, bg = self.BufferVisible.bg} end,
	BufferVisibleHINT   = function(self) return {fg = self.HintMsg.fg, bg = self.BufferVisible.bg} end,
	BufferVisibleIndex  = function(self) return {fg = self.Number.fg, bg = self.BufferVisible.bg} end,
	BufferVisibleINFO   = function(self) return {fg = self.InfoMsg.fg, bg = self.BufferVisible.bg} end,
	BufferVisibleMod    = function(self) return {fg = white, bg = self.BufferVisible.bg, style = 'italic'} end,
	BufferVisibleSign   = function(self) return {fg = self.BufferVisibleMod.fg, bg = self.BufferVisibleMod.bg, style = 'bold'} end,
	BufferVisibleTarget = 'BufferVisibleSign',
	BufferVisibleWARN   = function(self) return {fg = self.WarningMsg.fg, bg = self.BufferVisible.bg} end,

	--[[ 4.4.10. vim-sandwhich ]]
	OperatorSandwichChange = 'DiffText',

	--[[ 4.4.11. Fern ]]
	FernBranchText = 'Directory',

	--[[ 4.4.12. LSPSaga ]]
	DefinitionCount = 'Number',
	DefinitionIcon  = 'Special',
	ReferencesCount = 'Number',
	ReferencesIcon  = 'DefinitionIcon',
	TargetFileName  = 'Directory',
	TargetWord = 'Title',

	--[[ 4.4.13. indent-blankline.nvim ]]
	IndentBlanklineChar = { fg = gray3 },
	IndentBlanklineSpaceChar = 'IndentBlanklineChar',

	--[[ 4.4.14. trouble.nvim ]]
	TroubleCount = function(self) return vim.tbl_extend('force', self.Number, {style = 'underline'}) end,

	--[[ 4.4.15. todo-comments.nvim ]]
	TodoFgFIX = function(self) return {fg = self.ErrorMsg.fg} end,
	TodoFgHACK = function(self) return {fg = self.Todo.bg} end,
	TodoFgNOTE = 'HintMsg',
	TodoFgPERF = 'InfoMsg',
	TodoFgTODO = {fg = cyan, style = 'italic'},
	TodoFgWARN = function(self) return {fg = self.WarningMsg.fg} end,

	TodoBgFIX = function(self) return {fg = black, bg = self.ErrorMsg.fg, style = {'bold', 'italic', 'nocombine'}} end,
	TodoBgHACK = function(self) return {fg = black, bg = self.Todo.bg, style = {'bold', 'italic', 'nocombine'}} end,
	TodoBgNOTE = function(self) return {fg = black, bg = self.Hint.bg, style = {'bold', 'italic', 'nocombine'}} end,
	TodoBgPERF = function(self) return {fg = black, bg = self.Info.bg, style = {'bold', 'italic', 'nocombine'}} end,
	TodoBgTODO = {fg = black, bg = cyan, style = {'bold', 'italic', 'nocombine'}},
	TodoBgWARN = function(self) return {fg = black, bg = self.Warning.bg, style = {'bold', 'italic', 'nocombine'}} end,

	TodoSignFIX  = 'TodoFgFIX',
	TodoSignHACK = 'TodoFgHACK',
	TodoSignNOTE = 'TodoFgNOTE',
	TodoSignPERF = 'TodoFgPERF',
	TodoSignTODO = 'TodoFgTODO',
	TodoSignWARN = 'TodoFgWARN',

	--[[ 4.4.16. nvim-cmp ]]
	CmpItemAbbr = 'Ignore',
	CmpItemAbbrMatch = 'Underlined',
	CmpItemAbbrMatchFuzzy = {fg = highlight_group_normal.fg, style = {'nocombine', 'underline'}},
	CmpItemKindClass = 'CmpItemKindStruct',
	CmpItemKindColor = 'Label',
	CmpItemKindConstant = 'Constant',
	CmpItemKindConstructor = 'CmpItemKindMethod',
	CmpItemKind = 'Type',
	CmpItemKindEnum = 'CmpItemKindStruct',
	CmpItemKindEnumMember = 'CmpItemKindConstant',
	CmpItemKindEvent = 'Repeat',
	CmpItemKindField = 'Identifier',
	CmpItemKindFile = 'Directory',
	CmpItemKindFolder = 'CmpItemKindFile',
	CmpItemKindFunction = 'Function',
	CmpItemKindInterface = 'Type',
	CmpItemKindKeyword = 'Keyword',
	CmpItemKindMethod = 'CmpItemKindFunction',
	CmpItemKindModule = 'Include',
	CmpItemKindOperator = 'Operator',
	CmpItemKindProperty = 'CmpItemKindField',
	CmpItemKindReference = 'StorageClass',
	CmpItemKindSnippet = 'Special',
	CmpItemKindStruct = 'Structure',
	CmpItemKindText = 'String',
	CmpItemKindTypeParameter = 'Typedef',
	CmpItemKindUnit = 'CmpItemKindStruct',
	CmpItemKindValue = 'CmpItemKindConstant',
	CmpItemKindVariable = 'Identifier',

	--[[ 4.4.17. packer.nvim ]]
	packerFail = 'ErrorMsg',
	packerHash = 'Number',
	packerPackageNotLoaded = 'Ignore',
	packerStatusFail = 'Statement',
	packerStatusSuccess = 'packerStatusFail',
	packerSuccess = function(self) return {fg = green, style = self.packerFail.style} end,

	--[[ 4.4.18. nvim-tree ]]
	NvimTreeGitDeleted = function(self) return {fg = self.DiffDelete.bg} end,
	NvimTreeGitDirty = {fg = orange},
	NvimTreeGitIgnored = 'Ignore',
	NvimTreeGitMerge = 'NvimTreeGitRenamed',
	NvimTreeGitNew = function(self) return {fg = self.DiffAdd.bg} end,
	NvimTreeGitRenamed = function(self) return {fg = self.DiffChange.bg} end,
	NvimTreeGitStaged = {fg = cyan},

	--[[ 4.4.19. symbols-outline.nvim ]]
	FocusedSymbol = {},
	SymbolsOutlineConnector = 'Delimiter',

	--[[ 4.4.20. mini.nvim ]]
	MiniJump = 'MiniJump2dSpot',
}

local terminal_colors = {
	[1]  = black,
	[2]  = red_dark,
	[3]  = green_dark,
	[4]  = orange,
	[5]  = blue,
	[6]  = magenta_dark,
	[7]  = teal,
	[8]  = gray,
	[9]  = gray_dark,
	[10] = red,
	[11] = green,
	[12] = yellow,
	[13] = turqoise,
	[14] = purple,
	[15] = cyan,
	[16] = gray_light
}

require(vim.g.colors_name)(
	highlight_group_normal,
	highlight_groups,
	terminal_colors
)
