local ui = {}

ui["akinsho/bufferline.nvim"] = {
  enabled = false,
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("ui.bufferline"),
}

ui["Mofiqul/vscode.nvim"]  = {
  lazy = true,
  name = "vscode",
}
ui["Everblush/everblush.vim"] = {
  lazy = true,
}
ui["olimorris/onedarkpro.nvim"] = {
  lazy = true,
}
ui["nyoom-engineering/oxocarbon.nvim"] = {
  lazy = true,
  name = "oxocarbon"
}
ui["catppuccin/nvim"] = {
  lazy = true,
  name = "catppuccin",
}
ui["ishan9299/nvim-solarized-lua"] = {
  lazy = true,
  name = "solarized",
}
ui["folke/tokyonight.nvim"] = {
  lazy = true,
  name = "tokyonight",
  config = require("ui.tokyonight"),
}
ui ["Skullamortis/forest.nvim" ] = { 
  lazy = true,
  name = "forest", 
  priority = 1000,
}
ui["Shatur/neovim-ayu"] = {
  lazy = true,
  name = "ayu",
  config = require("ui.ayu"),
}
ui["ray-x/starry.nvim"] = {
  lazy = false,
}
  ui["xiyaowong/transparent.nvim"] = {
  lazy = true,
  cmd = "TransparentEnable", 
}
ui["tiagovla/tokyodark.nvim"] = {
  lazy = true,
  opts = {
    terminal_colors = true,
    transparent_background = true, -- set background to transparent
    gamma = 2.00,                -- adjust the brightness of the theme
  },
  config = function(_, opts)
    require("tokyodark").setup(opts) -- calling setup is optional
  end,
}
ui["decaycs/decay.nvim"] = {
  lazy = true,
  name = "decay",
  config = require("ui.decay"),
}
ui["rktjmp/lush.nvim"] = {
	lazy = false,
  enabled = false,
}
ui["ellisonleao/gruvbox.nvim"] = {
  lazy = true,
  event = "BufReadPost",
  name = "gruvbox",
  config = require("ui.gruvbox"),
}

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
ui["nvim-lualine/lualine.nvim"] = {
  enabled = true, 
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("ui.lualine"),
}
ui["rebelot/heirline.nvim"] = {
  enabled = false ,
  lazy = true,
  event = { "BufReadPost", "BufAdd", "BufNewFile" },
  config = require("ui.heirline"),
}
ui["zbirenbaum/neodim"] = {
  enabled = false,
lazy = true,
event = "LspAttach",
config = require("ui.neodim"),
}
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
ui["dstein64/nvim-scrollview"] = {
  enabled = false,
	lazy = true,
	event = "BufReadPost",
	config = require("ui.scrollview"),
}
ui["edluffy/specs.nvim"] = {
  lazy = true,
  event = "CursorMoved",
  config = require("ui.specs"),
}
ui["karb94/neoscroll.nvim"] = {
  lazy = false,
  enabled =true,
  config = require("ui.neoscroll"),
}
return ui
