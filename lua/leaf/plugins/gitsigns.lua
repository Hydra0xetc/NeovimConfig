return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		signs = {
			add = { text = "+", show_count = false },
			change = { text = "▎", show_count = false },
			delete = { text = "▁", show_count = false },
			topdelete = { text = "▔", show_count = false },
			changedelete = { text = "▋", show_count = false },
			untracked = { text = "┆", show_count = false },
		},

		current_line_blame = true,
	},
}
