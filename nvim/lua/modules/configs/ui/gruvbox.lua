return function()
	require("gruvbox").setup({
		undercurl = false,
		underline = false,
		bold = true,
		italic = {
			strings = false,
			comments = false,
			operators = false,
			folds = true,
		},
		strikethrough = true,
		invert_selection = false,
		invert_signs = false,
		invert_tabline = false,
		invert_intend_guides = true,
		inverse = true, -- invert background for search, diffs, statuslines and errors
		contrast = "", -- can be "hard", "soft" or empty string
		overrides = {
			-- CursorLine = {bg = "None"},
			SignColumn = { bg = "#0e1419" },
			Pmenu = { bg = "#0e1419" },
			NormalFloat = { bg = "#0e1419" },
			Delimiter = { fg = "#fabd2d" },
		},
		dim_inactive = false,
		transparent_mode = false,
		palette_overrides = {
			dark0 = "#0e1419",
		},
	})

  vim.cmd([[
  highlight StatusLine guibg=NONE ctermbg=NONE
  highlight TabLine guibg=NONE ctermbg=NONE guifg=#888888 ctermfg=8
  highlight TabLineSel guibg=NONE ctermbg=NONE guifg=#ffffff ctermfg=15
  highlight TabLineFill guibg=NONE ctermbg=NONE 
  ]])
end
