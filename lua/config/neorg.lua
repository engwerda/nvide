local status_ok, _ = pcall(require, "neorg")
if not status_ok then
	return
end
local which_key_status_ok, _ = pcall(require, "which-key")
if not which_key_status_ok then
	return
end

local M = {}

local neorg = require("neorg")

local wk = require("which-key")

local function set_keymaps()
	wk.register({
		["/"] = { "<Cmd>Neorg keybind norg core.gtd.base.capture<CR>", "Capture" },
		[","] = { "<Cmd>Neorg keybind norg core.gtd.base.views<CR>", "Views" },
		o = {
			name = "Neorg",
			c = { "<Cmd>Neorg keybind norg core.gtd.base.capture<CR>", "Capture" },
			g = {
				name = "GTD",
				c = { "<Cmd>Neorg keybind norg core.gtd.base.capture<CR>", "Capture" },
				v = { "<Cmd>Neorg keybind norg core.gtd.base.views<CR>", "Views" },
				e = { "<Cmd>Neorg keybind norg core.gtd.base.edit<CR>", "Edit" },
				t = { "<Cmd>:Telescope neorg find_project_tasks<CR>", "Find project tasks" },
			},
			j = {
				name = "Journal",
				c = { "<Cmd>Neorg journal custom<CR>", "Custom date" },
				t = { "<Cmd>Neorg journal today<CR>", "Today" },
				T = { "<Cmd>Neorg journal tomorrow<CR>", "Tomorrow" },
				y = { "<Cmd>Neorg journal yesterday<CR>", "Yesterday" },
				u = { "<Cmd>Neorg journal toc update<CR>", "TOC update" },
				o = { "<Cmd>Neorg journal toc open<CR>", "TOC open" },
			},
			L = { "<Cmd>Neorg keybind norg core.looking-glass.magnify-code-block<CR>", "Magnify code block" },
			l = {
				name = "Links",
				i = { "<Cmd>:Telescope neorg insert_link<CR>", "Insert link" },
				f = { "<Cmd>:Telescope neorg insert_file_link<CR>", "Insert file link" },
				F = { "<Cmd>:Telescope neorg insert_file_link<CR>", "Find linkable" },
				v = {
					"<Cmd>Neorg keybind norg core.norg.esupports.hop.hop-link vsplit<CR>",
					"Open link in vertical split",
				},
			},
			m = {
				name = "Manoeuvre",
				j = { "<Cmd>Neorg keybind norg core.manoeuvre.item_up<CR>", "Item up" },
				k = { "<Cmd>Neorg keybind norg core.manoeuvre.item_down<CR>", "Item down" },
			},
			n = { "<Cmd>Neorg keybind norg core.norg.dirman.new.note<CR>", "New Note" },
			p = {
				name = "Presenter",
				s = { "<Cmd>:Neorg<CR>", "Start presenter" },
				c = { "<Cmd>:Neorg<CR>", "Close presenter" },
				n = { "<Cmd>Neorg keybind norg core.presenter.next_page<CR>", "Next page" },
				p = { "<Cmd>Neorg keybind norg core.presenter.previous_page<CR>", "Previous page" },
			},
			t = {
				name = "Neorg Task Motions",
				r = { "<Cmd>Neorg keybind norg core.norg.qol.todo_items.todo.task_recurring<CR>", "Task Recurring" },
				c = { "<Cmd>Neorg keybind norg core.norg.qol.todo_items.todo.task_cancelled<CR>", "Task Cancelled" },
				i = { "<Cmd>Neorg keybind norg core.norg.qol.todo_items.todo.task_important<CR>", "Task Important" },
				h = { "<Cmd>Neorg keybind norg core.norg.qol.todo_items.todo.task_on_hold<CR>", "Task On Hold" },
				p = { "<Cmd>Neorg keybind norg core.norg.qol.todo_items.todo.task_pending<CR>", "Task Pending" },
				u = { "<Cmd>Neorg keybind norg core.norg.qol.todo_items.todo.task_undone<CR>", "Task Pending" },
				d = { "<Cmd>Neorg keybind norg core.norg.qol.todo_items.todo.task_done<CR>", "Task Done" },
			},
			T = {
				name = "Neorg",
				h = { ":Neorg mode traverse-heading<CR>", "Traverse Heading" },
				n = { ":Neorg mode norg<CR>", "Neorg Mode" },
				t = { "<Cmd>Neorg keybind norg core.norg.concealer.toggle-markup<CR>", "Toggle Markup" },
			},
			w = { "<Cmd>:Telescope neorg switch_workspace<CR>", "Workspaces" },
		},
	}, {
		prefix = "<leader>",
	})
end

local neorg_config = {
	-- Tell Neorg what modules to load
	load = {
		["core.defaults"] = {}, -- Load all the default modules
		["core.norg.news"] = {
			config = {
				check_news = false,
			},
		},
		--[[ ["core.norg.completion"] = {}, ]]
		["core.norg.dirman"] = { -- Manage your directories with Neorg
			config = {
				workspaces = {
					home = "~/neorg",
					journal = "~/neorg/journal",
					justice_supply_chain = "~/neorg/justice-supply-chain",
					notes = "~/neorg/notes",
					ntasset = "~/neorg/ntasset",
					sam = "~/neorg/sam",
					sapphire = "~/neorg/sapphire",
					snippets = "~/neorg/snippets",
					tutorials = "~/neorg/tutorials",
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

		--[[ ["core.gtd.helpers"] = {}, ]]
		--[[ ["core.gtd.ui"] = {}, ]]
		--[[ ["core.gtd.queries"] = {}, ]]
		--[[ ["core.gtd.base"] = { ]]
		--[[ 	config = { ]]
		--[[ 		-- workspace =   "example_gtd" , -- assign the workspace, ]]
		--[[ 		workspace = "home", ]]
		--[[ 		exclude = { "notes/", "journal", "snippets", "tutorials" }, -- Optional: all excluded files from the workspace are not part of the gtd workflow ]]
		--[[ 		projects = { ]]
		--[[ 			show_completed_projects = true, ]]
		--[[ 			show_projects_without_tasks = true, ]]
		--[[ 		}, ]]
		--[[ 		custom_tag_completion = true, ]]
		--[[ 	}, ]]
		--[[ }, ]]
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
				zen_mode = "truezen",
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
}

function M.setup()
	neorg.setup(neorg_config)
	set_keymaps()
end
return M
