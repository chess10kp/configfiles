return function()
	function setup_formatting()
		local conform = require("conform")

		local function format_on_save()
			if vim.g.format_on_save_set then
				return {
					timeout_ms = 500,
					lsp_fallback = false,
					async = true,
				}
			else
				return nil
			end
		end
		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				go = { "goimports" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				java = { "google-java-format" },
				xml = { "xmlformatter" },
				css = { "prettier" },
				html = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				python = function(bufnr)
					if require("conform").get_formatter_info("ruff_format", bufnr).available then
						return { "ruff_format" }
					else
						return { "isort", "black" }
					end
				end,
				lua = { "stylua" },
				cpp = { "clang_format" },
				c = { "clang_format" },
				rust = { "rustfmt" },
				haskell = { "fourmolu" },
			},
			format_on_save = format_on_save(),
		})
	end

	vim.g.format_on_save_set = require("core.settings").format_on_save
	setup_formatting()
	vim.api.nvim_create_user_command("AutoFormatToggle", function()
		vim.g.format_on_save_set = not vim.g.format_on_save_set
		setup_formatting()
	end, {})

	local nmap = require("keymap.key").nmap
	nmap("<leader>fm", function()
		require("conform").format({
			lsp_fallback = false,
			async = false,
			timeout_ms = 1000,
		})
	end, "lsp: format current file")
end
