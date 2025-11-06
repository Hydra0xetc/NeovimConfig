return {
	"nvim-lualine/lualine.nvim",
	enabled = true,
	event = { "BufEnter" },
	opts = function()
		return {
			options = {
				theme = "auto",
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
						-- path = 1, -- Show relative path
						symbols = { modified = "  ", readonly = "  ", unnamed = "  " },
					},
				},
				lualine_x = {
					{
						"filetype",
						colored = true,
						icon_only = false,
					},
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
