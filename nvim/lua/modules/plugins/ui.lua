local ui = {}

ui["akinsho/bufferline.nvim"] = {
	enabled = false,
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("ui.bufferline"),
}
ui["folke/zen-mode.nvim"] = {
	enabled = true,
	lazy = true,
}

ui["olimorris/onedarkpro.nvim"] = {
	lazy = true,
}
ui["folke/tokyonight.nvim"] = {
	lazy = true,
	name = "tokyonight",
	config = require("ui.tokyonight"),
}
ui["Shatur/neovim-ayu"] = {
	lazy = true,
	name = "ayu",
	config = require("ui.ayu"),
}
ui["marko-cerovac/material.nvim"] = {
  lazy = true, 
}
ui["ellisonleao/gruvbox.nvim"] = {
	lazy = true,
	name = "gruvbox",
	config = require("ui.gruvbox"),
}

ui["lewis6991/gitsigns.nvim"] = {
    enabled = false,
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("ui.gitsigns"),
}
ui["lukas-reineke/indent-blankline.nvim"] = {
  enabled = false,
	lazy = true,
	event = "BufReadPost",
	config = require("ui.indent-blankline"),
}
ui["rebelot/heirline.nvim"] = {
  enabled = true,
  lazy = true,
  event = { "BufReadPost", "BufAdd", "BufNewFile" },
  config = require("ui.heirline"),
}
ui["rcarriga/nvim-notify"] = {
  enabled = false, 
	lazy = false,
	event = "VeryLazy",
	config = require("ui.notify"),
}
ui["folke/paint.nvim"] = { --NOTE: highlight comments
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("ui.paint"),
}
ui["karb94/neoscroll.nvim"] = {
	lazy = false,
	enabled = true,
	config = require("ui.neoscroll"),
}

ui["xiyaowong/transparent.nvim"] = {
	lazy = true,
	cmd = "TransparentEnable",
}
ui["nvim-lualine/lualine.nvim"] = {
	enabled = false,
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("ui.lualine"),
}
return ui
