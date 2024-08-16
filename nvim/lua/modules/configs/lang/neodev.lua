return function()
	require("neodev").setup()

	-- require("lspconfig").lua_ls.setup({
	-- 	on_attach = function()
	-- 		require("lsp_signature").on_attach({
	-- 			bind = true,
	-- 			use_lspsaga = true,
	-- 			floating_window = false,
	-- 			fix_pos = true,
	-- 			hint_enable = true,
	-- 			hi_parameter = "Search",
	-- 			handler_opts = {
	-- 				border = "double",
	-- 			},
	-- 		})
	-- 	end,
	-- 	settings = {
	-- 		Lua = {
	-- 			diagnostics = {
	-- 				globals = { "vim" },
	-- 				disable = { "different-requires" },
	-- 			},
	-- 			workspace = {
	-- 				library = {
	-- 					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
	-- 					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
	-- 				},
	-- 				maxPreload = 100000,
	-- 				preloadFileSize = 10000,
	-- 			},
	-- 			format = { enable = true },
	-- 			telemetry = { enable = true },
	-- 			-- Do not override treesitter lua highlighting with lua_ls's highlighting
	-- 			semantic = { enable = false },
	-- 		},
	-- 	},
	-- })
end
