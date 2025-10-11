return {
	{
		"stevearc/conform.nvim",
		enabled = true,
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local conform = require("conform")

			conform.setup({
				formatters_by_ft = {
					lua = { "stylua" },
					javascript = { "prettier" },
					typescript = { "prettier" },
					javascriptreact = { "prettier" },
					typescriptreact = { "prettier" },
					-- html = { "prettier" },
					-- css = { "prettier" },
					-- markdown = { "prettier" },
					c = { "clang_format" },
					cpp = { "clang_format" },
					rust = { "rustfmt" },
				},
				format_on_save = {
					timeout_ms = 5000,
					lsp_fallback = true,
				},
				formatters = {
					prettier = {
						prepend_args = { "--tab-width", "4", "--use-tabs", "false" },
					},
					clang_format = {
						prepend_args = {
							"--style",
							"{BasedOnStyle: llvm, IndentWidth: 4, UseTab: Never, TabWidth: 4, ColumnLimit: 120}",
						},
					},
					rustfmt = {
						-- prepend_args = { "--edition", "2021" },
					},
				},
			})

			vim.keymap.set({ "n", "v" }, "<leader>f", function()
				conform.format({
					lsp_fallback = true,
					async = true,
					timeout_ms = 5000,
				})
			end, { desc = "Format file" })
		end,
	},
}
