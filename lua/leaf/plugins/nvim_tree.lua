return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			filters = {
				dotfiles = true,
			},
			-- uncommnt this to make floating window for nvim-tree
			-- 	view = {
			-- 		float = {
			-- 			enable = true,
			-- 			open_win_config = {
			-- 				border = "rounded",
			-- 				width = 30,
			-- 				height = 30,
			-- 			},
			-- 		},
			-- 	},
		})
	end,

	vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>"),
}
