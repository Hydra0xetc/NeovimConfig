return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("gitsigns").setup({
			signs = {
				add = { text = "+", show_count = false },
				change = { text = "▎", show_count = false },
				delete = { text = "▁", show_count = false },
				topdelete = { text = "▔", show_count = false },
				changedelete = { text = "▋", show_count = false },
				untracked = { text = "┆", show_count = false },
			},

			preview_config = {
				style = "minimal",
				relative = "cursor",
			},

			current_line_blame = true,

			vim.keymap.set("n", "gs", function()
				require("gitsigns").toggle_signs()
			end),
		})
	end,
}
