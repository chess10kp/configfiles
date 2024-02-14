
return function ()
require("gruvbox").setup({
  undercurl = true,
  underline = false,
  bold = true,
  italic = {
    strings = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = true,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = true,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  overrides = {
      BufferLineFill = {bg = "#282828"},
      CursorLine = {bg = "None"},
      SignColumn = {bg = "#0e1419"},
      TabLineFill = {bg = "#0e1419"},
      TabLineSel = {bg = "#0e1419"},
  },
  dim_inactive = false,
  transparent_mode = false,
    palette_overrides = {
        dark0 = "#0e1419",
    }
})
end
