local M = {}

local wk = require("which-key")

local function set_keymaps()
	wk.register({
		P = {
			name = "python",
      [";"] = { "<cmd>:CocCommand ruff.executeAutofix<CR>", "Ruff autofix" },
      f = { "<cmd>:CocCommand ruff.executeAutofix<CR>", "Ruff autofix" },
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
      d = { "<cmd>:ChatGPTRun gpt4-add-google-docstring<CR>", "Add DocString" },
      D = { "<cmd>:ChatGPTRun gpt4-convert-to-google-docstring<CR>", "Convert Docstring to Google style" },
      m = { "<cmd>:ChatGPTRun gpt4-module-docstring<CR>", "Add Module DocString" },
      t = { "<cmd>:ChatGPTRun gpt4-add-python-type-annotations<CR>", "Add type annotations" },
      f = { "<cmd>:ChatGPTRun gpt4-optimize_and_fix_code<CR>", "Fix and Optimize code" },
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
