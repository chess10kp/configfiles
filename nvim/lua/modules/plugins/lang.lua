local lang = {}

lang["seblyng/roslyn.nvim"] = {
	enabled = true,
	ft = { "cs", "razor" },
	---@module 'roslyn.config'
	---@type RoslynNvimConfig
	dependencies = {
		"tris203/rzls.nvim",
		config = true,
	},
	opts = {
		-- your configuration comes here; leave empty for default settings
		-- NOTE: You must configure `cmd` in `config.cmd` unless you have installed via mason
	},
	config = function()
		local mason_registry = require("mason-registry")

		---@type string[]
		local cmd = {}

		local roslyn_package = mason_registry.get_package("roslyn")
		if roslyn_package:is_installed() then
			vim.list_extend(cmd, {
				"dotnet",
				vim.fs.joinpath(
					roslyn_package:get_install_path(),
					"libexec",
					"Microsoft.CodeAnalysis.LanguageServer.dll"
				),
				"--stdio",
				"--logLevel=Information",
				"--extensionLogDirectory=" .. vim.fs.dirname(vim.lsp.get_log_path()),
			})

			local rzls_package = mason_registry.get_package("rzls")
			if rzls_package:is_installed() then
				local rzls_path = vim.fs.joinpath(rzls_package:get_install_path(), "libexec")
				table.insert(
					cmd,
					"--razorSourceGenerator=" .. vim.fs.joinpath(rzls_path, "Microsoft.CodeAnalysis.Razor.Compiler.dll")
				)
				table.insert(
					cmd,
					"--razorDesignTimePath="
						.. vim.fs.joinpath(rzls_path, "Targets", "Microsoft.NET.Sdk.Razor.DesignTime.targets")
				)
			end
		end
		require("roslyn").setup({
			cmd = cmd,
			config = {
				-- the rest of your Roslyn configuration
				handlers = require("rzls.roslyn_handlers"),
			},
		})
	end,
	-- https://github.com/tris203/rzls.nvim
	init = function()
		-- We add the Razor file types before the plugin loads.
		vim.filetype.add({
			extension = {
				razor = "razor",
				cshtml = "razor",
			},
		})
	end,
}
lang["GustavEikaas/easy-dotnet.nvim"] = {
	enabled = true,
	ft = "cs",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
	lazy = true,
	config = function()
		local function get_secret_path(secret_guid)
			local path = ""
			local home_dir = vim.fn.expand("~")
			if require("easy-dotnet.extensions").isWindows() then
				local secret_path = home_dir
					.. "\\AppData\\Roaming\\Microsoft\\UserSecrets\\"
					.. secret_guid
					.. "\\secrets.json"
				path = secret_path
			else
				local secret_path = home_dir .. "/.microsoft/usersecrets/" .. secret_guid .. "/secrets.json"
				path = secret_path
			end
			return path
		end
		local dotnet = require("easy-dotnet")
		-- Options are not required
		dotnet.setup({
			--Optional function to return the path for the dotnet sdk (e.g C:/ProgramFiles/dotnet/sdk/8.0.0)
			-- easy-dotnet will resolve the path automatically if this argument is omitted, for a performance improvement you can add a function that returns a hardcoded string
			-- You should define this function to return a hardcoded path for a performance improvement 🚀
			picker = "fzf",
			get_sdk_path = get_sdk_path,
			---@type TestRunnerOptions
			test_runner = {
				---@type "split" | "float" | "buf"
				viewmode = "float",
				enable_buffer_test_execution = true, --Experimental, run tests directly from buffer
				noBuild = true,
				noRestore = true,
				icons = {
					passed = "",
					skipped = "",
					failed = "",
					success = "",
					reload = "",
					test = "",
					sln = "󰘐",
					project = "󰘐",
					dir = "",
					package = "",
				},
				mappings = {
					run_test_from_buffer = { lhs = "<leader>r", desc = "run test from buffer" },
					filter_failed_tests = { lhs = "<leader>fe", desc = "filter failed tests" },
					debug_test = { lhs = "<leader>d", desc = "debug test" },
					go_to_file = { lhs = "g", desc = "got to file" },
					run_all = { lhs = "<leader>R", desc = "run all tests" },
					run = { lhs = "<leader>r", desc = "run test" },
					peek_stacktrace = { lhs = "<leader>p", desc = "peek stacktrace of failed test" },
					expand = { lhs = "o", desc = "expand" },
					expand_node = { lhs = "E", desc = "expand node" },
					expand_all = { lhs = "-", desc = "expand all" },
					collapse_all = { lhs = "W", desc = "collapse all" },
					close = { lhs = "q", desc = "close testrunner" },
					refresh_testrunner = { lhs = "<C-r>", desc = "refresh testrunner" },
				},
				--- Optional table of extra args e.g "--blame crash"
				additional_args = {},
			},
			new = {
				project = {
					prefix = "sln", -- "sln" | "none"
				},
			},
			---@param action "test" | "restore" | "build" | "run"
			terminal = function(path, action, args)
				local commands = {
					run = function()
						return string.format("dotnet run --project %s %s", path, args)
					end,
					test = function()
						return string.format("dotnet test %s %s", path, args)
					end,
					restore = function()
						return string.format("dotnet restore %s %s", path, args)
					end,
					build = function()
						return string.format("dotnet build %s %s", path, args)
					end,
					watch = function()
						return string.format("dotnet watch --project %s %s", path, args)
					end,
				}
				local command = commands[action]() .. "\r"
				vim.cmd("vsplit")
				vim.cmd("term " .. command)
			end,
			secrets = {
				path = get_secret_path,
			},
			csproj_mappings = true,
			fsproj_mappings = true,
			auto_bootstrap_namespace = {
				--block_scoped, file_scoped
				type = "block_scoped",
				enabled = true,
			},
			-- choose which picker to use with the plugin
			-- possible values are "telescope" | "fzf" | "snacks" | "basic"
			-- if no picker is specified, the plugin will determine
			-- the available one automatically with this priority:
			-- telescope -> fzf -> snacks ->  basic
			picker = "telescope",
			background_scanning = true,
		})
		-- Example command
		vim.api.nvim_create_user_command("Secrets", function()
			dotnet.secrets()
		end, {})
		-- Example keybinding
		vim.keymap.set("n", "<C-p>", function()
			dotnet.run_project()
		end)
	end,
}
lang["ray-x/go.nvim"] = {
	enabled = false,
	lazy = true,
	dependencies = {
		"ray-x/guihua.lua",
		"neovim/nvim-lspconfig",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("go").setup()
	end,
	event = { "CmdlineEnter" },
	ft = { "go", "gomod" },
	build = ':lua require("go.install").update_all_sync()',
}
lang["pmizio/typescript-tools.nvim"] = {
	lazy = true,
	ft = { "javascript", "typescript", "typescriptreact", "javascriptreact" },
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	opts = {},
	config = require("lang.typescript-tools"),
}
lang["OlegGulevskyy/better-ts-errors.nvim"] = {
	lazy = true,
	ft = { "javascript", "typescript", "typescriptreact", "javascriptreact" },
	dependencies = { "MunifTanjim/nui.nvim" },
}
lang["mrcjkb/haskell-tools.nvim"] = {
	enabled = true,
	lazy = true,
	ft = { "haskell", "cabal", "lhaskell", "cabalproject" },
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	config = require("lang.haskell-tools"),
}

lang["nvim-java/nvim-java"] = {
  enabled = false,
	lazy = true,
	ft = "java",
	dependencies = { "nvim-lspconfig" },
	config = function()
		require("java").setup()

		local jdtcfg = {
			settings = {
				java = { signatureHelp = { enabled = true }, contentProvider = { preferred = "fernflower" } },
			},
			on_init = function(client)
				if client.config.settings then
					client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
				end
			end,
		}

		vim.lsp.config.jdtls.setup(jdtcfg)
	end,
}
lang["luckasRanarison/tailwind-tools.nvim"] = {
	enabled = false,
	lazy = true,
	name = "tailwind-tools",
	ft = { "typescriptreact", "javascriptreact" },
	build = ":UpdateRemotePlugins",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-telescope/telescope.nvim", -- optional
	},
	opts = {}, -- your configuration
}
lang["esmuellert/nvim-eslint"] = {
	enabled = true,
	lazy = true,
	config = function()
		require("nvim-eslint").setup({})
	end,
	ft = { "typescriptreact", "javascriptreact" },
}
return lang
