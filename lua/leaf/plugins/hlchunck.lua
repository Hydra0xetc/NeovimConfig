return {
	"shellRaining/hlchunk.nvim",
	enabled = false,
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
				right_arrow = ">",
			},
			-- Tambahkan exclude untuk buffer tertentu
			exclude_filetypes = {
				"help",
				"dashboard",
				"packer",
				"NvimTree",
				"Trouble",
				"lspinfo",
				"checkhealth",
				"man",
				"", -- buffer tanpa filetype
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
		-- Safety check sebelum setup
		local ok, hlchunk = pcall(require, "hlchunk")
		if not ok then
			vim.notify("hlchunk.nvim not found!", vim.log.levels.ERROR)
			return
		end

		hlchunk.setup(opts)
	end,
}
