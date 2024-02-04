vim.o.statusline = table.concat({
    -- '%1* %n %*',          -- Buffer number
    -- '%5* %{&ff} %*',      -- File format
    '%3* %y %*',          -- File type
    '%4* %<%F %*',        -- Full path
    '%2* %m %*',          -- Modified flag
    '%1* %= %5l %*',      -- Current line
}, '')

vim.cmd([[
set tabline=%!MyTabLine()  " custom tab pages line
function! MyTabLine()
  let s = ''
  " loop through each tab page
  for i in range(tabpagenr('$'))
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#' " WildMenu
    else
      let s .= '%#Title#'
    endif
    " set the tab page number (for mouse clicks)
    let s .= '%' . (i + 1) . 'T '
    " set page number string
    let s .= i + 1 . ''
    " get buffer names and statuses
    let n = ''  " temp str for buf names
    let m = 0   " &modified counter
    let buflist = tabpagebuflist(i + 1)
    " loop through each buffer in a tab
    " let n .= fnamemodify(bufname(buflist[tabpagewinnr(i + 1) - 1]), ':t')
    let n = substitute(n, ', $', '', '')
    " add modified label
    if m > 0
      let s .= '+'
      " let s .= '[' . m . '+]'
    endif
    if i + 1 == tabpagenr()
      let s .= ' %#TabLineSel#'
    else
      let s .= ' %#TabLine#'
    endif
    " add buffer names
    if n == ''
      let s.= '[New]'
    else
      let s .= n
    endif
    " switch to no underlining and add final space
    let s .= ' '
  endfor
  let s .= '%#TabLineFill#%T'
  return s
endfunction
]])

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

