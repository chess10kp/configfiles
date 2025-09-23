local completion = {}

completion["neovim/nvim-lspconfig"] = {
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	-- config = require("completion.lsp"),
	-- example calling setup directly for each LSP
	config = require("completion.lsp"),
	dependencies = {
		{ "mason-org/mason.nvim" },
		{ "mason-org/mason-lspconfig.nvim" },
		{ "saghen/blink.cmp" },
	},
}
completion["stevearc/conform.nvim"] = {
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	config = require("completion.conform"),
}
completion["saghen/blink.cmp"] = {
	build = "cargo build --release",
	dependencies = {
		{
			"rafamadriz/friendly-snippets",
		},
		{
			"giuxtaposition/blink-cmp-copilot",
		},
		{
			"saghen/blink.compat",
			optional = true, -- make optional so it's only enabled if any extras need it
			opts = {},
			version = "*",
		},
	},
	event = "InsertEnter",
	version = "*",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		-- 'default' for mappings similar to built-in completion
		-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
		-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
		-- See the full "keymap" documentation for information on defining your own keymap.
		keymap = { preset = "enter" },
		snippets = {
			preset = "luasnip",
		},
		appearance = {
			-- Sets the fallback highlight groups to nvim-cmp's highlight groups
			-- Useful for when your theme doesn't support blink.cmp
			-- Will be removed in a future release
			use_nvim_cmp_as_default = true,
			-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = "mono",
		},
		completion = {
			ghost_text = {
				enabled = vim.g.ai_cmp,
			},
			accept = {
				-- experimental auto-brackets support
				auto_brackets = {
					enabled = true,
				},
			},
			menu = {
				draw = {
					treesitter = { "lsp" },
					columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", "source_name" } },
				},
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 200,
			},
		},
		cmdline = {
			enabled = true,
		},
		sources = {
			default = { "copilot", "lsp", "path", "snippets", "buffer" },
			providers = {
				copilot = {
					name = "copilot",
					module = "blink-cmp-copilot",
				},
			},
		},
	},
	opts_extend = { "sources.default" },
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
completion["zbirenbaum/copilot.lua"] = {
	enabled = true,
	lazy = true,
	cmd = "Copilot",
	config = require("completion.copilot"),
}
completion["supermaven-inc/supermaven-nvim"] = {
	enabled = true,
	config = function()
		require("supermaven-nvim").setup({
			keymaps = {
				accept_suggestion = "<M-]>",
			},
		})
	end,
}

return completion
