return {
	"nvim-telescope/telescope.nvim",
	envent = { "ButReadPre", "BufReadPost" },
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")

		telescope.setup({
			defaults = {
				border = false,
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--fixed-strings",
					"--trim",
				},
				file_ignore_patterns = {
					"^.git/",
					"node_modules",
					"%.pyc",
					"__pycache__",
					"%.o",
					"%.out",
					"%.class",
					"%.lock",
					"%.log",
					"target/",
					"dist/",
					"build/",
					".cache/",
				},
				mappings = {
					i = {
						["<C-j>"] = "move_selection_next",
						["<C-k>"] = "move_selection_previous",
						["<Esc>"] = "close",
						["<C-u>"] = false,
					},
				},
				layout_strategy = "vertical",
				layout_config = {
					vertical = {
						height = 0.95,
						width = 0.9,
						preview_height = 0.7,
						preview_cutoff = 0,
						mirror = false,
						prompt_position = "bottom",
					},
				},

				preview = {
					hide_on_startup = false,
					timeout = 200,
					timeoutlen = 200,
				},
				cache_picker = {
					num_pickers = 15,
				},
				dynamic_preview_title = true,
				path_display = { "truncate" },
				set_env = { ["COLORTERM"] = "truecolor" },
				scroll_strategy = "cycle",
				sorting_strategy = "ascending",
				pickers = {
					find_files = {
						hidden = true,
						find_command = {
							"rg",
							"--files",
							"--hidden",
							"--glob",
							"!**/.git/*",
							"--glob",
							"!**/node_modules/*",
							"--glob",
							"!**/.cache/*",
						},
						file_ignore_patterns = {
							"^.git/",
						},
					},
					live_grep = {
						additional_args = function(opts)
							local args = { "--hidden", "--glob", "!**/.git/*" }
							if opts.query and #opts.query > 2 then
								table.insert(args, "--fixed-strings")
							end
							return args
						end,
						disable_coordinates = true,
						only_sort_text = true,
					},
					buffers = {
						ignore_current_buffer = true,
						sort_lastused = true,
						sort_mru = true,
					},
					lsp_references = {
						show_line = false,
						fname_width = 40,
						trim_text = true,
						include_declaration = false,
					},
				},
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
				},
			},
		})

		telescope.load_extension("fzf")

		vim.keymap.set("n", "<leader> ", function()
			builtin.find_files({
				find_command = {
					"rg",
					"--files",
					"--hidden",
					"--glob",
					"!**/.git/*",
					"--glob",
					"!**/node_modules/*",
				},
			})
		end, { desc = "Telescope find files" })

		vim.keymap.set("n", "<leader>fg", function()
			builtin.live_grep({
				disable_coordinates = true,
				additional_args = { "--hidden", "--glob", "!**/.git/*", "--fixed-strings" },
			})
		end, { desc = "Telescope live grep" })

		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

		vim.keymap.set("n", "<C-g>", function()
			builtin.git_files({
				show_untracked = true,
				use_git_root = false,
			})
		end, { desc = "Telescope search git files" })

		vim.keymap.set("n", "<leader>fc", function()
			builtin.find_files({
				prompt_title = "< NEOVIM CONFIG >",
				cwd = vim.fn.stdpath("config"),
				find_command = {
					"rg",
					"--files",
					"--hidden",
					"--glob",
					"!**/.git/*",
				},
				layout_config = {
					vertical = {
						height = 0.95,
						width = 0.9,
						preview_height = 0.7,
					},
				},
			})
		end, { desc = "telescope config file" })

		vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Telescope recent files" })
		vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Telescope keymaps" })
		vim.keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<CR>", { desc = "Telescope branches" })
		vim.keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics<CR>")
	end,
}
