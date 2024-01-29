return function()
	local conditions = require("heirline.conditions")
	local utils = require("heirline.utils")

	local function getColors()
		return {
			bright_bg = utils.get_highlight("Folded").bg,
			bright_fg = utils.get_highlight("Folded").fg,
			red = utils.get_highlight("DiagnosticError").fg,
			dark_red = utils.get_highlight("DiffDelete").bg,
			green = utils.get_highlight("String").fg,
			blue = utils.get_highlight("Function").fg,
			gray = utils.get_highlight("NonText").fg,
			orange = utils.get_highlight("Constant").fg,
			purple = utils.get_highlight("Statement").fg,
			cyan = utils.get_highlight("Special").fg,
			diag_warn = utils.get_highlight("DiagnosticWarn").fg,
			diag_error = utils.get_highlight("DiagnosticError").fg,
			diag_hint = utils.get_highlight("DiagnosticHint").fg,
			diag_info = utils.get_highlight("DiagnosticInfo").fg,
		}
	end

	local Git = {
		condition = conditions.is_git_repo,

		init = function(self)
			self.has_changes = self.status_dict.added ~= 0
				or self.status_dict.removed ~= 0
				or self.status_dict.changed ~= 0
		end,

		hl = { fg = "orange" },

		{ -- git branch name
			provider = function(self)
				return " " .. self.status_dict.head
			end,
			hl = { bold = true },
		},
		-- You could handle delimiters, icons and counts similar to Diagnostics
		{
			condition = function(self)
				return self.has_changes
			end,
			provider = "(",
		},
		{
			provider = function(self)
				local count = self.status_dict.added or 0
				return count > 0 and ("+" .. count)
			end,
			hl = { fg = "git_add" },
		},
		{
			provider = function(self)
				local count = self.status_dict.removed or 0
				return count > 0 and ("-" .. count)
			end,
		},
		{
			provider = function(self)
				local count = self.status_dict.changed or 0
				return count > 0 and ("~" .. count)
			end,
			hl = { fg = "git_change" },
		},
		{
			condition = function(self)
				return self.has_changes
			end,
			provider = ")",
		},
	}
	local function getDiagnostics()
		local Diagnostics = {
			condition = conditions.has_diagnostics,
			static = {
				error_icon = "X",
				warn_icon = "!",
				info_icon = "i",
				hint_icon = "?",
			},
			init = function(self)
				self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
				self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
				self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
				self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
			end,

			update = { "DiagnosticChanged", "BufEnter" },

			{
				provider = "![",
			},
			{
				provider = function(self)
					-- 0 is just another output, we can decide to print it or not!
					return self.errors > 0 and (self.error_icon .. self.errors .. " ")
				end,
				hl = { fg = "diag_error" },
			},
			{
				provider = function(self)
					return self.warnings > 0 and (self.warn_icon .. self.warnings .. " ")
				end,
				hl = { fg = "diag_warn" },
			},
			{
				provider = function(self)
					return self.info > 0 and (self.info_icon .. self.info .. " ")
				end,
				hl = { fg = "diag_info" },
			},
			{
				provider = function(self)
					return self.hints > 0 and (self.hint_icon .. self.hints)
				end,
				hl = { fg = "diag_hint" },
			},
			{
				provider = "]",
			},
		}
		return Diagnostics
	end
	local function getCWD()
		local WorkDir = {
			provider = function()
				local cwd = vim.fn.getcwd(0)
				cwd = vim.fn.fnamemodify(cwd, ":~")
				if not conditions.width_percent_below(#cwd, 0.25) then
					cwd = vim.fn.pathshorten(cwd)
				end
				local trail = cwd:sub(-1) == "/" and "" or "/"
				return cwd .. trail
			end,
			hl = { fg = "blue", bold = true },
		}
		return WorkDir
	end
	local function getSearches()
		local SearchCount = {
			condition = function()
				return vim.v.hlsearch ~= 0 and vim.o.cmdheight == 0
			end,
			init = function(self)
				local ok, search = pcall(vim.fn.searchcount)
				if ok and search.total then
					self.search = search
				end
			end,
			provider = function(self)
				local search = self.search
				return string.format("[%d/%d]", search.current, math.min(search.total, search.maxcount))
			end,
		}
		return SearchCount
	end

	local function getFileInfo()
		local FileNameBlock = {
			-- let's first set up some attributes needed by this component and it's children
			init = function(self)
				self.filename = vim.api.nvim_buf_get_name(0)
			end,
			{ update = "BufEnter" },
		}
		-- We can now define some children separately and add them later

		local FileIcon = {
			init = function(self)
				local filename = self.filename
				local extension = vim.fn.fnamemodify(filename, ":e")
				self.icon, self.icon_color =
					require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
			end,
			provider = function(self)
				return self.icon and (self.icon .. " ")
			end,
			hl = function(self)
				return { fg = self.icon_color }
			end,
		}

		local FileName = {
			provider = function(self)
				-- first, trim the pattern relative to the current directory. For other
				-- options, see :h filename-modifers
				local filename = vim.fn.fnamemodify(self.filename, ":.")
				if filename == "" then
					return "No File Open"
				end
				-- now, if the filename would occupy more than 1/4th of the available
				-- space, we trim the file path to its initials
				-- See Flexible Components section below for dynamic truncation
				if not conditions.width_percent_below(#filename, 0.50) then
					filename = vim.fn.pathshorten(filename)
				end
				return filename
			end,
			hl = { fg = "green", bg = "None" },
			{ update = "BufEnter" },
		}

		local FileFlags = {
			{
				condition = function()
					return vim.bo.modified
				end,
				provider = "[+]",
				hl = { fg = "green" },
			},
			{
				condition = function()
					return not vim.bo.modifiable or vim.bo.readonly
				end,
				provider = "",
				hl = { fg = "orange" },

				{ update = "BufEnter" },
			},
		}

		-- Now, let's say that we want the filename color to change if the buffer is
		-- modified. Of course, we could do that directly using the FileName.hl field,
		-- but we'll see how easy it is to alter existing components using a "modifier"
		-- component

		local FileNameModifer = {
			hl = function()
				if vim.bo.modified then
					-- use `force` because we need to override the child's hl foreground
					return { fg = "cyan", bold = true, force = true }
				end
			end,
		}

		-- let's add the children to our FileNameBlock component
		FileNameBlock = utils.insert(
			FileNameBlock,
			utils.insert(FileNameModifer, FileName), -- a new table where FileName is a child of FileNameModifier
			FileFlags,
			-- FileIcon,
			{ update = "BufEnter" },
			{ provider = "%<" } -- this means that the statusline is cut here when there's not enough space
		)
		return FileNameBlock
	end

	-- local DAPMessages = {
	-- 	condition = function()
	-- 		local session = require("dap").session()
	-- 		return session ~= nil
	-- 	end,
	-- 	provider = function()
	-- 		return " " .. require("dap").status()
	-- 	end,
	-- 	hl = "Debug",
	-- 	-- see Click-it! section for clickable actions
	-- }

	local Align = { provider = "%=" }
	local Space = { provider = " " }

	local InactiveLine = {
		cond = conditions.is_not_active,
	}
	local SpecialStatusline = {
		condition = function()
			return conditions.buffer_matches({
				buftype = { "nofile", "prompt", "help", "quickfix", "telescope" },
				filetype = { "^.git", "fugitive" },
			})
		end,
		getCWD(),
		Align,
		hl = { bg = "None" },
	}
	local DefaultStatusline = {
		getFileInfo(),
		getDiagnostics(),
		Align,
		-- Git,
		Space,
		getCWD(),
		Space,
		getSearches(),
		hl = { bg = "None" },
	}

	local StatusLine = {
		fallthrough = false,
		SpecialStatusline,
		DefaultStatusline,
		hl = { bg = "None" },
	}

	local function setup_colors()
		return {
			bright_bg = utils.get_highlight("Folded").bg,
			bright_fg = utils.get_highlight("Folded").fg,
			red = utils.get_highlight("DiagnosticError").fg,
			dark_red = utils.get_highlight("DiffDelete").bg,
			green = utils.get_highlight("String").fg,
			blue = utils.get_highlight("Function").fg,
			gray = utils.get_highlight("NonText").fg,
			orange = utils.get_highlight("Constant").fg,
			purple = utils.get_highlight("Statement").fg,
			cyan = utils.get_highlight("Special").fg,
			diag_warn = utils.get_highlight("DiagnosticWarn").fg,
			diag_error = utils.get_highlight("DiagnosticError").fg,
			diag_hint = utils.get_highlight("DiagnosticHint").fg,
			diag_info = utils.get_highlight("DiagnosticInfo").fg,
		}
	end

	local TablineBufnr = {
		provider = function(self)
			return tostring(self.bufnr) .. ". "
		end,
		hl = { bg = "None" },
	}

	local TablineFileName = {
		provider = function(self)
			local filename = self.filename
			filename = filename == "" and "[No Name]" or vim.fn.fnamemodify(filename, ":t")
			filename = " " .. filename .. " "
			return filename
		end,
		hl = function(self)
			return { bold = self.is_active or self.is_visible, italic = true, bg = "None" }
		end,
	}
	local TablineFileFlags = {
		{
			condition = function(self)
				return vim.api.nvim_buf_get_option(self.bufnr, "modified")
			end,
			provider = "[+]",
			hl = { fg = "green", bg = "None" },
		},
		{
			condition = function(self)
				return not vim.api.nvim_buf_get_option(self.bufnr, "modifiable")
					or vim.api.nvim_buf_get_option(self.bufnr, "readonly")
			end,
			provider = function(self)
				if vim.api.nvim_buf_get_option(self.bufnr, "buftype") == "terminal" then
					return "  "
				else
					return ""
				end
			end,
			hl = { fg = "orange", bg = "None" },
		},
	}
	local TablineFileNameBlock = {
		init = function(self)
			self.filename = vim.api.nvim_buf_get_name(self.bufnr)
		end,
		hl = function(self)
			if self.is_active then
				return "TabLineSel"
			else
				return "TabLine"
			end
		end,
		TablineFileName,
		TablineFileFlags,
	}

	local BufferLine = utils.make_buflist(TablineFileNameBlock)
	local Tabline = { BufferLine, hl = { bg = "None" } }

	vim.api.nvim_create_augroup("Heirline", { clear = true })
	vim.api.nvim_create_autocmd("ColorScheme", {
		callback = function()
			utils.on_colorscheme(setup_colors)
		end,
		group = "Heirline",
	})

	require("heirline").setup({
		statusline = StatusLine,
		tabline = Tabline,
		opts = {
			colors = setup_colors(),
		},
	})
end
