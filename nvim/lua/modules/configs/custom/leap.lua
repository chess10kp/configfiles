--require('leap').create_default_mappings()        

vim.api.nvim_set_keymap("n", "s", '<Plug>(leap)' , {})
vim.api.nvim_set_keymap("n", "S", '<Plug>(leap-backward)', {})
