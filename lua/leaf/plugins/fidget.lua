return {
	"j-hui/fidget.nvim",
	config = function()
		require("fidget").setup({
			text = {
				spinner = "dots",
			},
			align = {
				bottom = true,
				right = true,
			},
			window = {
				relative = "editor",
				blend = 0,
				zindex = nil,
			},
			fmt = {
				max_width = 0,
			},
		})
	end,
}
