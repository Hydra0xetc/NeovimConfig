return {
	"rrethy/vim-hexokinase",
	-- enabled = false,
	build = "make hexokinase",
	config = function()
		vim.g.Hexokinase_highlighters = {
			"virtual",
		}
		vim.g.Hexokinase_virtualText = "■"

		vim.g.Hexokinase_optInPatterns = {
			"full_hex",
			"rgb",
			"rgba",
			"hsl",
			"hsla",
		}

		vim.api.nvim_create_autocmd("TermOpen", {
			callback = function()
				vim.b.vim_hexokinase_disable = true
			end,
		})
	end,
}
