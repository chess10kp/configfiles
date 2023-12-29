return function()
	local null_ls = require("null-ls")
	local mason_null_ls = require("mason-null-ls")
	local btns = null_ls.builtins

	-- Please set additional flags for the supported servers here
	-- Don't specify any config here if you are using the default one.
	local sources = {

		btns.formatting.clang_format.with({
			filetypes = { "c", "cpp" },
			extra_args = require("completion.formatters.clang_format"),
		}),
    btns.diagnostics.cpplint,
    -- btns.formatting.htmlbeautifier,
		btns.formatting.prettier.with({
			filetypes = {
				"vue",
				"yaml",
				"css",
				"scss",
				"sh",
				"markdown",
        "html",
			},
		}),
		btns.diagnostics.luacheck.with({
			method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
			extra_args = { "--globals 'vim' " },
		}),

		-- -- haskell
		-- btns.formatting.fourmolu,
	}
	null_ls.setup({
		border = "single",
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
