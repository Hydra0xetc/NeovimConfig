local M = {}

local themes = {
	night = {
		-- Background
		bg = "#1a1b26",
		bg_dark = "#16161e",
		bg_highlight = "#292e42",
		bg_visual = "#283457",

		-- Foreground
		fg = "#c0caf5",
		fg_dark = "#a9b1d6",
		fg_gutter = "#3b4261",
		fg_sidebar = "#a9b1d6",

		-- Primary colors
		blue = "#7aa2f7",
		blue0 = "#3d59a1",
		blue1 = "#2ac3de",
		blue2 = "#0db9d7",
		blue5 = "#89ddff",
		blue6 = "#b4f9f8",
		blue7 = "#394b70",

		-- Additional colors
		magenta = "#bb9af7",
		magenta2 = "#ff007c",
		purple = "#9d7cd8",
		orange = "#ff9e64",
		yellow = "#e0af68",
		green = "#9ece6a",
		green1 = "#73daca",
		green2 = "#41a6b5",
		teal = "#1abc9c",
		red = "#f7768e",
		red1 = "#db4b4b",

		-- Neutral
		grey = "#565f89",
		grey1 = "#6a737d",
		black = "#15161E",
		white = "#ffffff",

		-- UI
		comment = "#565f89",
		cursor_line = "#1f2335",
		line_number = "#3b4261",
		visual_select = "#2e3f6e",

		-- Diff
		diff_add = "#203330",
		diff_change = "#1d2b3a",
		diff_delete = "#3a2734",
		diff_text = "#2a3f5a",
	},

	storm = {
		-- Background
		bg = "#24283b",
		bg_dark = "#1f2335",
		bg_highlight = "#292e42",
		bg_visual = "#33467c",

		-- Foreground
		fg = "#c0caf5",
		fg_dark = "#a9b1d6",
		fg_gutter = "#3b4261",
		fg_sidebar = "#a9b1d6",

		-- Primary colors
		blue = "#7aa2f7",
		blue0 = "#3d59a1",
		blue1 = "#2ac3de",
		blue2 = "#0db9d7",
		blue5 = "#89ddff",
		blue6 = "#b4f9f8",
		blue7 = "#394b70",

		-- Additional colors
		magenta = "#bb9af7",
		magenta2 = "#ff007c",
		purple = "#9d7cd8",
		orange = "#ff9e64",
		yellow = "#e0af68",
		green = "#9ece6a",
		green1 = "#73daca",
		green2 = "#41a6b5",
		teal = "#1abc9c",
		red = "#f7768e",
		red1 = "#db4b4b",

		-- Neutral
		grey = "#565f89",
		grey1 = "#6a737d",
		black = "#15161E",
		white = "#ffffff",

		-- UI
		comment = "#565f89",
		cursor_line = "#2a3150",
		line_number = "#3b4261",
		visual_select = "#3d59a1",

		-- Diff
		diff_add = "#283b4d",
		diff_change = "#252a3f",
		diff_delete = "#3f2d3d",
		diff_text = "#394b70",
	},
}

-- Function to get appropriate theme based on time
local function get_theme_by_time()
	local current_time = os.date("*t")
	local hour = current_time.hour

	-- Night time: 9 PM (21) to 5 AM (4)
	if hour >= 21 or hour < 5 then
		return "night"
	else
		return "storm"
	end
end

-- Function to apply theme
local function apply_theme(theme_name)
	local colors = themes[theme_name]

	if not colors then
		error("Theme '" .. theme_name .. "' not found. Available: night, storm")
		return
	end

	vim.cmd("syntax reset")
	vim.cmd("highlight clear")
	vim.g.colors_name = "tokyonight-" .. theme_name

	local set = vim.api.nvim_set_hl

	-- Base
	set(0, "Normal", { bg = colors.bg, fg = colors.fg })
	set(0, "NormalFloat", { bg = colors.bg_dark })
	set(0, "NormalNC", { bg = colors.bg_dark, fg = colors.fg_dark })
	set(0, "Comment", { fg = colors.comment, italic = true })

	-- Syntax groups
	set(0, "Constant", { fg = colors.orange })
	set(0, "String", { fg = colors.green })
	set(0, "Character", { fg = colors.green })
	set(0, "Number", { fg = colors.orange })
	set(0, "Boolean", { fg = colors.magenta })
	set(0, "Float", { fg = colors.orange })

	set(0, "Identifier", { fg = colors.blue })
	set(0, "Function", { fg = colors.blue })

	set(0, "Statement", { fg = colors.magenta })
	set(0, "Conditional", { fg = colors.magenta })
	set(0, "Repeat", { fg = colors.magenta })
	set(0, "Label", { fg = colors.blue })
	set(0, "Operator", { fg = colors.blue5 })
	set(0, "Keyword", { fg = colors.magenta })
	set(0, "Exception", { fg = colors.red })

	set(0, "PreProc", { fg = colors.magenta })
	set(0, "Include", { fg = colors.magenta })
	set(0, "Define", { fg = colors.magenta })
	set(0, "Macro", { fg = colors.blue5 })
	set(0, "PreCondit", { fg = colors.magenta })

	set(0, "Type", { fg = colors.blue1 })
	set(0, "StorageClass", { fg = colors.magenta })
	set(0, "Structure", { fg = colors.blue5 })
	set(0, "Typedef", { fg = colors.blue1 })

	set(0, "Special", { fg = colors.blue5 })
	set(0, "SpecialChar", { fg = colors.yellow })
	set(0, "Tag", { fg = colors.blue })
	set(0, "Delimiter", { fg = colors.fg })
	set(0, "SpecialComment", { fg = colors.comment })
	set(0, "Debug", { fg = colors.red })

	-- UI
	set(0, "CursorLine", { bg = colors.cursor_line })
	set(0, "CursorLineNr", { fg = colors.blue, bold = true })
	set(0, "LineNr", { fg = colors.line_number })
	set(0, "CursorColumn", { bg = colors.cursor_line })

	set(0, "Visual", { bg = colors.visual_select })
	set(0, "Search", { bg = colors.blue0, fg = colors.white })
	set(0, "IncSearch", { bg = colors.orange, fg = colors.black })
	set(0, "Substitute", { bg = colors.red, fg = colors.black })

	set(0, "StatusLine", { bg = colors.bg_dark, fg = colors.fg })
	set(0, "StatusLineNC", { bg = colors.bg_dark, fg = colors.grey })
	set(0, "VertSplit", { bg = colors.bg, fg = colors.bg_dark })

	set(0, "Pmenu", { bg = colors.bg_dark, fg = colors.fg })
	set(0, "PmenuSel", { bg = colors.blue0, fg = colors.white })
	set(0, "PmenuSbar", { bg = colors.bg_highlight })
	set(0, "PmenuThumb", { bg = colors.grey })

	set(0, "FoldColumn", { bg = colors.bg, fg = colors.fg_gutter })
	set(0, "Folded", { bg = colors.bg_dark, fg = colors.comment })

	set(0, "MatchParen", { bg = colors.blue0, fg = colors.white })
	set(0, "ColorColumn", { bg = colors.bg_highlight })

	set(0, "WinSeparator", { fg = colors.bg_dark })
	set(0, "WildMenu", { bg = colors.blue, fg = colors.bg_dark })

	-- Diff
	set(0, "DiffAdd", { bg = colors.diff_add, fg = colors.green })
	set(0, "DiffChange", { bg = colors.diff_change, fg = colors.orange })
	set(0, "DiffDelete", { bg = colors.diff_delete, fg = colors.red })
	set(0, "DiffText", { bg = colors.diff_text, fg = colors.blue })

	-- Error & Warning
	set(0, "ErrorMsg", { fg = colors.red, bold = true })
	set(0, "WarningMsg", { fg = colors.yellow, bold = true })
	set(0, "Error", { fg = colors.red })
	set(0, "Todo", { bg = colors.yellow, fg = colors.black, bold = true })

	-- LSP
	set(0, "DiagnosticError", { fg = colors.red })
	set(0, "DiagnosticWarn", { fg = colors.yellow })
	set(0, "DiagnosticInfo", { fg = colors.blue })
	set(0, "DiagnosticHint", { fg = colors.blue5 })
	set(0, "DiagnosticUnderlineError", { sp = colors.red, undercurl = true })
	set(0, "DiagnosticUnderlineWarn", { sp = colors.yellow, undercurl = true })
	set(0, "DiagnosticUnderlineInfo", { sp = colors.blue, undercurl = true })
	set(0, "DiagnosticUnderlineHint", { sp = colors.blue5, undercurl = true })

	set(0, "LspReferenceText", { bg = colors.bg_visual })
	set(0, "LspReferenceRead", { bg = colors.bg_visual })
	set(0, "LspReferenceWrite", { bg = colors.bg_visual })

	-- Treesitter
	set(0, "@property", { fg = colors.blue1 })
	set(0, "@parameter", { fg = colors.fg })
	set(0, "@variable", { fg = colors.fg })
	set(0, "@namespace", { fg = colors.blue1 })
	set(0, "@field", { fg = colors.blue1 })
	set(0, "@text.title", { fg = colors.blue, bold = true })
	set(0, "@text.uri", { fg = colors.blue, underline = true })
	set(0, "@text.literal", { fg = colors.green })
	set(0, "@text.reference", { fg = colors.magenta })
	set(0, "@text.emphasis", { italic = true })
	set(0, "@text.strong", { bold = true })

	-- Git
	set(0, "gitcommitSummary", { fg = colors.green })
	set(0, "gitcommitOverflow", { fg = colors.red })
	set(0, "gitcommitBranch", { fg = colors.magenta })

	-- Additional highlights
	set(0, "Whitespace", { fg = colors.bg_highlight })
	set(0, "NonText", { fg = colors.bg_highlight })
	set(0, "SignColumn", { bg = colors.bg })
	set(0, "Question", { fg = colors.yellow })
	set(0, "Directory", { fg = colors.blue })
	set(0, "Title", { fg = colors.blue, bold = true })

	-- dashboard
	set(0, "DashboardHeader", { fg = colors.blue })
	set(0, "DashboardFooter", { fg = colors.blue1 })
	set(0, "DashboardIcon", { fg = colors.blue1 })
	set(0, "dashboarddesc", { fg = colors.blue1 })
	set(0, "DashboardKey", { fg = colors.orange })

	-- Lualine
	set(0, "ModeMsg", { fg = colors.magenta, bold = true })
	set(0, "Visual", { bg = colors.visual_select })
	set(0, "VisualNOS", { bg = colors.visual_select })
	print("TokyoNight: Applied " .. theme_name .. " theme")
end

-- Timer for auto theme switching
local timer = nil

function M.setup(opts)
	opts = opts or {}

	-- If auto_switch is enabled or not specified, use time-based switching
	if opts.auto_switch == nil or opts.auto_switch then
		local function set_theme_based_on_time()
			local theme_name = get_theme_by_time()
			local current_colorscheme = vim.g.colors_name or ""

			if current_colorscheme ~= "tokyonight-" .. theme_name then
				apply_theme(theme_name)
			end
		end

		-- Apply theme immediately
		set_theme_based_on_time()

		-- Set up timer to check every minute
		if timer then
			vim.fn.timer_stop(timer)
		end

		timer = vim.fn.timer_start(60000, function()
			set_theme_based_on_time()
		end, { ["repeat"] = -1 })
	else
		-- Manual theme selection
		local theme_name = opts.style or "storm"
		apply_theme(theme_name)
	end
end

-- Function to manually switch themes
function M.switch_theme(theme_name)
	if timer then
		vim.fn.timer_stop(timer)
		timer = nil
	end
	apply_theme(theme_name)
end

-- Function to enable/disable auto switch
function M.toggle_auto_switch()
	if timer then
		vim.fn.timer_stop(timer)
		timer = nil
		print("TokyoNight: Auto switch disabled")
	else
		M.setup({ auto_switch = true })
		print("TokyoNight: Auto switch enabled")
	end
end

return M
