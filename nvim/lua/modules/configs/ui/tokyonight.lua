return function()
	require("tokyonight").setup({
		-- your configuration comes here
		-- or leave it empty to use the default settings
		style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
		light_style = "day", -- The theme is used when the background is set to light
		transparent = true, -- Enable this to disable setting the background color
		terminal_colors = true, -- Configure the colors used when opening a `:terminal`
		styles = {
			-- Style to be applied to different syntax groups
			-- Value is any valid attr-list value for `:help nvim_set_hl`
			comments = { italic = true },
			keywords = { italic = true },
			functions = {},
			variables = {},
			-- Background styles. Can be "dark", "transparent" or "normal"
			sidebars = "transparent", -- style for sidebars, see below
			floats = "dark", -- style for floating windows
		},
		sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
		day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
		hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
		dim_inactive = false, -- dims inactive windows
		lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

		on_highlights = function(hl, c)
			local prompt = "#2d3149"
			hl.TelescopeNormal = {
				bg = "none",
				fg = c.fg_dark,
			}
			hl.TelescopeSelection = {
				bg = "#7aa2f7",
				fg = c.bg_dark,
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
			hl.BufferOffset = {
				bg = "none",
				fg = c.bg_dark,
			}
			hl.BufferCurrent = {
				bg = "none",
				fg = c.bg_dark,
			}
			hl.StatusLine = {
				bg = "none",
				fg = c.bg_light,
			}
			hl.BufferLineFill = {
				bg = "none",
				fg = c.bg_light,
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
end

-- none = "NONE",
--  bg_dark = "#1f2335",
--  bg = "#24283b",
--  bg_highlight = "#292e42",
--  terminal_black = "#414868",
--  fg = "#c0caf5",
--  fg_dark = "#a9b1d6",
--  fg_gutter = "#3b4261",
--  dark3 = "#545c7e",
--  comment = "#565f89",
--  dark5 = "#737aa2",
--  blue0 = "#3d59a1",
--  blue = "#7aa2f7",
--  cyan = "#7dcfff",
--  blue1 = "#2ac3de",
--  blue2 = "#0db9d7",
--  blue5 = "#89ddff",
--  blue6 = "#b4f9f8",
--  blue7 = "#394b70",
--  magenta = "#bb9af7",
--  magenta2 = "#ff007c",
--  purple = "#9d7cd8",
--  orange = "#ff9e64",
--  yellow = "#e0af68",
--  green = "#9ece6a",
--  green1 = "#73daca",
--  green2 = "#41a6b5",
--  teal = "#1abc9c",
--  red = "#f7768e",
--  red1 = "#db4b4b",
--  git = { change = "#6183bb", add = "#449dab", delete = "#914c54" },
--  gitSigns = {
--    add = "#266d6a",
--    change = "#536c9e",
--    delete = "#b2555b",
