return {
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
			-- ["lua"] = {
			-- 	color = "#366B8A",
			-- 	icon = "",
			-- 	name = "Lua",
			-- },
		},
	},
}
