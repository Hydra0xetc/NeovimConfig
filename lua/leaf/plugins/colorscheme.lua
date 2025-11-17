return {
	"folke/tokyonight.nvim",
	lazy = false,
	event = { "UIEnter" },
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			style = "moon", -- moon, storm, night, day
			transparent = false,
			terminal_colors = true,

			vim.cmd.colorscheme("tokyonight"),
		})
	end,
}
