return function()
	function setup_formatting()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				python = { "isort", "black" },
				lua = { "stylua" },
				cpp = { "clang_format" },
				c = { "clang_format" },
				rust = { "rustfmt" },
				haskell = { "fourmolu" },
			},
			function()
				if vim.g.format_on_save_set then
					format_on_save = {
						timeout_ms = 1000,
						lsp_fallback = false,
						async = true,
					}
				end
			end,
		})
	end

	vim.g.format_on_save_set = require("core.settings").format_on_save
	setup_formatting()
	vim.api.nvim_create_user_command("AutoFormatToggle", function()
		vim.g.format_on_save_set = (vim.g.format_on_save_set == false) and true or false
    setup_formatting()
	end, {})
end
