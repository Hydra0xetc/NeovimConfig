return {
	{
		"nvim-tree/nvim-web-devicons",
		enabled = true,
		priority = 1000,
		opts = {
			override_by_extension = {
				["c"] = {
					color = "#6495ed",
					icon = "",
					name = "C",
				},
				-- ["python"] = {
				-- 	color = "#ffff00",
				-- 	icon = "",
				-- 	name = "Python",
				-- },
				["js"] = {
					color = "#f7df1e",
					icon = "",
					name = "Js",
				},
				["html"] = {
					color = "#ffa07a",
					icon = "",
					name = "Html",
				},
				["css"] = {
					color = "#1572b6",
					icon = "",
					name = "Css",
				},
				-- ["lua"] = {
				-- 	color = "#366B8A",
				-- 	icon = "",
				-- 	name = "Lua",
				-- },
			},
		},
	},
	{
		"onsails/lspkind.nvim",
		config = function()
			require("lspkind").setup({
				-- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
				mode = "symbol_text",

				preset = "codicons",

				-- defaulf symbol
				symbol_map = {
					Text = "󰉿",
					Method = "󰆧",
					Function = "󰊕",
					Constructor = "",
					Field = "󰜢",
					Variable = "󰀫",
					Class = "󰠱",
					Interface = "",
					Module = "",
					Property = "󰜢",
					Unit = "󰑭",
					Value = "󰎠",
					Enum = "",
					Keyword = "󰌋",
					Snippet = "",
					Color = "󰏘",
					File = "󰈙",
					Reference = "󰈇",
					Folder = "󰉋",
					EnumMember = "",
					Constant = "󰏿",
					Struct = "󰙅",
					Event = "",
					Operator = "󰆕",
					TypeParameter = "",
				},
			})
		end,
	},
}
