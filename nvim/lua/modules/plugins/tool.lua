local tool = {}

tool["NeogitOrg/neogit"] = {
	enabled = true,
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional - Diff integration
		"nvim-telescope/telescope.nvim", -- optional
	},
	config = true,
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
		{ "debugloop/telescope-undo.nvim", enabled = false, lazy = true },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{
			"nvim-telescope/telescope-frecency.nvim",
			lazy = true,
			enabled = false,
			dependencies = {
				{ "kkharji/sqlite.lua" },
			},
		},
		{ "nvim-telescope/telescope-live-grep-args.nvim", lazy = true },
		{ "nvim-telescope/telescope-file-browser.nvim", lazy = true },
	},
}

----------------------------------------------------------------------
--                           DAP Plugins                            --
----------------------------------------------------------------------
tool["mfussenegger/nvim-dap"] = {
	lazy = true,
	config = require("tool.dap"),
	cmd = { "DapToggleBreakpoint" },
	dependencies = {
		{ "mfussenegger/nvim-dap-python", lazy = true, ft = "python" },
		"theHamsta/nvim-dap-virtual-text",
	},
}
tool["mfussenegger/nvim-dap-ui"] = {
	lazy = true,
	cmd = { "DapToggleBreakpoint", "DapContinue" },
	dependencies = {
		"mfussenegger/nvim-dap",
		"theHamsta/nvim-dap-virtual-text",
	},
	config = require("tool.dap"),
}

return tool
