local custom = {}

custom["elkowar/yuck.vim"] = {
	lazy = true,
}
custom["folke/todo-comments.nvim"] = {
	lazy = true,
	event = "BufRead",
	config = require("custom.todo-comments"),
}
custom["rmagatti/session-lens"] = {
	lazy = false,
	config = function()
		require("session-lens").setup({--[[your custom config--]]
		})
	end,
}
custom["lervag/vimtex"] = {
	lazy = false,
}
custom["nvim-orgmode/orgmode"] = {
	lazy = true,
	config = function()
		require("orgmode").setup_ts_grammar()
		require("orgmode").setup({
			org_agenda_files = { "~/projects/notes/daily", "~/my-orgs/**/*" },
			org_default_notes_file = "~/projects/notes/thoughts.org",
			org_capture_templates = {
				r = {
					description = "Repo",
					template = "* [[%x][%(return string.match('%x', '([^/]+)$'))]]%?",
					target = "~/projects/notes/thoughts.org",
				},
			},
		})
	end,
}
return custom
