return function()
	local api = require("typescript-tools.api")
	require("typescript-tools").setup({
		-- on_attach = function() ... end,
		handlers = {
			["textDocument/formatting"] = "",
			["textDocument/publishDiagnostics"] = api.filter_diagnostics({ 6133 }),
		},
		settings = {
			-- spawn additional tsserver instance to calculate diagnostics on it
			separate_diagnostic_server = false,
			-- "change"|"insert_leave" determine when the client asks the server about diagnostic
			publish_diagnostic_on = "change",
			-- array of strings("fix_all"|"add_missing_imports"|"remove_unused")
			-- specify commands exposed as code_actions
			expose_as_code_action = {
				"fix_all",
				"add_missing_imports",
			},
			-- string|nil - specify a custom path to `tsserver.js` file, if this is nil or file under path
			-- not exists then standard path resolution strategy is applied
			tsserver_path = nil,
			-- specify a list of plugins to load by tsserver, e.g., for support `styled-components`
			-- (see 💅 `styled-components` support section)
			tsserver_plugins = {},
			-- this value is passed to: https://nodejs.org/api/cli.html#--max-old-space-sizesize-in-megabytes
			-- memory limit in megabytes or "auto"(basically no limit)
			tsserver_max_memory = "auto",
			-- described below
			tsserver_format_options = {},
			tsserver_file_preferences = {
				includeCompletionsForModuleExports = true,
				includeCompletionsForImportStatements = true,
			},
			-- mirror of VSCode's `typescript.suggest.completeFunctionCalls`
			complete_function_calls = true,
		},
	})
end
