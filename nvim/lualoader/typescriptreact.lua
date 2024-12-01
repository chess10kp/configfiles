local ls = require("luasnip")

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
      })
		}),
	}),
	s("<", {
		t("<"),
		i(1, "tag"),
		t(" "),
		c(2, {
			i(1, ""),
			sn(nil, {
				t('className="'),
				i(1, ""),
				t('"'),
			}),
		}),
		t(">"),
		c(3, {
			sn(nil, {
				i(1, ""),
			}),
			sn(nil, {
				t({ "", "\t<" }),
				i(1, ""),
				t({ "", "" }),
			}),
		}),
		t("</"),
		f(function(args) -- Function node to mirror the tag name
			return args[1][1]
		end, { 1 }),
		t(">"),
	}),
	s("<s", {
		t("<"),
		i(1, ""),
		t(" "),
		i(2, ""),
		t("/>"),
	}),
}, {
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
	s(
		"clg",
		fmt(
			[[
      console.log(<>)
      ]],
			{
				i(1, "el"),
			},
			{
				delimiters = "<>",
			}
		)
	),
}
