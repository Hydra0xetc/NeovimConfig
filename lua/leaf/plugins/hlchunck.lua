return {
	"shellRaining/hlchunk.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		chunk = {
			enable = true,
			style = {
				{ fg = "#806d9c" },
				{ fg = "#c21f30" },
			},
			use_treesitter = false,
			chars = {
				horizontal_line = "─",
				vertical_line = "│",
				left_top = "╭",
				left_bottom = "╰",
				right_arrow = "@",
			},
		},
		indent = {
			enable = false,
			chars = {},
		},
		line_num = {
			enable = true,
		},
		blank = {
			enable = false,
		},
	},
	config = function(_, opts)
		require("hlchunk").setup(opts)
	end,
}
