local ls = require("luasnip")
local s = ls.snippet

local s = ls.s --> snippet
local i = ls.i --> insert node
local t = ls.t --> text node

local fmt = require("luasnip.extras.fmt").fmt

return {}, {
	s(
		"forl",
		fmt(
			[[ 
  for (<> = <>; <>; <>) {
     <>
  }]],
			{
				i(1, ""),
				i(2, ""),
				i(3, ""),
				i(4, ""),
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
		"divtag",
		fmt(
			[[
      <div class="{}">{}<div>
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
		"itag",
		fmt(
			[[
      <i class="{}">{}<i>
      ]],
			{
				i(1, ""),
				i(2, ""),
			},
			{
				delimiters = "{}",
			}
		)
	),
	s(
		"h1",
		fmt(
			[[
      <h1 class="{}">{}<h1>
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
