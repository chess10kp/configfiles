local tool = {}

tool["nvim-telescope/telescope-fzf-native.nvim"] = {
	enabled = true,
	lazy = true,
  build = 'make' ,
}
tool["NeogitOrg/neogit"] = {
	enabled = true,
	lazy = true,
	cmd = "Neogit",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional - Diff integration
		"nvim-telescope/telescope.nvim", -- optional
	},
	config = true,
	keys = {
		{
			"<leader>g",
			mode = { "n" },
			function()
				require("neogit").open()
			end,
			desc = "neogit",
		},
	},
}
tool["mbbill/undotree"] = {
	lazy = false,
}
tool["ibhagwan/smartyank.nvim"] = { -- highlight yanks and yank to clip
  enabled = false,
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
		{ "nvim-lua/plenary.nvim" },
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
