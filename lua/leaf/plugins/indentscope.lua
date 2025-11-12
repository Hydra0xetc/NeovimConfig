return {
	"echasnovski/mini.indentscope",
	event = { "BufReadPre", "BufNewFile" },
	version = "*",
	config = function()
		require("mini.indentscope").setup({
			symbol = "│",
			options = {
				try_as_border = true,
				border = "both",
			},
			draw = {
				delay = 50,
				animation = require("mini.indentscope").gen_animation.none(),
			},
		})

		-- Disable untuk buffer types tertentu
		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"help",
				"lazy",
				"mason",
				"notify",
				"toggleterm",
				"lazyterm",
				"dashboard",
				"NvimTree",
				"man",
				"neo-tree",
				"Trouble",
				"Conform",
				"trouble",
				"telescope",
			},
			callback = function()
				vim.b.miniindentscope_disable = true
			end,
		})

		vim.api.nvim_create_autocmd("TermOpen", {
			callback = function()
				vim.b.miniindentscope_disable = true
			end,
		})
	end,
}
