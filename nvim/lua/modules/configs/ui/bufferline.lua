return function()
	local icons = { ui = require("modules.utils.icons").get("ui") }

	local opts = {
		options = {
			number = nil,
			modified_icon = icons.ui.Modified,
			buffer_close_icon = icons.ui.Close,
			left_trunc_marker = icons.ui.Left,
			right_trunc_marker = icons.ui.Right,
			max_name_length = 14,
			max_prefix_length = 13,
			tab_size = 15,
			color_icons = true,
			show_buffer_icons = false,
			show_buffer_close_icons = false,
            --get_element_icon = function(e)
                --return require('nvim-web-devicons').get_icon(e, {default=false})
            --end,
			show_close_icon = false,
			show_tab_indicators = false,
			enforce_regular_tabs = true,
			persist_buffer_sort = true,
			always_show_bufferline = true,
			separator_style = "thin",
			diagnostics = "nvim_lsp",
			--diagnostics_indicator = function(count)
				--return "(" .. count .. ")"
			--end,
			offsets = {
				{
					filetype = "NvimTree",
					text = "File Explorer",
					text_align = "center",
					padding = 1,
				},
				{
					filetype = "lspsagaoutline",
					text = "Lspsaga Outline",
					text_align = "center",
					padding = 1,
				},
			},
		},
		-- Change bufferline's highlights here! See `:h bufferline-highlights` for detailed explanation.
		--highlights = {
            --fill = {
                --fg = '<colour-value-here>',
                --bg = '<colour-value-here>',
            --},
            --background = {
                --fg = '<colour-value-here>',
                --bg = '<colour-value-here>'
            --},
            --tab = {
                --fg = '<colour-value-here>',
                --bg = '<colour-value-here>'
            --},
            --tab_selected = {
                --fg = tabline_sel_bg,
                --bg = '<colour-value-here>'
            --},
            --tab_close = {
                --fg = '<colour-value-here>',
                --bg = '<colour-value-here>'
            --},
            --close_button = {
                --fg = '<colour-value-here>',
                --bg = '<colour-value-here>'
            --},
            --close_button_visible = {
                --fg = '<colour-value-here>',
                --bg = '<colour-value-here>'
            --},
            --close_button_selected = {
                --fg = '<colour-value-here>',
                --bg = '<colour-value-here>'
            --},
            --buffer_visible = {
                --fg = '<colour-value-here>',
                --bg = '<colour-value-here>'
            --},
            --buffer_selected = {
                --fg = normal_fg,
                --bg = '<colour-value-here>',
                --bold = true,
                --italic = true,
            --},
        --},
	}

	if vim.g.colors_name == "catppuccin" then
		local cp = require("modules.utils").get_palette() -- Get the palette.

		local catppuccin_hl_overwrite = {
			highlights = require("catppuccin.groups.integrations.bufferline").get({
				styles = { "italic", "bold" },
				custom = {
					mocha = {
						-- Hint
						hint = { fg = cp.rosewater },
						hint_visible = { fg = cp.rosewater },
						hint_selected = { fg = cp.rosewater },
						hint_diagnostic = { fg = cp.rosewater },
						hint_diagnostic_visible = { fg = cp.rosewater },
						hint_diagnostic_selected = { fg = cp.rosewater },
					},
				},
			}),
		}

		opts = vim.tbl_deep_extend("force", opts, catppuccin_hl_overwrite)
	end

	require("bufferline").setup(opts)
end
