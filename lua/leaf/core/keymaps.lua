local opts = { noremap = true, silent = true }

vim.keymap.set("n", "r", "<C-r>")
vim.api.nvim_set_keymap("n", "<C-q>", "<cmd>q<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-Q>", "<cmd>q!<CR>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-s>", "<Esc><cmd>w<CR>")
vim.keymap.set("n", "<C-s>", vim.cmd.w)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- source config
vim.keymap.set("n", "<leader>so", vim.cmd.so)

-- Move selected lines up and down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- search always in middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("v", "p", '"_dp', opts)

vim.keymap.set("n", "<C-x>", ":silent !chmod +x %<CR>:redraw!<CR>")

-- change word under cursor
vim.keymap.set(
	"n",
	"<leader>S",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Substitute word under cursor" }
)

-- highlight yank
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "highlight when yank",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.keymap.set("n", "<leader>w", vim.diagnostic.open_float)

local term_buffers = {
	cargo_run = nil,
	cargo_build = nil,
	cargo_test = nil,
	make = nil,
	make_clean = nil,
	npm_start = nil,
}

-- Ensure the terminal buffer always one
local function run_in_terminal(command, key)
	-- Checks if terminal buffer already exist
	if term_buffers[key] and vim.api.nvim_buf_is_valid(term_buffers[key]) then
		local windows = vim.fn.win_findbuf(term_buffers[key])
		if #windows > 0 then
			vim.api.nvim_set_current_win(windows[1])
		else
			vim.cmd("sb " .. term_buffers[key])
		end
	else
		-- make a new terminal
		vim.cmd("terminal " .. command)
		term_buffers[key] = vim.api.nvim_get_current_buf()

		-- auto insert mode
		vim.cmd("startinsert")
		return
	end

	-- send command into terminal

	vim.cmd("startinsert")
end

-- Keymaps for compiling
vim.keymap.set("n", "<leader>Cr", function()
	run_in_terminal("cargo run", "cargo_run")
end, { desc = "Cargo run" })

vim.keymap.set("n", "<leader>Ct", function()
	vim.ui.input({
		prompt = "Cargo test args: ",
		default = "-- --exact --nocapture --quiet ",
	}, function(args)
		if args then
			local command = "RUSTFLAGS='-A warnings' cargo test"
			if args ~= "" then
				command = command .. " " .. args
			end
			run_in_terminal(command, "cargo_test")
		end
	end)
end, { desc = "Cargo test with args" })

vim.keymap.set("n", "<leader>ma", function()
	vim.ui.input({
		prompt = "Make args: ",
	}, function(args)
		if args then
			local command = "make"
			if args ~= "" then
				command = command .. " " .. args
			end
			run_in_terminal(command, "make")
		end
	end)
end, { desc = "Cargo test with args" })

vim.keymap.set("n", "<leader>mi", function()
	run_in_terminal("intercept-build make -j2", "intercept build")
end, { desc = "Make Intercept" })

vim.keymap.set("n", "<leader>Cb", function()
	run_in_terminal("cargo build", "cargo_build")
end, { desc = "Cargo build" })

-- npm start
vim.keymap.set("n", "<leader>mp", function()
	run_in_terminal("npm start", "npm_start")
end, { desc = "Npm start" })

-- :noh for delete the highlight
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- use gj/gk instead of using j/k
-- vim.keymap.set({ "n", "v" }, "j", "gj")
-- vim.keymap.set({ "n", "v" }, "k", "gk")
-- vim.keymap.set({ "n", "v" }, "<Down>", "gj")
-- vim.keymap.set({ "n", "v" }, "<Up>", "gk")
-- vim.keymap.set({ "n", "v" }, "<END>", "g<END>")
-- vim.keymap.set({ "n", "v" }, "<HOME>", "g<HOME>")

-- keymap for scroll command
vim.api.nvim_set_keymap("c", "<Up>", 'wildmenumode() ? "\\<Left>" : "\\<Up>"', { expr = true, noremap = true })
vim.api.nvim_set_keymap("c", "<Down>", 'wildmenumode() ? "\\<Right>" : "\\<Down>"', { expr = true, noremap = true })
vim.api.nvim_set_keymap("c", "<Left>", 'wildmenumode() ? "\\<Up>" : "\\<Left>"', { expr = true, noremap = true })
vim.api.nvim_set_keymap("c", "<Right>", 'wildmenumode() ? "\\<Down>" : "\\<Right>"', { expr = true, noremap = true })

vim.keymap.set("n", "<leader>tc", function()
	---@diagnostic disable-next-line: undefined-field
	local current = vim.opt.clipboard:get()

	if vim.tbl_contains(current, "unnamedplus") then
		vim.opt.clipboard = ""
		vim.notify("Clipboard syncing OFF", vim.log.levels.INFO)
	else
		vim.opt.clipboard = "unnamedplus"
		vim.notify("Clipboard syncing ON", vim.log.levels.INFO)
	end
end, { desc = "Toggle clipboard sync" })

-- esc twice for normal mode in terminal mode
vim.keymap.set("t", "<esc><esc>", "<C-\\><C-n>")

-- enabled built-in todo comments
vim.cmd("hi clear todo")

vim.api.nvim_create_user_command("LeafUpdate", function()
	local config_dir = vim.fn.stdpath("config")
	local git_dir = config_dir .. "/.git"

	-- ensure config_dir is string beacuse chdir wanted string
	if type(config_dir) ~= "string" or config_dir == "" then
		vim.notify("Invalid config directory path" .. vim.log.levels.ERROR)
		return
	end

	if vim.fn.isdirectory(git_dir) == 0 then
		vim.notify("Directory '.git' not found in: " .. config_dir, vim.log.levels.ERROR)
		return
	end

	vim.notify("Update leaf config...", vim.log.levels.INFO)

	local current_dir = vim.fn.getcwd()
	vim.fn.chdir(config_dir)

	local result = vim.fn.system({ "git", "pull" })
	vim.fn.chdir(current_dir)

	if vim.v.shell_error ~= 0 then
		vim.notify("Failed to update leaf: " .. result, vim.log.levels.ERROR)
	else
		vim.notify("Update complete!!, now restart your neovim", vim.log.levels.INFO)
	end
end, {})
