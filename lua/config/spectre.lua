local M = {}

local wk = require("which-key")

local function set_keymaps()
	wk.register({
		s = {
			name = "Search",
			s = { "<cmd>lua require('spectre').open_visual()<cr>", "Search for selected word" },
		},
	}, {
		prefix = "<leader>",
		mode = "v",
	})
end

function M.setup()
	require("spectre").setup()
	set_keymaps()
end

return M
