local which_key_status_ok, _ = pcall(require, "which-key")
if not which_key_status_ok then
	return
end

local M = {}

local wk = require("which-key")

local function set_keymaps()
	wk.register({
	["\\"] = { "<cmd>:ToggleTermSendVisualLines<CR>", "Send selected lines to terminal" },
		h = { "<gv", "Move text left" },
		l = { ">gv", "Move text right" },
		k = { ":move '>-2<CR>gv-gv", "Move text up (broken)" },
		j = { ":move '>+1<CR>gv-gv", "Move text down" },
		p = { '"_dP', "paste in place" },
  c = {
    name = "AI",
    a = { "<cmd>:ChatGPTActAs<cr>", "Act as prompt" },
    e = { "<cmd>:ChatGPTEditWithInstructions<cr>", "Edit With Instructions" },
    P = { "<cmd>:ChatGPT<cr>", "GPT prompt" },
    r = { "<cmd>:ChatGPTRun", "Run GPT action" },
  },
		x = {
			name = "Text",
			["<"] = { "<gv", "Move text left" },
			[">"] = { ">gv", "Move text right" },
			p = { '"_dP', "paste in place" },
			k = { ":move '>-2<CR>gv-gv", "Move text up (broken)" },
			j = { ":move '>+1<CR>gv-gv", "Move text down" },
      
			s = {
				name = "Sort",
				a = { "<cmd>:sort<cr>", "Sort Ascending" },
				d = { "<cmd>:sort!<cr>", "Sort Descending" },
				u = { "<cmd>:sort u<cr>", "Sort Unique" },
				n = { "<cmd>:sort n<cr>", "Sort Numerically" },
			},
		},
	}, {
		prefix = "<leader>",
		mode = "v",
	})
end

M.setup = function()
	set_keymaps()
end

return M
