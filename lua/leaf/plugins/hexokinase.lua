return {
	enabled = false,
	"rrethy/vim-hexokinase",
	build = "make hexokinase",
	config = function()
		vim.g.Hexokinase_highlighters = { "virtual" }
		vim.g.Hexokinase_virtualText = "■"
	end,
}
