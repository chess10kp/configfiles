local ui = {}

-- ui["akinsho/bufferline.nvim"] = {
-- 	lazy = true,
-- 	event = { "BufReadPost", "BufAdd", "BufNewFile" },
-- 	config = require("ui.bufferline"),
-- }
ui["olimorris/onedarkpro.nvim"] = {
	lazy = true,
}
ui["catppuccin/nvim"] = {
	lazy = true,
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
ui["Shatur/neovim-ayu"] = {
	lazy = true,
	name = "ayu",
	config = require("ui.ayu"),
}
ui[ "ray-x/starry.nvim" ] = {
  lazy = true, 
}
ui["tiagovla/tokyodark.nvim"] = {
	lazy = true,
	opts = {
		terminal_colors = true,
		transparent_background = true, -- set background to transparent
		gamma = 2.00, -- adjust the brightness of the theme
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
-- ui["rktjmp/lush.nvim"] = {
-- 	lazy = false,
-- }
-- ui["loganswartz/selenized.nvim"] = {
-- 	lazy = false,
--   dependencies = {
--     'rktjmp/lush.nvim'
--   }
-- }
ui["ellisonleao/gruvbox.nvim"] = {
	lazy = true,
	name = "gruvbox",
	config = require("ui.gruvbox"),
}

-- ui["lewis6991/gitsigns.nvim"] = {
-- 	lazy = true,
-- 	event = { "CursorHold", "CursorHoldI" },
-- 	config = require("ui.gitsigns"),
-- }
-- ui["lukas-reineke/indent-blankline.nvim"] = {
-- lazy = true,
-- event = "BufReadPost",
-- config = require("ui.indent-blankline"),
-- }
-- ui["nvim-lualine/lualine.nvim"] = {
-- 	lazy = true,
-- 	event = { "BufReadPost", "BufAdd", "BufNewFile" },
-- 	config = require("ui.lualine"),
-- }
ui["rebelot/heirline.nvim"] = {
	lazy = false,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("ui.heirline"),
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
ui["karb94/neoscroll.nvim"] = {
	lazy = false,
	config = require("ui.neoscroll"),
}
return ui
