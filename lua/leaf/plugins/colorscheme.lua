return {
	"folke/tokyonight.nvim",
	lazy = false,
	enabled = false,
	event = { "UIEnter" },
	priority = 1000,
	opts = {
		style = "storm",
		transparent = true,
		terminal_colors = true,
	},
	config = function(_, opts)
		require("tokyonight").setup(opts)

		local function set_theme_based_on_time()
			local current_time = os.date("*t")
			local hour = current_time.hour

			local current_colorscheme = vim.g.colors_name or ""

			if hour >= 21 or hour < 5 then
				if current_colorscheme ~= "tokyonight-night" then
					vim.cmd("colorscheme tokyonight-night")
				end
			else
				if current_colorscheme ~= "tokyonight-storm" then
					vim.cmd("colorscheme tokyonight-storm")
				end
			end
		end

		set_theme_based_on_time()

		vim.fn.timer_start(60000, function()
			set_theme_based_on_time()
		end, { ["repeat"] = -1 })
	end,
}
