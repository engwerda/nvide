local M = {}

local wk = require("which-key")

local function set_keymaps()
	wk.register({
		P = {
			name = "python",
			d = { "<cmd>:RopeDocs<CR>", "Docs" },
			e = { "<cmd>:RopeExtractMethod<CR>", "Extract method" },
			E = { "<cmd>:RopeExtractVariable<CR>", "Extract variable" },

			m = { "<cmd>:RopeMove<CR>", "Rename" },
			s = { "<cmd>CocCommand python.sortImports<CR>", "Sort imports" },
			S = { "<cmd>CocCommand pyright.organizeimports<CR>", "Pyright organize imports" },
			r = {
				name = "RopeVim",
				c = {
					name = "Create",
					c = { "<cmd>RopeCreateClass<CR>", "Class" },
				},
				r = { "<cmd>:RopeRename<CR>", "Rename" },
				s = { "<cmd>:RopeSortImports<CR>", "Sort Imports" },
			},
		},
	}, {
		prefix = "<leader>",
	})
	wk.register({
		P = {
			name = "Python",
			e = { "<cmd>:RopeExtractMethod<CR>", "Extract method" },
			E = { "<cmd>:RopeExtractVariable<CR>", "Extract variable" },

		},
	}, {
		prefix = "<leader>",
		mode = "v",
	})
end

function M.setup()
	vim.g.python3_host_prog = "~/.pyenv/versions/nvim/bin/python"
	set_keymaps()
end

return M
