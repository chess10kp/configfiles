vim.g.mapleader = ";"
require("core.keymap_functions")

nmap("<C-p>", '"+p')
vmap("<C-c>", '"+y')

nmap( "<leader>e", vim.cmd.Explore)
nmap("<leader>w", vim.cmd.w)
nmap("<leader>q", vim.cmd.q)
nmap("<leader>s",vim.cmd.so)

--terminal keymaps

nmap( "<C-n>", vim.cmd.ToggleTerm)
tmap( "<C-n>", vim.cmd.ToggleTerm)

--telecope keymaps

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

nmap(';;', ':')

