local status_ok, packer = pcall(require, "ufo")
if not status_ok then
	return
end

local M = {}
local ufo = require("ufo")

local setup = {}

local function set_keymaps()
	local opts = { noremap = true, silent = true }
	vim.api.nvim_set_keymap("n", "zR", "<cmd>lua require ('ufo').openAllFolds()<cr>", opts)
	vim.api.nvim_set_keymap("n", "zM", "<cmd>lua require ('ufo').closeAllFolds()<cr>", opts)
end

M.setup = function()
	ufo.setup(setup)
	vim.o.foldcolumn = "1" -- '0' is not bad
	vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
	vim.o.foldlevelstart = 99
	vim.o.foldenable = true
	set_keymaps()
end

return M
