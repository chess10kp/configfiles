vim.g.mapleader = ";"
vim.keymap.set("n", "<leader>e", vim.cmd.Explore)

vim.keymap.set("n","<leader>w", vim.cmd.w)
vim.keymap.set("n","<leader>q", vim.cmd.q)


vim.keymap.set("n", "<leader>a", vim.cmd.ToggleTerm)
function _G.set_terminal_keymaps()
    local opts = {buffer = 0}
    vim.keymap.set('t', '<C-w>', [[[<Cmd>wincmd k<CR>]], opts)
end

