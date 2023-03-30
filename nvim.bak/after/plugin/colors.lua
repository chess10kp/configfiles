function Colorscheme(color)
    color = color or 'tokyonight-storm'
    vim.cmd.colorscheme(colorscheme)

    vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
    vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})

end

Colorscheme()

