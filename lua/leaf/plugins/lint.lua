return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")
		local lint_aurgop = vim.api.nvim_create_augroup("lint", { clear = true })
		-- local eslint = lint.linters.eslint_d

		vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave", "BufEnter" }, {
			group = lint_aurgop,
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
