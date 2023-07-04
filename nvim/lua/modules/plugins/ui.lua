local ui = {}

ui["akinsho/bufferline.nvim"] = {
	lazy = true,
    event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("ui.bufferline"),
}
ui["olimorris/onedarkpro.nvim"] = {
	lazy = false,
}

ui["catppuccin/nvim"] = {
	lazy = false,
	name = "catppuccin",
	config = require("ui.catppuccin"),
}
ui["folke/tokyonight.nvim"] = {
	lazy = false,
	name = "tokyonight",
	config = require("ui.tokyonight"),
}
ui["decaycs/decay.nvim"] = {
    lazy = false,
    name = "decay",
    config = require("ui.decay"),
}
ui["sainnhe/edge"] = {
	lazy = true,
	config = require("ui.edge"),
}
--ui["j-hui/fidget.nvim"] = {
	--lazy = true,
	--event = "BufReadPost",
	--config = require("ui.fidget"),
--}
ui["lewis6991/gitsigns.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("ui.gitsigns"),
}
ui["lukas-reineke/indent-blankline.nvim"] = {
	lazy = true,
	event = "BufReadPost",
	config = require("ui.indent-blankline"),
}
--ui["nvim-lualine/lualine.nvim"] = {
	--lazy = true,
	--event = { "BufReadPost", "BufAdd", "BufNewFile" },
	--config = require("ui.lualine"),
--}
ui["zbirenbaum/neodim"] = {
	lazy = true,
	event = "LspAttach",
	config = require("ui.neodim"),
}
ui["rcarriga/nvim-notify"] = {
	lazy = false,
	event = "VeryLazy",
	config = require("ui.notify"),
}
ui["folke/paint.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("ui.paint"),
}
ui["dstein64/nvim-scrollview"] = {
	lazy = true,
	event = "BufReadPost",
	config = require("ui.scrollview"),
}
ui["edluffy/specs.nvim"] = {
	lazy = true,
	event = "CursorMoved",
	config = require("ui.specs"),
}

return ui
