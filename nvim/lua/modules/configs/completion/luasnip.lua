return function()
	local snippet_path = vim.fn.stdpath("config") .. "/snips/"
	if not vim.tbl_contains(vim.opt.rtp:get(), snippet_path) then
		vim.opt.rtp:append(snippet_path)
	end

	require("luasnip").config.set_config({
		history = true,
		update_events = "TextChanged,TextChangedI",
		delete_check_events = "TextChanged,InsertLeave",
		enable_autosnippets = true,
	})
	local ls = require("luasnip") --{{{
	local s = ls.s --> snippet
	local i = ls.i --> insert node
	local t = ls.t --> text node

	local d = ls.dynamic_node
	local c = ls.choice_node
	local f = ls.function_node
	local sn = ls.snippet_node

	local fmt = require("luasnip.extras.fmt").fmt
	local rep = require("luasnip.extras").rep

	require("luasnip.loaders.from_lua").lazy_load({ paths = { "~/.config/nvim/lualoader/" } })
	require("luasnip.loaders.from_vscode").lazy_load()
	-- require("luasnip.loaders.from_snipmate").lazy_load()

local ls = require("luasnip")
vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-K>", function() ls.jump(-1) end, {silent = true})

ls.filetype_extend("typescriptreact", {"javascriptreact", "javascript", "typescript"})
ls.filetype_extend("typescript", {"javascriptreact", "javascript", "typescriptreact"})
ls.filetype_extend("javascriptreact", {"javascript", "typescript", "typescriptreact"})
  
end
