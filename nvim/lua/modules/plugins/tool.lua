local tool = {}

tool["tpope/vim-fugitive"] = {
	lazy = true,
	cmd = { "Git", "G" },
}
tool["mbbill/undotree"] = {
	lazy = false,
}
tool["folke/which-key.nvim"] = {
	lazy = true,
	event = "InsertEnter",
	config = require("tool.which-key"),
}
tool["takac/vim-hardtime"] = {
	lazy = false,
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
tool["michaelb/sniprun"] = {
	lazy = true,
	-- You need to cd to `~/.local/share/nvim/site/lazy/sniprun/` and execute `bash ./install.sh`,
	-- if you encountered error about no executable sniprun found.
	build = "bash ./install.sh",
	cmd = { "SnipRun" },
	config = require("tool.sniprun"),
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
tool["folke/trouble.nvim"] = {
	lazy = true,
	cmd = { "Trouble", "TroubleToggle", "TroubleRefresh" },
	config = require("tool.trouble"),
}
tool["folke/which-key.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("tool.which-key"),
}
tool["gelguy/wilder.nvim"] = {
	lazy = true,
	event = "CmdlineEnter",
	config = require("tool.wilder"),
	dependencies = { "romgrk/fzy-lua-native" },
}

----------------------------------------------------------------------
--                        Telescope Plugins                         --
----------------------------------------------------------------------
tool["nvim-telescope/telescope.nvim"] = {
	lazy = true,
	cmd = "Telescope",
	config = require("tool.telescope"),
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope-project.nvim" },
		{ "debugloop/telescope-undo.nvim" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{
			"nvim-telescope/telescope-frecency.nvim",
			dependencies = {
				{ "kkharji/sqlite.lua" },
			},
		},
		{ "jvgrootveld/telescope-zoxide" },
		{ "nvim-telescope/telescope-live-grep-args.nvim", 
      lazy = true,
    },
		{ "nvim-telescope/telescope-file-browser.nvim" },
	},
}

----------------------------------------------------------------------
--                           DAP Plugins                            --
----------------------------------------------------------------------
tool["mfussenegger/nvim-dap"] = {
	lazy = true,
}
tool["mfussenegger/nvim-dap-python"] = {
	lazy = true,
	ft = "python",
	dependencies = {
		"mfussenegger/nvim-dap",
		"mfussenegger/nvim-dap-ui",
	},
	config = function(_, opts)
		local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
		require("dap-python").setup(path)
	end,
}
tool["mfussenegger/nvim-dap-ui"] = {
	lazy = true,
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
