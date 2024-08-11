return function()
	local icons = {
		kind = require("modules.utils.icons").get("kind"),
		type = require("modules.utils.icons").get("type"),
		cmp = require("modules.utils.icons").get("cmp"),
	}
	local t = function(str)
		return vim.api.nvim_replace_termcodes(str, true, true, true)
	end

	local border = function(hl)
		return {
			{ "┌", hl },
			{ "─", hl },
			{ "┐", hl },
			{ "│", hl },
			{ "┘", hl },
			{ "─", hl },
			{ "└", hl },
			{ "│", hl },
		}
	end

	local compare = require("cmp.config.compare")
	compare.lsp_scores = function(entry1, entry2)
		local diff
		if entry1.completion_item.score and entry2.completion_item.score then
			diff = (entry2.completion_item.score * entry2.score) - (entry1.completion_item.score * entry1.score)
		else
			diff = entry2.score - entry1.score
		end
		return (diff < 0)
	end

	local cmp = require("cmp")
	cmp.setup({
		enabled = true,
		preselect = cmp.PreselectMode.Item,

		window = {
			completion = {
				-- border = border("PmenuBorder"),
				winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,Search:PmenuSel",
				scrollbar = false,
			},
			documentation = {
				max_height = 4,
				border = border("CmpDocBorder"),
				winhighlight = "Normal:CmpDoc",
			},
		},
		sorting = {
			priority_weight = 2,
			comparators = {
				require("copilot_cmp.comparators").prioritize,
				require("copilot_cmp.comparators").score,
				-- require("cmp_tabnine.compare"),
				-- compare.offset, -- Items closer to cursor will have lower priority
				compare.exact,
				-- compare.scopes,
				compare.lsp_scores,
				compare.sort_text,
				compare.score,
				require("cmp-under-comparator").under,
				compare.kind,
				compare.length,
				compare.order,
			},
		},
		formatting = {
			fields = { "abbr", "kind", "menu" },
			format = function(entry, vim_item)
				local lspkind_icons = vim.tbl_deep_extend("force", icons.kind, icons.type, icons.cmp)
				-- load lspkind icons
				vim_item.kind =
					string.format(" %s  %s", lspkind_icons[vim_item.kind] or icons.cmp.undefined, vim_item.kind or "")

				vim_item.menu = setmetatable({
					cmp_tabnine = "[TN]",
					copilot = "[CPLT]",
					buffer = "[BUF]",
					orgmode = "[ORG]",
					nvim_lsp = "[LSP]",
					nvim_lua = "[LUA]",
					path = "[PATH]",
					tmux = "[TMUX]",
					treesitter = "[TS]",
					luasnip = "[SNIP]",
					spell = "[SPELL]",
				}, {
					__index = function()
						return "[BTN]" -- builtin/unknown source names
					end,
				})[entry.source.name]

				local label = vim_item.abbr
				local truncated_label = vim.fn.strcharpart(label, 0, 80)
				if truncated_label ~= label then
					vim_item.abbr = truncated_label .. "..."
				end

				return vim_item
			end,
		},
		matching = {
			disallow_partial_fuzzy_matching = false,
			disallow_fullfuzzy_matching = false,
			disallow_fuzzy_matching = false,
			disallow_prefix_unmatching = false,
			disallow_partial_matching = true,
		},
		performance = {
			confirm_resolve_timeout = 100,
			fetching_timeout = 100,
			async_budget = 1,
			max_view_entries = 5,
			debounce = 100,
			throttle = 0,
		},
		-- You can set mappings if you want
		mapping = cmp.mapping.preset.insert({
			["<CR>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
			["<C-p>"] = cmp.mapping.select_prev_item(),
			["<C-n>"] = cmp.mapping.select_next_item(),
			["<C-S-d>"] = cmp.mapping.scroll_docs(-4),
			["<C-S-f>"] = cmp.mapping.scroll_docs(4),
			["<C-e>"] = cmp.mapping.abort(),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif require("luasnip").jumpable(-1) then
					vim.fn.feedkeys(t("<Plug>luasnip-jump-prev"), "")
				else
					fallback()
				end
			end, { "i", "s" }),
		}),
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		sources = {
			{ name = "path" },
			{ name = "luasnip" },
			{
				name = "nvim_lsp",
				max_item_count = 50,
				entry_filter = function(entry, ctx)
					local kind = require("cmp.types").lsp.CompletionItemKind[entry:get_kind()] ~= "snippet"
					return kind
				end,
			},
			{ name = "nvim_lua" },
			{ name = "treesitter" },
			{ name = "spell" },
			{ name = "tmux" },
			{ name = "buffer", max_item_count = 1 },
			{ name = "latex_symbols" },
			{ name = "copilot" },
		},
		experimental = {
			ghost_text = {
				hl_group = "Whitespace",
			},
		},
	})
end
