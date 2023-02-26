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

function map(mode, key, remap, opts)
        local options = {noremap = true}
        if opts then
                options = vim.tbl_extend("force", options, opts)
        end
        vim.api.nvim_set_keymap(mode,key,remap,options)
end

nmap("<C-p>", '"+p')
vmap("<C-c>", '"+y')

nmap( "<leader>e", vim.cmd.Explore)
nmap("<leader>w", vim.cmd.w)
nmap("<leader>q", vim.cmd.q)
nmap("<leader>s",vim.cmd.so)

--terminal keymaps

nmap( "<C-b>", vim.cmd.ToggleTerm)
tmap( "<C-b>", vim.cmd.ToggleTerm)

 local builtin = require('telescope.builtin')
 nmap('<leader>fg',builtin.live_grep)
 nmap('<leader>fb', builtin.buffers)
 nmap('<leader>fh', builtin.help_tags)
nmap('<leader>ff', builtin.find_files)
vim.api.nvim_set_keymap(
  "n",
  "<leader>e",
  ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
  { noremap = true }
)
