return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			event = "BufWritePre",
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
					vim.keymap.set("n", "<leader>f", function()
						vim.lsp.buf.format({ async = true })
					end, opts)
				end,
			})

			-- Lua LSP
			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
				cmd = { "/data/data/com.termux/files/usr/bin/lua-language-server" },
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
				cmd = { "/data/data/com.termux/files/usr/bin/typescript-language-server", "--stdio" },
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

			-- Python LSP
			vim.lsp.config("pyright", {
				capabilities = capabilities,
				cmd = { "/data/data/com.termux/files/usr/bin/basedpyright-langserver", "--stdio" },
				settings = {
					python = {
						analysis = {
							autoSearchPaths = true,
							useLibraryCodeForTypes = true,
							-- diagnosticMode = "openFilesOnly",
							typeCheckingMode = "basic",
						},
					},
				},
			})

			-- C/C++ LSP
			vim.lsp.config("clangd", {
				capabilities = capabilities,
				cmd = {
					"clangd",
					"--compile-commands-dir=.",
					-- "--clang-tidy",
				},
			})

			vim.lsp.config("rust-analyzer", {
				capabilities = capabilities,
				cmd = { "rust-analyzer" },
				filetypes = { "rust" },
				settings = {
					["rust-analyzer"] = {
						cargo = { allFeatures = true },
						procMacro = { enable = true },
					},
				},
			})

			-- activate lsp
			vim.lsp.enable("lua_ls")
			vim.lsp.enable("tsserver")
			vim.lsp.enable("pyright")
			vim.lsp.enable("clangd")
			vim.lsp.enable("rust-analyzer")

			-- to activate linting
			vim.diagnostic.config({
				virtual_text = true,
				underline = true,
				update_in_insert = false,
			})
		end,
	},
}
