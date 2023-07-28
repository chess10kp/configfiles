local ui = {}

ui["akinsho/bufferline.nvim"] = {
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("ui.bufferline"),
}
ui["olimorris/onedarkpro.nvim"] = {
	lazy = true,
}
ui["catppuccin/nvim"] = {
	lazy = true,
	name = "catppuccin",
	config = require("ui.catppuccin"),
}
ui["folke/tokyonight.nvim"] = {
	lazy = true,
	name = "tokyonight",
	config = require("ui.tokyonight"),
}
ui["decaycs/decay.nvim"] = {
	lazy = true,
	name = "decay",
	config = require("ui.decay"),
}
ui["ellisonleao/gruvbox.nvim"] = {
	lazy = true,
	name = "gruvbox",
	config = require("ui.gruvbox"),
}

ui["lewis6991/gitsigns.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("ui.gitsigns"),
}
-- ui["lukas-reineke/indent-blankline.nvim"] = {
-- lazy = true,
-- event = "BufReadPost",
-- config = require("ui.indent-blankline"),
-- }
ui["nvim-lualine/lualine.nvim"] = {
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("ui.lualine"),
}
-- ui["zbirenbaum/neodim"] = {
-- lazy = true,
-- event = "LspAttach",
-- config = require("ui.neodim"),
-- }
ui["rcarriga/nvim-notify"] = {
	lazy = false,
	event = "VeryLazy",
	config = require("ui.notify"),
}
ui["folke/paint.nvim"] = { --NOTE: highlight comments
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("ui.paint"),
}
-- ui["dstein64/nvim-scrollview"] = {
-- 	lazy = true,
-- 	event = "BufReadPost",
-- 	config = require("ui.scrollview"),
-- }
-- ui["edluffy/specs.nvim"] = {
-- 	lazy = true,
-- 	event = "CursorMoved",
-- 	config = require("ui.specs"),
-- }

return ui
