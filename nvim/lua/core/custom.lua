vim.cmd([[
syntax enable
let g:vimtex_view_method = 'zathura'
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_compiler_method = 'latexmk'
]])

vim.opt.guicursor = "n-v-c-ci:block" --makes everything block cursor


