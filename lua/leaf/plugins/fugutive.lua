return {
	"tpope/vim-fugitive",
	enabeled = false,
	cmd = { "Git", "Gstatus", "Gcommit", "Gpush" },
	event = "VeryLazy",
	config = function()
		-- Keymaps dengan vim.cmd
		vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
		vim.keymap.set("n", "<leader>gd", vim.cmd.Gdiffsplit)
		vim.keymap.set("n", "<leader>gb", vim.cmd.Gblame)
	end,
}
