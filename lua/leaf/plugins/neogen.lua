return {
	"danymat/neogen",
	version = "*",

	config = function()
		require("neogen").setup({
			-- snippet_engine = "luasnip",
			enabled = true,
			languages = {
				javascript = {
					template = {
						annotation_convention = "jsdoc",
					},
				},
				typescript = {
					template = {
						annotation_convention = "tsdoc",
					},
				},
				c = {
					template = {
						annotation_convention = "doxygen",
					},
				},
				cpp = {
					template = {
						annotation_convention = "doxygen",
					},
				},
			},
		})

		vim.keymap.set("n", "<Leader>df", ":lua require('neogen').generate({ type = 'func' })<CR>")
		vim.keymap.set("n", "<Leader>dc", ":lua require('neogen').generate({ type = 'class' })<CR>")
		vim.keymap.set("n", "<Leader>dt", ":lua require('neogen').generate({ type = 'type' })<CR>")
	end,
}
