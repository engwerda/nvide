local status_ok, packer = pcall(require, "hop")
if not status_ok then
	return
end

local M = {}
local hop = require("hop")

local setup = {
	keys = "etovxqpdygfblzhckisuran",
}

local function set_keymaps()
	local opts = { noremap = true, silent = true }
	vim.api.nvim_set_keymap("n", "s", ":HopChar1<CR>", opts)
	vim.api.nvim_set_keymap("n", "S", ":HopChar2<CR>", opts)
	vim.api.nvim_set_keymap("n", "f", ":HopWord<CR>", opts)
	vim.api.nvim_set_keymap("n", "F", ":HopLine<CR>", opts)
	vim.api.nvim_set_keymap("n", "t", ":HopPattern<CR>", opts)
	vim.api.nvim_set_keymap("n", "T", ":HopLineAC<CR>", opts)
end

M.setup = function()
	hop.setup(setup)
	set_keymaps()
end

return M
