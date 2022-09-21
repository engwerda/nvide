local M = {}

local dap_python = require('dap-python')

function M.setup()
  local dap_install_path = vim.fn.stdpath('data') .. '/dapinstall'
  dap_python.setup(dap_install_path .. '/python/bin/python')
  dap_python.test_runner = 'pytest'
  _G.set_dap_python_keybindings = function()
    local buf = vim.api.nvim_get_current_buf()
    set_keymaps(buf)
  end
end

return M
