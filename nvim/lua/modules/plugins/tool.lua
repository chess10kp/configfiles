local tool = {}

tool["tpope/vim-fugitive"] = {
	lazy = true,
	cmd = { "Git", "G" },
}
tool["mbbill/undotree"] = {
	lazy = false,
}
tool["takac/vim-hardtime"] = {
	lazy = true,
}
tool["simrat39/symbols-outline.nvim"] = {
	lazy = true,
	cmd = "SymbolsOutline",
	config = require("tool.outline"),
}
tool["ibhagwan/smartyank.nvim"] = { -- highlight yanks and yank to clip
	lazy = true,
	event = "BufReadPost",
	config = require("tool.smartyank"),
}
tool["akinsho/toggleterm.nvim"] = {
	lazy = true,
	cmd = {
		"ToggleTerm",
		"ToggleTermSetName",
		"ToggleTermToggleAll",
		"ToggleTermSendVisualLines",
		"ToggleTermSendCurrentLine",
		"ToggleTermSendVisualSelection",
	},
	config = require("tool.toggleterm"),
}

----------------------------------------------------------------------
--                        Telescope Plugins                         --
----------------------------------------------------------------------
tool["nvim-telescope/telescope.nvim"] = {
	lazy = false,
	config = require("tool.telescope"),
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
		{ "nvim-lua/plenary.nvim" },
		{ "debugloop/telescope-undo.nvim", 
    enabled = false,
    lazy = true, 
    },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{
			"nvim-telescope/telescope-frecency.nvim",
      lazy = true, 
      enabled = false,
			dependencies = {
				{ "kkharji/sqlite.lua" },
			},
		},
		{ "nvim-telescope/telescope-live-grep-args.nvim", lazy = true,
    },
		{ "nvim-telescope/telescope-file-browser.nvim" , lazy = true, },
	},
}

----------------------------------------------------------------------
--                           DAP Plugins                            --
----------------------------------------------------------------------
tool["mfussenegger/nvim-dap"] = {
	lazy = false,
  config = require("tool.dap")
}
tool["mfussenegger/nvim-dap-ui"] = {
	lazy = true,
  cmd = {"DapToggleBreakpoint", "DapContinue"},
	dependencies = {
		"mfussenegger/nvim-dap",
	},
	config = require("tool.dap"),
}
tool["theHamsta/nvim-dap-virtual-text"] = {
	lazy = true,
	dependencies = {
		"mfussenegger/nvim-dap",
		"mfussenegger/nvim-dap-ui",
	},
  config = require("tool.dap.virtualtext")
}

return tool
