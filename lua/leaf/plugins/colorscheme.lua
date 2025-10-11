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

		local current_time = os.date("*t")
		local hour = current_time.hour

		if hour >= 21 or hour < 5 then
			vim.cmd("colorscheme tokyonight-night")
		else
			vim.cmd("colorscheme tokyonight-moon")
		end
	end,
}
