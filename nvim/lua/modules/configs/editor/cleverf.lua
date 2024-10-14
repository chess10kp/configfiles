return function()
	vim.api.nvim_set_hl(0, "CleverChar", { bold = true, fg = "Orange", bg = "NONE", ctermfg = "Red", ctermbg = "NONE" })
	vim.cmd([[
  let g:clever_f_mark_direct = 1
  let g:clever_f_timeout_ms = 1500
  let g:clever_f_highlight_timeout_ms = 200
  let g:clever_f_across_no_line = 1
  let g:clever_f_mark_char_color = "CleverChar"
  let g:clever_f_mark_direct_color = "CleverChar"
  ]])
end
