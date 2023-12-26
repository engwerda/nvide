local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Use ; for command mode
keymap("n", ";", ":", { noremap = false })

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Map U to redo (Ctrl-r) in normal mode
keymap("n", "U", "<C-r>", opts)

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to exit insert mode
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Navigator keybindings
keymap('n', "<A-h>", '<CMD>NavigatorLeft<CR>', opts)
keymap('n', "<A-l>", '<CMD>NavigatorRight<CR>', opts)
keymap('n', "<A-k>", '<CMD>NavigatorUp<CR>', opts)
keymap('n', "<A-j>", '<CMD>NavigatorDown<CR>', opts)
keymap('n', "<A-p>", '<CMD>NavigatorPrevious<CR>', opts)

-- Copy to clipboard in normal and visual mode
keymap('n', '<C-c>', '"+y', opts)
keymap('v', '<C-c>', '"+y', opts)

-- Paste from clipboard in normal and insert mode
keymap('n', '<C-v>', '"+p', opts)
keymap('i', '<C-v>', '<C-r>+', opts)

-- Command mode mapping for paste from clipboard
keymap('c', '<C-v>', '<C-r>+', opts)

-- Insert mode mapping for <C-r>
keymap('i', '<C-r>', '<C-v>', opts)

-- Additional mappings for Shift-Insert
keymap('n', '<S-Insert>', '"+p', opts)
keymap('i', '<S-Insert>', '<C-r>+', opts)
keymap('c', '<S-Insert>', '<C-r>+', opts)
