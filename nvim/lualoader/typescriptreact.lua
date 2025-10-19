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
		"tsrafce",
		fmt(
			[[
      import React from "react"
      type <>Props = {} 
      const <> = ({<>} : <>Props) =>> {
        return (
          <>
        )
      }
      export default <>
      ]],
			{
				f(function(args)
					return args[1][1]
				end, { 1 }),
				i(1, "name: string"),
				i(2, "props"),
				f(function(args)
					return args[1][1]
				end, { 1 }),
				i(100, ""),
				f(function(args)
					return args[1][1]
				end, { 1 }),
			},
			{
				delimiters = "<>",
			}
		)
	),
	s("uef", fmt([[
	useEffect(() =>> {{
		<>
	}}, [<>])
	]], {
		i(1, "// effect logic"),
		i(2, ""),
	}, { delimiters = "<>" })),

	-- ✅ useMemo
	s("umm", fmt([[
	const <> = useMemo(() =>> <> , [<>])
	]], {
		i(1, "memoizedValue"),
		i(2, "computeExpensiveValue()"),
		i(3, ""),
	}, { delimiters = "<>" })),

	-- ✅ useCallback
	s("ucb", fmt([[
	const <> = useCallback((<>) =>> {{
		<>
	}}, [<>])
	]], {
		i(1, "callback"),
		i(2, "args"),
		i(3, "// callback logic"),
		i(4, ""),
	}, { delimiters = "<>" })),

	s("urf", fmt([[
	const <> = useRef<<>>(<>)
	]], {
		i(1, "ref"),
		i(2, "HTMLDivElement"),
	}, { delimiters = "<>" })),
}
