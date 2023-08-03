return function()
	local null_ls = require("null-ls")
	local mason_null_ls = require("mason-null-ls")
	local btns = null_ls.builtins

	-- Please set additional flags for the supported servers here
	-- Don't specify any config here if you are using the default one.
	local sources = {
		--python

		--cpp
		btns.formatting.clang_format.with({
			filetypes = { "c", "cpp" },
			extra_args = require("completion.formatters.clang_format"),
		}),
		btns.diagnostics.cpplint,

		--shell
		btns.formatting.shfmt,
		btns.diagnostics.shellcheck,
		btns.code_actions.shellcheck,
		--btns.hover.printenv,

		-- lua
		btns.formatting.stylua,
		btns.diagnostics.luacheck.with({
			method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
			extra_args = { "--globals 'vim' " },
		}),

		-- haskell
		btns.formatting.fourmolu,
	}
	null_ls.setup({
		border = "rounded",
		debug = false,
		log_level = "warn",
		update_in_insert = false,
		sources = sources,
	})

	mason_null_ls.setup({
		ensure_installed = require("core.settings").null_ls_deps,
		automatic_installation = true,
		automatic_setup = true,
		handlers = {},
	})

	require("completion.formatting").configure_format_on_save()
end
