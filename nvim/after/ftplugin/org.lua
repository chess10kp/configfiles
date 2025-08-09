vim.o.tabstop = 8
vim.opt.conceallevel = 2
vim.opt.concealcursor = "nc"

vim.keymap.set("n", "<CR>", function()
	require("orgmode").action("org_mappings.meta_return")
end)

vim.keymap.set("n", "<S-Tab>", function()
	require("orgmode").action("org_mappings.global_cycle")
end)
