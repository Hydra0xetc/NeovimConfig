return {
	"akinsho/bufferline.nvim",
	config = function()
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				style_preset = {
					bufferline.style_preset.minimal,
					bufferline.style_preset.no_italic,
				},
				show_buffer_close_icons = false,
				show_close_icon = false,
				separator_style = "thick",
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						highlight = "Directory",
						separator = true,
						text_align = "left",
					},
				},
				diagnostics = "nvim_lsp",

				diagnostics_indicator = function(count, level)
					local icons = {
						error = " ",
						warning = " ",
						hint = "󰌵 ",
						info = " ",
					}
					local icon = icons[level] or " "
					return " " .. icon .. count
				end,
			},
		})

		-- Keymaps
		vim.keymap.set("n", "H", "<cmd>BufferLineCyclePrev<cr>")
		vim.keymap.set("n", "L", "<cmd>BufferLineCycleNext<cr>")
		vim.keymap.set("n", "<leader>bd", "<cmd>bd<cr>")
	end,
}
