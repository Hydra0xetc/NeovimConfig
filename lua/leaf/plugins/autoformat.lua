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
					-- python = { "autopep8" },
					html = { "prettier" },
					css = { "prettier" },
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
						prepend_args = {
							"--tab-width",
							"4",
							"--use-tabs",
							"false",
						},
					},
					clang_format = {
						prepend_args = {
							"--style=file",
						},
					},
					-- rustfmt = {
					-- 	prepend_args = {
					-- 		"--edition",
					-- 		"2024",
					-- 	},
					-- },
					-- autopep8 = {
					-- 	prepend_args = {
					-- 		"--aggressive",
					-- 		"--max-line-length=100",
					-- 	},
					-- },
				},
			})
		end,
	},
}
