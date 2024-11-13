local ls = require("luasnip")

local s = ls.s --> snippet
local t = ls.t --> text node
local i = ls.i --> insert node

local fmt = require("luasnip.extras.fmt").fmt

return {
	s("t", {
		t("<"),
		i(1, "tag"),
		t(' className="'),
		i(2, ""),
		t('"'),
		t(">"),
		i(2, "content"),
		t("</"),
		f(function(args) -- Function node to mirror the tag name
			return args[1][1]
		end, { 1 }),
		t(">"),
	}),
}, {
	s(
		"forl",
		fmt(
			[[ 
  for (int <> = <>; <>; <>) {
     <>
  }]],
			{
				i(1, "i"),
				i(2, "0"),
				i(3, "i < array.length"),
				i(4, "i++"),
				i(5, ""),
			},
			{ delimiters = "<>" }
		)
	),
	s(
		"forinl",
		fmt(
			[[ 
  for (const <> in <>) {
     <>
  }]],
			{
				i(1, "value"),
				i(2, "arr"),
				i(3, ""),
			},
			{ delimiters = "<>" }
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
	s(
		"h1",
		fmt(
			[[
      <h1 className="{}">{}</h1>
      ]],
			{
				i(1, "classname"),
				i(2, ""),
			},
			{
				delimiters = "{}",
			}
		)
	),
	s(
		"h2",
		fmt(
			[[
      <h2 className="{}">{}</h1>
      ]],
			{
				i(1, "classname"),
				i(2, ""),
			},
			{
				delimiters = "{}",
			}
		)
	),
}
