return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		-- event = { "VeryLazy", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Global LSP keymaps
			vim.keymap.set("n", "<leader>wl", function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, { desc = "List Workspace Folders" })

			-- LSP Attach autocommand
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local opts = { buffer = ev.buf }

					-- Buffer local mappings
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>")
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
					vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
					vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
					vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "gr", function()
						require("telescope.builtin").lsp_references({
							trim_text = true,
						})
					end)
				end,
			})

			-- Lua LSP
			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
				cmd = { vim.fn.exepath("lua-language-server") },
				settings = {
					Lua = {
						runtime = {
							version = "LuaJIT",
						},
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
						telemetry = {
							enable = false,
						},
					},
				},
			})

			-- TypeScript/JavaScript LSP
			vim.lsp.config("tsserver", {
				capabilities = capabilities,
				cmd = { vim.fn.exepath("typescript-language-server"), "--stdio" },
				filetypes = {
					"javascript",
					"javascriptreact",
					"javascript.jsx",
					"typescript",
					"typescriptreact",
					"typescript.tsx",
				},
				root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
			})

			-- Html
			vim.lsp.config("vscode-html-language-server", {
				capabilities = capabilities,
				cmd = { vim.fn.exepath("vscode-html-language-server"), "--stdio" },
				filetypes = {
					"html",
					"htmlx",
					"htmldjango",
				},
			})

			-- Css
			vim.lsp.config("vscode-css-language-server", {
				capabilities = capabilities,
				cmd = { vim.fn.exepath("vscode-css-language-server"), "--stdio" },
				filetypes = {
					"html",
					"css",
					"scss",
					"less",
				},
			})

			-- Bash
			vim.lsp.config("bash-language-server", {
				capabilities = capabilities,
				cmd = { vim.fn.exepath("bash-language-server"), "--stdio" },
				filetypes = {
					"sh",
					"bash",
					"zsh",
				},
			})

			-- Python LSP
			vim.lsp.config("basedpyright", {
				capabilities = capabilities,
				cmd = { vim.fn.exepath("basedpyright-langserver"), "--stdio" },
				settings = {
					basedpyright = {
						analysis = {
							autoSearchPaths = true,
							useLibraryCodeForTypes = true,
							reportTypeshedErrors = false,
							typeCheckingMode = "basic",
						},
					},
				},
			})

			-- C/C++ LSP
			vim.lsp.config("clangd", {
				capabilities = capabilities,
				cmd = {
					vim.fn.exepath("clangd"),
					"--compile-commands-dir=.",
				},
			})

			vim.lsp.config("rust-analyzer", {
				capabilities = capabilities,
				cmd = { vim.fn.exepath("rust-analyzer") },
				filetypes = { "rust" },
				settings = {
					["rust-analyzer"] = {
						cargo = { allFeatures = true },
						procMacro = { enable = true },
					},
				},
			})

			-- activate lsp
			vim.lsp.enable("lua_ls", true)
			vim.lsp.enable("tsserver", true)
			vim.lsp.enable("basedpyright", true)
			vim.lsp.enable("clangd", true)
			vim.lsp.enable("rust-analyzer", true)
			vim.lsp.enable("vscode-css-language-server", true)
			vim.lsp.enable("vscode-html-language-server", true)
			vim.lsp.enable("bash-language-server", true)

			-- to activate linting
			local diagnostics_enabled = true
			local diagnostics_signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "",
					[vim.diagnostic.severity.WARN] = "",
					[vim.diagnostic.severity.INFO] = "",
					[vim.diagnostic.severity.HINT] = "",
				},
			}

			local function toggle_diagnostics()
				diagnostics_enabled = not diagnostics_enabled
				vim.diagnostic.config({
					virtual_text = diagnostics_enabled,
					underline = diagnostics_enabled,
					signs = diagnostics_enabled and diagnostics_signs or false,
					update_in_insert = false,
				})
				print("Diagnostics " .. (diagnostics_enabled and "enabled" or "disabled"))
			end

			vim.diagnostic.config({
				virtual_text = true,
				underline = true,
				signs = diagnostics_signs,
				update_in_insert = false,
			})

			vim.keymap.set("n", "<leader>fl", toggle_diagnostics, { desc = "Toggle diagnostics" })
		end,
	},
}
