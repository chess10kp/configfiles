return function()
	require("lspconfig.ui.windows").default_options.border = "single"
	local diagnostics_virtual_text = require("core.settings").diagnostics_virtual_text
	local diagnostics_level = require("core.settings").diagnostics_level

	local nvim_lsp = require("lspconfig")
	local mason = require("mason")
	local mason_lspconfig = require("mason-lspconfig")
	require("lspconfig.ui.windows").default_options.border = "rounded"

	local icons = {
		ui = require("modules.utils.icons").get("ui", true),
		misc = require("modules.utils.icons").get("misc", true),
	}

	mason.setup({
		ui = {
			border = "rounded",
			icons = {
				package_pending = icons.ui.Modified_alt,
				package_installed = icons.ui.Check,
				package_uninstalled = icons.misc.Ghost,
			},
			keymaps = {
				toggle_server_expand = "<CR>",
				install_server = "i",
				update_server = "u",
				check_server_version = "c",
				update_all_servers = "U",
				check_outdated_servers = "C",
				uninstall_server = "X",
				cancel_installation = "<C-c>",
			},
		},
    registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
    },
	})

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	-- capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

	local opts = {
		capabilities = capabilities,
	}

	---A handler to setup all servers defined under `completion/servers/*.lua`
	---@param lsp_name string
	local function mason_handler(lsp_name)
		local ok, custom_handler = pcall(require, "completion.servers." .. lsp_name)
		if not ok then
			-- Default to use factory config for server(s) that doesn't include a spec
			if lsp_name ~= "lua_ls" then -- handle in neodev.lua
				nvim_lsp[lsp_name].setup(opts)
			end
			return
		elseif type(custom_handler) == "function" then
			if lsp_name ~= "lua_ls" then --setup lua_ls in 'lang.neodev'
				--- Case where language server requires its own setup
				--- Make sure to call require("lspconfig")[lsp_name].setup() in the function
				custom_handler(opts)
			end
		elseif type(custom_handler) == "table" then
			nvim_lsp[lsp_name].setup(vim.tbl_deep_extend("force", opts, custom_handler))
		else
			vim.notify(
				string.format(
					"Failed to setup [%s].\n\nServer definition under `completion/servers` must return\neither a fun(opts) or a table (got '%s' instead)",
					lsp_name,
					type(custom_handler)
				),
				vim.log.levels.ERROR,
				{ title = "nvim-lspconfig" }
			)
		end
	end

	-- mason_lspconfig.setup_handlers({ mason_handler })

	-- Set lsps that are not supported by `mason.nvim` but supported by `nvim-lspconfig` here.
	if vim.fn.executable("dart") then
		local _opts = require("completion.servers.dartls")
		local final_opts = vim.tbl_deep_extend("keep", _opts, opts)
		nvim_lsp.dartls.setup(final_opts)
	end
	mason.setup({
		ui = {
			border = "single",
			icons = {
				package_pending = icons.ui.Modified_alt,
				package_installed = icons.ui.Check,
				package_uninstalled = icons.misc.Ghost,
			},
			keymaps = {
				toggle_server_expand = "<CR>",
				install_server = "i",
				update_server = "u",
				check_server_version = "c",
				update_all_servers = "U",
				check_outdated_servers = "C",
				uninstall_server = "X",
				cancel_installation = "<C-c>",
			},
		},
	})

	-- -- Additional plugins for pylsp
	-- mason_registry:on(
	-- 	"package:install:success",
	-- 	vim.schedule_wrap(function(pkg)
	-- 		if pkg.name ~= "python-lsp-server" then
	-- 			return
	-- 		end
	--
	-- 		local venv = vim.fn.stdpath("data") .. "/mason/packages/python-lsp-server/venv"
	-- 		local python = is_windows and venv .. "/Scripts/python.exe" or venv .. "/bin/python"
	-- 		local black = is_windows and venv .. "/Scripts/black.exe" or venv .. "/bin/black"
	-- 		local ruff = is_windows and venv .. "/Scripts/ruff.exe" or venv .. "/bin/ruff"
	--
	-- 		require("plenary.job")
	-- 			:new({
	-- 				command = python,
	-- 				args = {
	-- 					"-m",
	-- 					"pip",
	-- 					"install",
	-- 					"-U",
	-- 					"--disable-pip-version-check",
	-- 					"python-lsp-black",
	-- 					"python-lsp-ruff",
	-- 					"pylsp-rope",
	-- 				},
	-- 				cwd = venv,
	-- 				env = { VIRTUAL_ENV = venv },
	-- 				on_exit = function()
	-- 					if vim.fn.executable(black) == 1 and vim.fn.executable(ruff) == 1 then
	-- 						vim.notify(
	-- 							"Finished installing pylsp plugins",
	-- 							vim.log.levels.INFO,
	-- 							{ title = "[lsp] Install Status" }
	-- 						)
	-- 					else
	-- 						vim.notify(
	-- 							"Failed to install pylsp plugins. [Executable not found]",
	-- 							vim.log.levels.ERROR,
	-- 							{ title = "[lsp] Install Failure" }
	-- 						)
	-- 					end
	-- 				end,
	-- 				on_start = function()
	-- 					vim.notify(
	-- 						"Now installing pylsp plugins...",
	-- 						vim.log.levels.INFO,
	-- 						{ title = "[lsp] Install Status", timeout = 6000 }
	-- 					)
	-- 				end,
	-- 				on_stderr = function(_, msg_stream)
	-- 					vim.notify(msg_stream, vim.log.levels.ERROR, { title = "[lsp] Install Failure" })
	-- 				end,
	-- 			})
	-- 			:start()
	-- 	end)
	-- )


	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		signs = true,
		underline = true,
		virtual_text = diagnostics_virtual_text and {
				-- severity_limit = diagnostics_level,
			} or false,
		-- set update_in_insert to false bacause it was enabled by lspsaga
		update_in_insert = false,
	})

	---A handler to setup all servers defined under `completion/servers/*.lua`
	---@param lsp_name string
	local function mason_lsp_handler(lsp_name)
		local ok, custom_handler = pcall(require, "completion.servers." .. lsp_name)
		if not ok then
			if lsp_name == "basedpyright" then
				return
			end
			if lsp_name == "ruff" then
				nvim_lsp["ruff"].setup({
					capabilities = capabilities,
					init_options = {
						settings = {
							args = {
								"--extend-select=W,COM,ICN",
								"--ignore=E501,E722,COM812",
							},
						},
					},
				})
			elseif lsp_name == "jedi_language_server" then
				-- disable this since pylsp provides jedi_completion
				local jedi_capabilities = capabilities
				jedi_capabilities.textDocument.completion.completionItem.snippetSupport = false
				nvim_lsp["jedi_language_server"].setup({
					init_options = {
						completion = {
							disable_snippets = true,
						},
						diagnostics = {
							enable = false,
						},
						hover = {
							enable = true,
						},
					},
					settings = {
						jedi = {
							autoImportModules = { "numpy", "pandas", "curses" },
						},
					},
					capabilities = jedi_capabilities,
				})
				return
			elseif lsp_name == "tsserver" then -- skip tsserver since typescript-tools
				return
			end
			-- Default to use factory config for server(s) that doesn't include a spec
			nvim_lsp[lsp_name].setup(opts)
			return
		elseif type(custom_handler) == "function" then
			--- Case where language server requires its own setup
			--- Make sure to call require("lspconfig")[lsp_name].setup() in the function
			--- See `clangd.lua` for example.
			custom_handler(opts)
		elseif type(custom_handler) == "table" then
			nvim_lsp[lsp_name].setup(vim.tbl_deep_extend("force", opts, custom_handler))
		else
			vim.notify(
				string.format(
					"Failed to setup [%s].\n\nServer definition under `completion/servers` must return\neither a fun(opts) or a table (got '%s' instead)",
					lsp_name,
					type(custom_handler)
				),
				vim.log.levels.ERROR,
				{ title = "nvim-lspconfig" }
			)
		end
	end

	-- https://github.com/neovim/neovim/issues/30985 rust analyzer bad
	for _, method in ipairs({ "textDocument/diagnostic", "workspace/diagnostic" }) do
		local default_diagnostic_handler = vim.lsp.handlers[method]
		vim.lsp.handlers[method] = function(err, result, context, config)
			if err ~= nil and err.code == -32802 then
				return
			end
			return default_diagnostic_handler(err, result, context, config)
		end
	end

end
