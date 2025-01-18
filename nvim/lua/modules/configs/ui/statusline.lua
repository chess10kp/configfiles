-- vim.o.statusline = table.concat({
--     '%4* %<%t %*',        -- Full path
--     '%2*  %*',          -- Modified flag
--     '%1* %=  %*',      -- Current line
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

" set tabline=%!BufferLine()
]])
