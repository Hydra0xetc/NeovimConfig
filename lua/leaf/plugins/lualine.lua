local function macro_recording()
	local recording = vim.fn.reg_recording()
	if recording == "" then
		return ""
	else
		return "Recording @" .. recording
	end
end

return {
	"nvim-lualine/lualine.nvim",
	enabled = true,
	event = { "BufReadPost", "BufNewFile" },
	opts = function()
		return {
			options = {
				theme = "auto",
				globalstatus = true,
				refresh = { statusline = 1000 },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = { macro_recording },
				lualine_y = {},
				lualine_z = { "location" },
			},
		}
	end,
}
