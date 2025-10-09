return {
	"folke/flash.nvim",
	event = "VeryLazy",
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
		{
			"S",
			mode = { "n", "x", "o" },
			function()
				require("flash").treesitter()
				vim.schedule(function()
					vim.cmd("normal! zz")
				end)
			end,
			desc = "Flash Treesitter",
		},
		{
			"<c-s>",
			mode = { "c" },
			function()
				require("flash").toggle()
				vim.schedule(function()
					vim.cmd("normal! zz")
				end)
			end,
			desc = "Toggle Flash Search",
		},
	},
}
