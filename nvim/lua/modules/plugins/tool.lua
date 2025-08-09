local tool = {}

tool["NeogitOrg/neogit"] = {
	enabled = true,
	lazy = true,
	cmd = "Neogit",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional - Diff integration
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

----------------------------------------------------------------------
--                        Telescope Plugins                         --
----------------------------------------------------------------------
tool["nvim-telescope/telescope.nvim"] = {
	enabled = false,
	lazy = false,
	config = require("tool.telescope"),
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope-live-grep-args.nvim", lazy = true },
		{ "nvim-telescope/telescope-file-browser.nvim", lazy = true },
		{ "nvim-telescope/telescope-fzf-native.nvim" },
	},
}
tool["ibhagwan/fzf-lua"] = {
	-- optional for icon support
	-- or if using mini.icons/mini.nvim
	-- dependencies = { "echasnovski/mini.icons" },
	opts = {},
  config = function()
    require("fzf-lua").register_ui_select()
    require('fzf-lua').setup({"ivy"})
  end
}
return tool
