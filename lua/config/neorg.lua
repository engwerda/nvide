local M = {}

local neorg = require("neorg")

function M.setup()
	neorg.setup({
		-- Tell Neorg what modules to load
		load = {
			["core.defaults"] = {}, -- Load all the default modules
			["core.norg.completion"] = {},
			["core.export"] = {},
			["core.export.markdown"] = {},
			["core.journal"] = {},
			["core.qol.toc"] = {},
			["core.gtd.base"] = {},
			["core.core.norg.manoeuvre "] = {},
			["core.norg.concealer"] = {}, -- Allows for use of icons
			["core.norg.dirman"] = { -- Manage your directories with Neorg
				config = {
					workspaces = {
						work = "~/notes/work",
						home = "~/notes/home",
					},
				},
			},
		},
	})
end

return M
