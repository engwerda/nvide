local status_ok, neorg = pcall(require, "neorg")
if not status_ok then
	return
end

local M = {}

local neorg = require("neorg")

function M.setup()
	neorg.setup({
		-- Tell Neorg what modules to load
		load = {
			["core.defaults"] = {}, -- Load all the default modules
			--[[ ["core.norg.completion"] = {}, ]]
			["core.norg.dirman"] = { -- Manage your directories with Neorg
				config = {
					workspaces = {
						home = "~/neorg",
						work = "~/neorg/work",
						sapphire = "~/neorg/work/sapphire",
						sam = "~/neorg/work/sam",
						ntassets = "~/neorg/work/ntassets",
						notes = "~/neorg/notes",
						snippets = "~/neorg/snippets",
						gtd = "~/neorg/gtd",
					},
					index = "index.norg",
				},
			},
			["core.keybinds"] = {
				config = { -- Note that this table is optional and doesn't need to be provided
					default_keybinds = true,
					neorg_leader = "n",
					--[[ hook = function(keybinds) ]]
					--[[ 	keybinds.unmap("all", "n", "<c-s>") ]]
					--[[ end, ]]
				},
			},
			["core.integrations.telescope"] = {}, -- Enable the telescope module
			["core.looking-glass"] = {}, -- Enable the looking_glass module
			--[[ ["external.context"] = {}, ]]
			["core.export"] = {},
			["core.export.markdown"] = {
				config = {
					extensions = "all",
				},
			},
			["core.norg.esupports.metagen"] = {
				config = {
					type = "auto",
				},
			},

			["core.gtd.base"] = {
				config = {
					-- workspace =   "example_gtd" , -- assign the workspace,
					workspace = "gtd",
					--[[ exclude = { "notes/", "journal" }, -- Optional: all excluded files from the workspace are not part of the gtd workflow ]]
					projects = {
						show_completed_projects = false,
						show_projects_without_tasks = false,
					},
					custom_tag_completion = true,
				},
			},
			["core.norg.manoeuvre"] = {},
			["core.norg.qol.toc"] = {
				config = {
					close_split_on_jump = false,
					toc_split_placement = "left",
				},
			},
			["core.norg.journal"] = {
				config = {
					workspace = "home",

					journal_folder = "journal",
					use_folders = true,
				},
			},
			["core.presenter"] = {
				config = {
					zen_mode = "zen-mode",
					slide_count = {
						enable = true,
						position = "top",
						count_format = "[%d/%d]",
					},
				},
			},
			["core.norg.concealer"] = {
				config = {
					--[[ markup_preset = "dimmed", ]]
					--[[ markup_preset = "conceal", ]]
					markup_preset = "varied",
					icon_preset = "diamond",
					icons = {
						marker = {
							enabled = true,
							icon = " ",
						},
						todo = {
							enable = true,
							pending = {
								-- icon = ""
								icon = "",
							},
							uncertain = {
								icon = "?",
							},
							urgent = {
								icon = "",
							},
							on_hold = {
								icon = "",
							},
							cancelled = {
								icon = "",
							},
						},
						heading = {
							enabled = true,
							level_1 = {
								icon = "◈",
							},

							level_2 = {
								icon = " ◇",
							},

							level_3 = {
								icon = "  ◆",
							},
							level_4 = {
								icon = "   ❖",
							},
							level_5 = {
								icon = "    ⟡",
							},
							level_6 = {
								icon = "     ⋄",
							},
						},
					},
				},
			},
		},
	})
end

return M
