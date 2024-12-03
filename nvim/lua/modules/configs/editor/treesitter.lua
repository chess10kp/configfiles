return vim.schedule_wrap(function()
	local use_ssh = require("core.settings").use_ssh

	vim.api.nvim_set_option_value("foldmethod", "expr", {})
	vim.api.nvim_set_option_value("foldexpr", "nvim_treesitter#foldexpr()", {})

	require("nvim-treesitter.configs").setup({
		sync_install = false,
		ensure_installed = {
			"org",
			"bash",
			"cmake",
			"c",
			"cpp",
			"css",
			"go",
			"gomod",
			"html",
			"javascript",
			"typescript",
			"json",
			"lua",
			"make",
			"markdown",
			"markdown_inline",
			"python",
			"rust",
			"vim",
			"vimdoc",
			"yaml",
		},
		auto_install = true,
		ignore_install = {},
		highlight = {
			enable = true,
			disable = function(ft, bufnr)
				if vim.tbl_contains({ "vim" }, ft) then
					return true
				end

				local ok, is_large_file = pcall(vim.api.nvim_buf_get_var, bufnr, "bigfile_disable_treesitter")
				return ok and is_large_file
			end,
			additional_vim_regex_highlighting = { "org" },
		},
		incremental_selection = { enable = true },
		indent = { enable = true },
		context_commentstring = { enable = true, enable_autocmd = false },
		matchup = { enable = true },
    rainbow = {enable = false}
	})
	require("nvim-treesitter.install").prefer_git = true
	if use_ssh then
		local parsers = require("nvim-treesitter.parsers").get_parser_configs()
		for _, p in pairs(parsers) do
			p.install_info.url = p.install_info.url:gsub("https://github.com/", "git@github.com:")
		end
	end
end)
