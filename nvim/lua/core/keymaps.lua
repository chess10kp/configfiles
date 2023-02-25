vim.g.mapleader = ";"
function nmap(key, action)
        return vim.keymap.set('n',key,action)
end
function imap(key, action)
        return vim.keymap.set('i',key,action)
end
function vmap(key, action)
        return vim.keymap.set('v',key,action)
end
function tmap(key, action)
        return vim.keymap.set('t',key,action)
end



nmap( "<leader>e", vim.cmd.Explore)
nmap("<leader>w", vim.cmd.w)
nmap("<leader>q", vim.cmd.q)
nmap("<leader>s",vim.cmd.so)

--terminal keymaps

nmap( "<leader>a", vim.cmd.ToggleTerm)
function _G.set_terminal_keymaps()
    local opts = {buffer = 0}
    vim.keymap.set('t', '<C-w>', [[[<Cmd>wincmd k<CR>]], opts)
end


