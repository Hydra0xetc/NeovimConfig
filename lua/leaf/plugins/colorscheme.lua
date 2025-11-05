return {
	"folke/tokyonight.nvim",
	lazy = false,
	event = { "UIEnter" },
	priority = 1000,
	opts = {
		style = "moon",
		transparent = false,
		terminal_colors = true,
	},
	config = function(_, opts)
		require("tokyonight").setup(opts)

		vim.cmd.colorscheme("tokyonight")

		local function set_custom_highlights()
			local colors = {
				orange = "#ff9e64",
			}
			vim.api.nvim_set_hl(0, "LineNr", { fg = colors.orange })
		end

		set_custom_highlights()

		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "*",
			callback = set_custom_highlights,
		})
	end,
}
