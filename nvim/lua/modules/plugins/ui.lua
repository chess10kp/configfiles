local ui = {}

--ui["olimorris/onedarkpro.nvim"] = {
	--lazy = true,
--}
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
ui["shaunsingh/solarized.nvim"] = {
  lazy = false, 
  name = "solarized", 
}
ui["ellisonleao/gruvbox.nvim"] = {
	lazy = true,
	name = "gruvbox",
  event = {"BufReadPost"},
	config = require("ui.gruvbox"),
}
--ui["lewis6991/gitsigns.nvim"] = {
  --enabled = false,
	--lazy = true,
	--event = { "CursorHold", "CursorHoldI" },
	--config = require("ui.gitsigns"),
--}
--ui["lukas-reineke/indent-blankline.nvim"] = {
  --enabled = false,
	--lazy = true,
	--event = "BufReadPost",
	--config = require("ui.indent-blankline"),
--}
--ui["rebelot/heirline.nvim"] = {
  --enabled = false,
  --lazy = true,
  --event = { "BufReadPost", "BufAdd", "BufNewFile" },
  --config = require("ui.heirline"),
--}
ui["rcarriga/nvim-notify"] = {
  enabled = false, 
	lazy = false,
	event = "VeryLazy",
	config = require("ui.notify"),
}
ui["karb94/neoscroll.nvim"] = {
	lazy = false,
	enabled = false,
	config = require("ui.neoscroll"),
}
return ui
