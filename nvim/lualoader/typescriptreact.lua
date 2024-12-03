---@diagnostic disable: undefined-field
local ls = require("luasnip")

local util = require("core.util")

local newline = util.newline_node
local create_snippet = util.create_snippet
local make_snip = util.make_snip

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local sn = ls.snippet_node
local f = ls.function_node

local fmt = require("luasnip.extras.fmt").fmt

return {
	s("uss", {
		t("const ["),
		i(1, ""),
		t(", set"),
		f(function(args)
			return args[1][1]:gsub("^%l", string.upper)
		end, { 1 }),
		c(2, {
			sn(nil, {
				t("] = useState("),
				i(1, ""),
				t(")"),
			}),
			sn(nil, {
				t("] = useState<"),
				i(1, ""),
				t(">("),
				i(2, ""),
				t(")"),
			}),
		}),
	}),
	s("<", {
		t("< "),
		c(1, {
			sn(nil, {
				i(1, ""),
				t(" "),
				c(2, {
					sn(nil, {
						t('className="'),
            i(1, ""),
						t('"'),
					}),
					i(1, ""),
				}),
				t(">"),
				c(3, {
					sn(nil, {
						i(1, ""),
						t("</"),
					}),
					sn(nil, {
						newline(),
						i(1, ""),
						newline(),
						t("</"),
					}),
				}),
				f(function(args)
					return args[1][1]
				end, { 1 }),
				t(">"),
			}),
			sn(nil, {
				i(1, ""),
        t(" "),
				c(2, {
					sn(nil, {
						t('className="'),
            i(1, ""),
						t('"'),
					}),
					i(1, ""),
				}),
				t("/>"),
			}),
		}),
	}),
}, {
	create_snippet("clg", "console.log({})"),
	s(
		"tsrafc",
		fmt(
			[[
      type <>Props = {} 
      const <> = ({<>} : {<>}) =>> {
        return (
          <>
        )
      }
      ]],
			{
				f(function(args)
					return args[1][1]
				end, { 1 }),
				i(1, "el"),
				i(2, "props"),
				i(3, "{}"),
				i(4, "<div></div>"),
			},
			{
				delimiters = "<>",
			}
		)
	),
}
