return function()
	local lint = require("lint")

	lint.linters_by_ft = {
		python = { "ruff" },
	}
	local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

	vim.api.nvim_create_user_command("Lint", function()
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "TextChanged" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})
	end, {})
end
