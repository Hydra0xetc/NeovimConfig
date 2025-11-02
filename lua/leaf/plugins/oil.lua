return {
	"stevearc/oil.nvim",
	event = { "BufEnter", "UiEnter" },
	config = function()
		require("oil").setup({
			default_file_explorer = false,
			columns = {
				-- "icon",
			},
			view_options = {
				show_hidden = true,
				is_always_hidden = function(name)
					local hidden_dirs = { "..", ".git", ".env" }

					for i = 1, #hidden_dirs do
						if hidden_dirs[i] == name then
							return true
						end
					end
					return false
				end,
			},
			keymaps = {
				["<C-s>"] = false,
				["b"] = { "actions.parent", mode = "n" },
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
