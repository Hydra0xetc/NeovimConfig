return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lsp",
		"saadparwaiz1/cmp_luasnip",
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			window = {
				completion = {
					border = "single", -- single, double, rounded
					max_height = 8,
					scrolloff = 2,
					scrollbar = true,
				},
				documentation = {
					border = "single", -- single, double, rounded
					max_height = 12,
				},
			},
			performance = {
				max_view_entries = 7,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp", max_item_count = 5 },
				{ name = "luasnip", max_item_count = 3 },
				{ name = "path", max_item_count = 3 },
			}, {
				{ name = "buffer", max_item_count = 3 },
			}),
		})
	end,
}
