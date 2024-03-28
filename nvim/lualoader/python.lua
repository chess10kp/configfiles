local ls = require("luasnip")
local s = ls.snippet

local s = ls.s --> snippet
local i = ls.i --> insert node
local t = ls.t --> text node

-- local d = ls.dynamic_node
-- local c = ls.choice_node
-- local f = ls.function_node
-- local sn = ls.snippet_node

local fmt = require("luasnip.extras.fmt").fmt
-- local rep = require("luasnip.extras").rep

return {
	s(
		"if",
		fmt(
			[[
    if <> : 
        <>
    ]],
			{
				i(1, "statement"),
				i(2, "pass"),
			},
			{
				delimiters = "<>",
			}
		)
	),
}, {
	s(
		"ifelse",
		fmt(
			[[
      if <> : 
          <>
      elif <>:
          <>
     ]],
			{
				i(1, "statement"),
				i(2, "pass"),
				i(3, "statement"),
				i("4", "pass"),
			},
			{
				delimiters = "<>",
			}
		)
	),
	s(
		"prnt",
		fmt(
			[[
      print({})
      ]],
			{
				i(1, "expression"),
			},
			{
				delimiters = "{}",
			}
		)
	),
	s(
		"def ",
		fmt(
			[[
        def <>(<>): 
            <>
        ]],
			{
				i(1, "function"),
				i(2, ""),
				i(3, "pass"),
			},
			{
				delimiters = "<>",
			}
		)
	),
	s(
		"ifc",
		fmt(
			[[
    if <>:
      <>
    ]],
			{ i(1, "cond"), i(2, "stmt") },
			{ delimiters = "<>" }
		)
	),
}
