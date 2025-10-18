local function macro_recording()
	local recording = vim.fn.reg_recording()
	if recording == "" then
		return ""
	else
		return "Recording @" .. recording
	end
end

return {
	"nvim-lualine/lualine.nvim",
	enabled = true,
	event = { "BufEnter" },
	opts = function()
		-- Get current theme colors
		local current_theme = require("leaf.core.custom.init") -- Ganti dengan nama file theme Anda
		local colors = {}

		-- Fallback colors jika theme tidak tersedia
		local fallback_colors = {
			bg = "#1a1b26",
			bg_dark = "#16161e",
			fg = "#c0caf5",
			fg_dark = "#a9b1d6",
			blue = "#7aa2f7",
			green = "#9ece6a",
			magenta = "#bb9af7",
			red = "#f7768e",
			cyan = "#2ac3de",
			yellow = "#e0af68", -- Tambahkan warna kuning
			grey = "#565f89",
			black = "#15161E",
		}

		-- Coba mendapatkan colors dari theme yang aktif
		local success, theme_colors = pcall(vim.api.nvim_get_hl_by_name, "Normal", true)
		if success and theme_colors.background then
			-- Extract colors dari highlight groups yang ada
			colors.bg = string.format("#%06x", theme_colors.background)

			local blue_hl = vim.api.nvim_get_hl_by_name("Function", true)
			colors.blue = blue_hl.foreground and string.format("#%06x", blue_hl.foreground) or fallback_colors.blue

			local green_hl = vim.api.nvim_get_hl_by_name("String", true)
			colors.green = green_hl.foreground and string.format("#%06x", green_hl.foreground) or fallback_colors.green

			local magenta_hl = vim.api.nvim_get_hl_by_name("Statement", true)
			colors.magenta = magenta_hl.foreground and string.format("#%06x", magenta_hl.foreground)
				or fallback_colors.magenta

			local red_hl = vim.api.nvim_get_hl_by_name("Exception", true)
			colors.red = red_hl.foreground and string.format("#%06x", red_hl.foreground) or fallback_colors.red

			local cyan_hl = vim.api.nvim_get_hl_by_name("Type", true)
			colors.cyan = cyan_hl.foreground and string.format("#%06x", cyan_hl.foreground) or fallback_colors.cyan

			-- Tambahkan ekstraksi warna kuning
			local yellow_hl = vim.api.nvim_get_hl_by_name("Number", true) -- Biasanya Number berwarna kuning/orange
			colors.yellow = yellow_hl.foreground and string.format("#%06x", yellow_hl.foreground)
				or fallback_colors.yellow

			colors.fg = fallback_colors.fg
			colors.black = fallback_colors.black
			colors.grey = fallback_colors.grey
		else
			colors = fallback_colors
		end

		local bubbles_theme = {
			normal = {
				a = { fg = colors.black, bg = colors.blue, gui = "bold" },
				b = { fg = colors.fg, bg = colors.bg_dark },
				c = { fg = colors.fg_dark, bg = colors.bg },
			},

			insert = {
				a = { fg = colors.black, bg = colors.green, gui = "bold" },
				b = { fg = colors.fg, bg = colors.bg_dark },
				c = { fg = colors.fg_dark, bg = colors.bg },
			},

			visual = {
				a = { fg = colors.black, bg = colors.magenta, gui = "bold" },
				b = { fg = colors.fg, bg = colors.bg_dark },
				c = { fg = colors.fg_dark, bg = colors.bg },
			},

			replace = {
				a = { fg = colors.black, bg = colors.red, gui = "bold" },
				b = { fg = colors.fg, bg = colors.bg_dark },
				c = { fg = colors.fg_dark, bg = colors.bg },
			},

			command = {
				a = { fg = colors.black, bg = colors.yellow, gui = "bold" }, -- Ganti cyan dengan yellow
				b = { fg = colors.fg, bg = colors.bg_dark },
				c = { fg = colors.fg_dark, bg = colors.bg },
			},

			terminal = {
				a = { fg = colors.black, bg = colors.cyan, gui = "bold" }, -- Terminal tetap cyan
				b = { fg = colors.fg, bg = colors.bg_dark },
				c = { fg = colors.fg_dark, bg = colors.bg },
			},

			inactive = {
				a = { fg = colors.grey, bg = colors.bg_dark },
				b = { fg = colors.grey, bg = colors.bg_dark },
				c = { fg = colors.grey, bg = colors.bg },
			},
		}

		return {
			options = {
				theme = bubbles_theme,
				globalstatus = true,
				refresh = { statusline = 1000 },
				component_separators = { left = "", right = " " },
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = {
					{
						"filename",
						-- path = 1, -- Menampilkan relative path
						-- symbols = { modified = "  ", readonly = "  ", unnamed = "  " },
					},
				},
				lualine_x = {
					-- macro_recording,
					-- {
					-- 	"filetype",
					-- 	colored = true,
					-- 	icon_only = false,
					-- },
					-- "encoding",
					-- "fileformat",
				},
				lualine_y = {
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						sections = { "error", "warn", "info", "hint" },
						symbols = { error = " ", warn = " ", info = " ", hint = "󰌵 " },
						colored = true,
						always_visible = false,
					},
				},
				lualine_z = {
					{ "location", padding = { left = 1, right = 1 } },
					{ "progress", padding = { left = 0, right = 1 } },
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
		}
	end,
}
