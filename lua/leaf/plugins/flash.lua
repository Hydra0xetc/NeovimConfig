return {
	"folke/flash.nvim",
	event = "CursorHold",
	opts = {}, -- flash config
	keys = {
		{
			"s",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump()
				vim.schedule(function()
					vim.cmd("normal! zz")
				end)
			end,
			desc = "Flash Jump",
		},
	},
}
