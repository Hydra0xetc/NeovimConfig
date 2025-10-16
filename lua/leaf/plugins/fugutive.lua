return {
	"tpope/vim-fugitive",
	enabled = true,
	cmd = { "Git", "Gstatus", "Gcommit", "Gpush" },
	event = "VeryLazy",
	config = function()
		vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
		vim.keymap.set("n", "<leader>gd", vim.cmd.Gdiffsplit)
	end,
}
