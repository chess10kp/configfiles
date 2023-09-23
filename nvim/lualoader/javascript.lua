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


return {}, {
	s(
		"clg",
		fmt(
			[[
      console.log(<>)
      ]],
			{
				i(1, "el"),
			},
      -- more snips here
			{
				delimiters = "<>",
			}
		)
	),

}
