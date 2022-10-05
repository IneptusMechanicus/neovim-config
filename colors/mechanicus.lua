local vim = vim

local M = {}

M.classic = {
	name = 'mechanicus',
	base0 = '#222426',
	base1 = '#272a30',
	base2 = '#26292C',
	base3 = '#2E323C',
	base4 = '#333842',
	base5 = '#4d5154',
	base6 = '#9ca0a4',
	base7 = '#b1b1b1',
	base8 = '#e3e3e1',
	border = '#a1b5b1',
	brown = '#504945',
	white = '#f8f8f0',
	grey = '#8F908A',
	black = '#000000',
	pink = '#f92672',
	green = '#a6e22e',
	aqua = '#66d9ef',
	yellow = '#e6db74',
	orange = '#fd971f',
	purple = '#ae81ff',
	red = '#e95678',
	diff_add = '#3d5213',
	diff_remove = '#4a0f23',
	diff_change = '#27406b',
	diff_text = '#23324d',
}

local function remove_italics(config, colors)
	if not config.italics and colors.style == 'italic' then
		colors.style = nil
	end
	return colors
end

local function highlighter(config)
	return function(group, color)
		color = remove_italics(config, color)
		local style = color.style and 'gui=' .. color.style or 'gui=NONE'
		local fg = color.fg and 'guifg = ' .. color.fg or 'guifg = NONE'
		local bg = color.bg and 'guibg = ' .. color.bg or 'guibg = NONE'
		local sp = color.sp and 'guisp = ' .. color.sp or ''
		vim.cmd(
			'highlight ' .. group .. ' ' .. style .. ' ' .. fg .. ' ' .. bg .. ' ' .. sp
		)
	end
end

M.load_syntax = function(palette)
	return {
		Normal = {
			fg = palette.white,
			bg = palette.base2,
		},
		NormalFloat = {
			bg = palette.base1,
		},
		Pmenu = {
			fg = palette.white,
			bg = palette.base3,
		},
		PmenuSel = {
			fg = palette.base4,
			bg = palette.orange,
		},
		PmenuSelBold = {
			fg = palette.base4,
			bg = palette.orange,
		},
		PmenuThumb = {
			fg = palette.purple,
			bg = palette.green,
		},
		PmenuSbar = {
			bg = palette.base3,
		},
		Cursor = {
			style = 'reverse',
		},
		ColorColumn = {
			bg = palette.base3,
		},
		CursorLine = {
			bg = palette.base3,
		},
		NonText = { -- used for "eol", "extends" and "precedes" in listchars
			fg = palette.base5,
		},
		Visual = {
			bg = palette.base4,
		},
		VisualNOS = {
			bg = palette.base3,
		},
		Search = {
			fg = palette.base2,
			bg = palette.yellow,
		},
		IncSearch = {
			fg = palette.base2,
		bg = palette.orange,
		},
		CursorLineNr = {
			fg = palette.orange,
			bg = palette.base2,
		},
		MatchParen = {
			fg = palette.pink,
		},
		Question = {
			fg = palette.yellow,
		},
		ModeMsg = {
			fg = palette.white,
			style = 'bold',
		},
		MoreMsg = {
			fg = palette.white,
			style = 'bold',
		},
		ErrorMsg = {
			fg = palette.red,
			style = 'bold',
		},
		WarningMsg = {
			fg = palette.yellow,
			style = 'bold',
		},
		VertSplit = {
			fg = palette.brown,
		},
		LineNr = {
			fg = palette.base5,
			bg = palette.base2,
		},
		SignColumn = {
			fg = palette.white,
			bg = palette.base2,
		},
		StatusLine = {
			fg = palette.base7,
			bg = palette.base3,
		},
		StatusLineNC = {
			fg = palette.grey,
			bg = palette.base3,
		},
		TabLineSel = {
			bg = palette.base4,
		},
		SpellBad = {
			fg = palette.red,
			style = 'undercurl',
		},
		SpellCap = {
			fg = palette.purple,
			style = 'undercurl',
		},
		SpellRare = {
			fg = palette.aqua,
			style = 'undercurl',
		},
		SpellLocal = {
			fg = palette.pink,
			style = 'undercurl',
		},
		SpecialKey = {
			fg = palette.pink,
		},
		Title = {
			fg = palette.yellow,
			style = 'bold',
		},
		Directory = {
			fg = palette.aqua,
		},
		DiffAdd = {
			bg = palette.diff_add,
		},
		DiffDelete = {
			bg = palette.diff_remove,
		},
		DiffChange = {
			bg = palette.diff_change,
		},
		DiffText = {
			bg = palette.diff_text,
		},
		diffAdded = {
			fg = palette.green,
		},
		diffRemoved = {
			fg = palette.pink,
		},
		Folded = {
			fg = palette.grey,
			bg = palette.base3,
		},
		FoldColumn = {
			fg = palette.white,
			bg = palette.black,
		},
	}
end

M.load_plugin_syntax = function(palette)
	return {
		TSString = {
			fg = palette.yellow,
		},
		TSInclude = {
			fg = palette.pink,
		},
		TSVariable = {
			fg = palette.white,
		},
		TSVariableBuiltin = {
			fg = palette.orange,
		},
		TSAnnotation = {
			fg = palette.green,
		},
		TSComment = {
			fg = palette.base6,
		style = 'italic',
		},
		TSConstant = {
			fg = palette.aqua,
		},
		TSConstBuiltin = {
			fg = palette.purple,
		},
		TSConstMacro = {
			fg = palette.purple,
		},
		TSConstructor = {
			fg = palette.aqua,
		},
		TSConditional = {
			fg = palette.pink,
		},
		TSCharacter = {
			fg = palette.yellow,
		},
		TSFunction = {
			fg = palette.green,
			style = 'italic',
		},
		TSFuncBuiltin = {
			fg = palette.aqua,
		},
		TSFuncMacro = {
			fg = palette.green,
			style = 'italic',
		},
		TSKeyword = {
			fg = palette.pink,
			style = 'italic',
		},
		TSKeywordFunction = {
			fg = palette.pink,
			style = 'italic',
		},
		TSKeywordOperator = {
			fg = palette.pink,
		},
		TSKeywordReturn = {
			fg = palette.pink,
		},
		TSMethod = {
			fg = palette.green,
		},
		TSNamespace = {
			fg = palette.purple,
		},
		TSNumber = {
			fg = palette.purple,
		},
		TSOperator = {
			fg = palette.pink,
		},
		TSParameter = {
			fg = palette.white,
		},
		TSParameterReference = {
			fg = palette.white,
		},
		TSProperty = {
			fg = palette.white,
		},
		TSPunctDelimiter = {
			fg = palette.white,
		},
		TSPunctBracket = {
			fg = palette.white,
		},
		TSPunctSpecial = {
			fg = palette.pink,
		},
		TSRepeat = {
			fg = palette.pink,
		},
		TSStringRegex = {
			g = palette.purple,
		},
		TSStringEscape = {
			fg = palette.purple,
		},
		TSTag = {
			fg = palette.pink,
		},
		TSTagDelimiter = {
			fg = palette.white,
		},
		TSTagAttribute = {
			fg = palette.green,
		},
		TSLabel = {
			fg = palette.pink,
		},
		TSType = {
			fg = palette.aqua,
		},
		TSException = {
			fg = palette.pink,
		},
		TSField = {
			fg = palette.white,
		},
		TSFloat = {
			fg = palette.purple,
		},
		dbui_tables = {
			fg = palette.white,
		},
		DiagnosticSignError = {
			fg = palette.red,
		},
		DiagnosticSignWarn = {
			fg = palette.yellow,
		},
		DiagnosticSignInfo = {
			fg = palette.white,
		},
		DiagnosticSignHint = {
			fg = palette.aqua,
		},
		DiagnosticVirtualTextError = {
			fg = palette.red,
		},
		DiagnosticVirtualTextWarn = {
			fg = palette.yellow,
		},
		DiagnosticVirtualTextInfo = {
			fg = palette.white,
		},
		DiagnosticVirtualTextHint = {
			fg = palette.aqua,
		},
		DiagnosticUnderlineError = {
			style = 'undercurl',
			sp = palette.red,
		},
		DiagnosticUnderlineWarn = {
			style = 'undercurl',
			sp = palette.yellow,
		},
		DiagnosticUnderlineInfo = {
			style = 'undercurl',
			sp = palette.white,
		},
		DiagnosticUnderlineHint = {
			style = 'undercurl',
			sp = palette.aqua,
		},
		CursorWord0 = {
			bg = palette.white,
			fg = palette.black,
		},
		CursorWord1 = {
			bg = palette.white,
			fg = palette.black,
		},
		NvimTreeFolderName = {
			fg = palette.white,
		},
		NvimTreeRootFolder = {
			fg = palette.pink,
		},
		NvimTreeSpecialFile = {
			fg = palette.white,
			style = 'NONE',
		},

		-- Telescope
		TelescopeBorder = {
			fg = palette.base7,
		},
		TelescopeNormal = {
			fg = palette.base8,
			bg = palette.base0,
		},
		TelescopeSelection = {
			fg = palette.white,
			style = 'bold',
		},
		TelescopeSelectionCaret = {
			fg = palette.green,
		},
		TelescopeMultiSelection = {
			fg = palette.pink,
		},
		TelescopeMatching = {
			fg = palette.aqua,
		},

		-- hrsh7th/nvim-cmp
		CmpDocumentation = { fg = palette.white, bg = palette.base1 },
		CmpDocumentationBorder = { fg = palette.white, bg = palette.base1 },
		CmpItemAbbr = { fg = palette.white },
		CmpItemAbbrMatch = { fg = palette.aqua },
		CmpItemAbbrMatchFuzzy = { fg = palette.aqua },
		CmpItemKindDefault = { fg = palette.white },
		CmpItemMenu = { fg = palette.base6 },
		CmpItemKindKeyword = { fg = palette.pink },
		CmpItemKindVariable = { fg = palette.pink },
		CmpItemKindConstant = { fg = palette.pink },
		CmpItemKindReference = { fg = palette.pink },
		CmpItemKindValue = { fg = palette.pink },
		CmpItemKindFunction = { fg = palette.aqua },
		CmpItemKindMethod = { fg = palette.aqua },
		CmpItemKindConstructor = { fg = palette.aqua },
		CmpItemKindClass = { fg = palette.orange },
		CmpItemKindInterface = { fg = palette.orange },
		CmpItemKindStruct = { fg = palette.orange },
		CmpItemKindEvent = { fg = palette.orange },
		CmpItemKindEnum = { fg = palette.orange },
		CmpItemKindUnit = { fg = palette.orange },
		CmpItemKindModule = { fg = palette.yellow },
		CmpItemKindProperty = { fg = palette.green },
		CmpItemKindField = { fg = palette.green },
		CmpItemKindTypeParameter = { fg = palette.green },
		CmpItemKindEnumMember = { fg = palette.green },
		CmpItemKindOperator = { fg = palette.green },
	}
end

local default_config = {
	palette = M.classic,
	custom_hlgroups = {},
	italics = true,
}

M.setup = function(config)
	vim.cmd('hi clear')
	if vim.fn.exists('syntax_on') then
		vim.cmd('syntax reset')
	end
	vim.o.background = 'dark'
	vim.o.termguicolors = true
	config = config or {}
	config = vim.tbl_deep_extend('keep', config, default_config)
	local used_palette = config.palette or M.classic
	vim.g.colors_name = used_palette.name
	local syntax = M.load_syntax(used_palette)
	syntax = vim.tbl_deep_extend('keep', config.custom_hlgroups, syntax)
	local highlight = highlighter(config)
	for group, colors in pairs(syntax) do
		highlight(group, colors)
	end
	local plugin_syntax = M.load_plugin_syntax(used_palette)
	plugin_syntax = vim.tbl_deep_extend(
		'keep',
		config.custom_hlgroups,
		plugin_syntax
	)
	for group, colors in pairs(plugin_syntax) do
		highlight(group, colors)
	end
end

M.setup()
