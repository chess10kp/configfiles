vim.cmd([[
highlight StatusLine guibg=NONE ctermbg=NONE
highlight TabLine guibg=NONE ctermbg=NONE guifg=#888888 ctermfg=8
highlight TabLineSel guibg=NONE ctermbg=NONE guifg=#ffffff ctermfg=15
highlight TabLineFill guibg=NONE ctermbg=NONE

]])
-- vim.o.statusline = table.concat({
--    '%4* %<%t %*',         -- Full path
--    '%2* %*',          -- Modified flag
--    '%1* %=  %*',        -- Current line
-- }, '')
--
vim.cmd([[ 
function! BufferLine() abort
 let s = ''
 for i in range(1, bufnr('$'))
   if bufexists(i) && buflisted(i)
     let s .= '%'.i.'T'
     if i == bufnr('%')
       let s .= '%#TabLineSel#'
     else
       let s .= '%#TabLine#'
     endif
     let s .= ' '.fnamemodify(bufname(i), ':t').' '
   endif
 endfor
 return s
endfunction

set tabline=%!BufferLine()
]])
