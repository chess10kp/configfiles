local completion = {}

completion["neovim/nvim-lspconfig"] = {
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("completion.lsp"),
	dependencies = {
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{
			"ray-x/lsp_signature.nvim",
			enabled = true,
			lazy = true,
			-- ft = {"lua"},
			config = require("completion.lsp-signature"),
		},
	},
}
completion["nvimdev/lspsaga.nvim"] = {
	lazy = true,
	event = "LspAttach",
	config = require("completion.lspsaga"),
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
completion["stevearc/conform.nvim"] = {
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	config = require("completion.conform"),
}
completion["mfussenegger/nvim-lint"] = {
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	config = require("completion.nvim-lint"),
}
completion["L3MON4D3/LuaSnip"] = {
	config = require("completion.luasnip"),
	lazy = true,
	event = "InsertEnter",
}
completion["hrsh7th/nvim-cmp"] = {
	lazy = true,
	event = "InsertEnter",
	config = require("completion.cmp"),
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			dependencies = {
			},
		},
		{ "onsails/lspkind.nvim" },
		-- { "lukas-reineke/cmp-under-comparator" },
		{ "saadparwaiz1/cmp_luasnip" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-nvim-lua" },
		-- { "andersevenrud/cmp-tmux" },
		{ "hrsh7th/cmp-path" },
		{ "f3fora/cmp-spell" },
		{ "hrsh7th/cmp-buffer" },
		{
			"kdheepak/cmp-latex-symbols",
			enabled = false,
			lazy = true,
			ft = "latex",
		},
		-- { "ray-x/cmp-treesitter" },
		-- { "tzachar/cmp-tabnine", enabled = false, build = "./install.sh", config = require("completion.tabnine") },
		-- {
		-- 	"jcdickinson/codeium.nvim",
		-- 	enabled = false,
		-- 	dependencies = {
		-- 		"nvim-lua/plenary.nvim",
		-- 		"MunifTanjim/nui.nvim",
		-- 	},
		-- 	config = require("completion.codeium"),
		-- },
	},
}
completion["zbirenbaum/copilot.lua"] = {
	enabled = true,
	lazy = true,
	cmd = "Copilot",
	event = "InsertEnter",
	config = require("completion.copilot"),
	dependencies = {
		{
			"zbirenbaum/copilot-cmp",
			config = require("completion.copilot-cmp"),
		},
	},
}
completion["CopilotC-Nvim/CopilotChat.nvim"] = {
	branch = "canary",
	dependencies = {
		{ "zbirenbaum/copilot.lua" }, -- or zbirenbaum/copilot.lua
		{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
	},
	build = "make tiktoken", -- Only on MacOS or Linux
	opts = {
		-- See Configuration section for options
	},
	-- See Commands section for default commands if you want to lazy load on them
}
return completion
