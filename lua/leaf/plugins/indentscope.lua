return {
	"echasnovski/mini.indentscope",
	event = { "BufReadPre", "BufReadPost" },
	version = "*",
	config = function()
		require("mini.indentscope").setup({
			symbol = "│",
			options = { try_as_border = true },
		})
	end,
}
