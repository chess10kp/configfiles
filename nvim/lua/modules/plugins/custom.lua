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
custom["nvim-neorg/neorg"] = {
	build = ":Neorg sync-parsers",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {}, -- Loads default behaviour
				["core.concealer"] = {}, -- Adds pretty icons to your documents
				["core.dirman"] = { -- Manages Neorg workspaces
					config = {
						workspaces = {
							default = "~/projects/notes/todo.org",
							notes = "~/projects/notes/",
							daily = "~/projects/daily/",
						},
					},
				},
			},
		})
	end,
}
return custom
