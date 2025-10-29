return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		-- Signs configuration
		signs = {
			add = { text = "▎", show_count = false },
			change = { text = "▎", show_count = false },
			delete = { text = "▁", show_count = false },
			topdelete = { text = "▔", show_count = false },
			changedelete = { text = "▋", show_count = false },
			untracked = { text = "┆", show_count = false },
		},

		update_debounce = 200,
		max_file_length = 10000,
		attach_to_untracked = false,

		current_line_blame = true,
		current_line_blame_opts = {
			delay = 1500,
			virt_text_pos = "eol",
			ignore_whitespace = true,
		},

		preview_config = {
			border = "rounded",
			style = "minimal",
			relative = "cursor",
			row = 1,
			col = 1,
		},

		word_diff = false,

		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			map("n", "]c", function()
				if vim.wo.diff then
					return "]c"
				end
				vim.schedule(function()
					gs.next_hunk()
				end)
				return "<Ignore>"
			end, { expr = true })

			map("n", "[c", function()
				if vim.wo.diff then
					return "[c"
				end
				vim.schedule(function()
					gs.prev_hunk()
				end)
				return "<Ignore>"
			end, { expr = true })

			-- Actions
			map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>")
			map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>")
			map("n", "<leader>hS", gs.stage_buffer)
			map("n", "<leader>hu", gs.undo_stage_hunk)
			map("n", "<leader>hR", gs.reset_buffer)
			map("n", "<leader>hp", gs.preview_hunk)
			map("n", "<leader>hb", function()
				gs.blame_line({ full = true })
			end)
			map("n", "<leader>tb", gs.toggle_current_line_blame)
			map("n", "<leader>hD", function()
				gs.diffthis("~")
			end)
			-- map("n", "<leader>td", gs.toggle_deleted)

			-- Text object
			map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
		end,
	},
	config = function(_, opts)
		require("gitsigns").setup(opts)
	end,
}
