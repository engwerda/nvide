local status_ok, dap_python = pcall(require, "dap-python")
if not status_ok then
	return
end

local M = {}

local dap_python = require('dap-python')
local wk = require('which-key')

local function set_keymaps(bufnr)
  wk.register({
    d = {
      t = {
        name = 'test',
        f = { "<cmd>lua require('dap-python').test_method()<CR>", 'Test Function/Method' },
        c = { "<cmd>lua require('dap-python').test_class()<CR>", 'Test Class' },
      },
    },
  }, {
    prefix = '<leader>',
    buffer = bufnr,
  })
end

function M.setup()
  local dap_install_path = vim.fn.stdpath('data') .. '/dapinstall'
  -- dap_python.setup(dap_install_path .. '/usr/bin/python')
  dap_python.test_runner = 'pytest'
  _G.set_dap_python_keybindings = function()
    local buf = vim.api.nvim_get_current_buf()
    set_keymaps(buf)
  end
end

return M

