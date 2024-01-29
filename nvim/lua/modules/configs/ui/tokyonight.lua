return function()
	require("tokyonight").setup({
    on_colors = function() end,
		style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
		light_style = "day", -- The theme is used when the background is set to light
		transparent = false, -- Enable this to disable setting the background color
		terminal_colors = true, -- Configure the colors used when opening a `:terminal`
		styles = {
			-- Style to be applied to different syntax groups
			-- Value is any valid attr-list value for `:help nvim_set_hl`
			comments = { italic = true },
			keywords = { italic = true },
			functions = {},
			variables = {},
			-- Background styles. Can be "dark", "transparent" or "normal"
			sidebars = "dark", -- style for sidebars, see below
			floats = "dark", -- style for floating windows
		},
		sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
		day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
		hide_inactive_statusline = true, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
		dim_inactive = false, -- dims inactive windows
		lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

		on_highlights = function(hl, c)
			local prompt = "#2d3149"
      local bg = "#11111b"
			hl.TelescopeNormal = {
				bg = "none",
				fg = c.fg_dark,
			}
			hl.TelescopeMatching = {
				fg = c.yellow,
			}
			hl.TelescopeBorder = {
				bg = "none",
				fg = c.bg_dark,
			}
			hl.TelescopePromptNormal = {
				bg = "none",
			}
			hl.TelescopePromptBorder = {
				bg = "none",
				fg = prompt,
			}
			hl.TelescopePromptTitle = {
				bg = "none",
				fg = prompt,
			}
			hl.TelescopePreviewTitle = {
				bg = "none",
				fg = c.bg_dark,
			}
			hl.TelescopeResultsTitle = {
				bg = "none",
				fg = c.bg_dark,
			}
			hl.TelescopePreviewLine = {
				bg = "#a9b1d6",
				fg = c.bg_dark,
			}
			hl.WildMenu = {
				bg = "none",
				fg = c.bg_light,
			}
			hl.WilderPopupMenuSelectedAccent = {
				bg = "none",
				fg = c.bg_light,
			}
			hl.WilderMenuSelectedAccent = {
				bg = "none",
				fg = c.bg_light,
			}
			hl.WilderMenuAccent = {
				bg = "none",
				fg = c.bg_light,
			}
			hl.LineNr = {
				bg = "none",
				fg = c.green,
			}
			hl.WhichKeyValue = {
				bg = "none",
				fg = c.green,
			}
			hl.WhichKeyDesc = {
				bg = "none",
				fg = c.green,
			}
		end,
	})
  vim.o.cursorline = false
end
