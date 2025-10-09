return {
	"stevearc/oil.nvim",
	config = function()
		require("oil").setup({
			default_file_explorer = true,
			columns = {},
			view_options = {
				show_hidden = true,
			},
			keymaps = {
				["<C-s>"] = false,
			},
		})

		local function toggle_oil()
			if vim.bo.filetype == "oil" then
				vim.cmd("bdelete")
			else
				require("oil").open()
			end
		end

		vim.keymap.set("n", "<leader>e", toggle_oil, { desc = "Toggle Oil file explorer" })

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "oil",
			callback = function()
				vim.opt_local.cursorline = true
			end,
		})
	end,
}
