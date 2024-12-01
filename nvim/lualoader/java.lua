---@diagnostic disable: undefined-field
local ls = require("luasnip")
local custom = require("core.util")
local snippeter = custom.make_snip_from_string

local s = ls.s
local i = ls.i
local t = ls.t
local f = ls.f
local c = ls.choice
local sn = ls.snippet_node -- luacheck:ignore
local fmt = require("luasnip.extras.fmt").fmt -- luacheck:ignore

return {
	snippeter("void", "void {} () {{\n\t{}\n}}"),
	snippeter("while", "while ({}) {{\n\t{}\n}}"),
	snippeter("fore", "for ({} {} : {}) {{\n\t{}\n}}"),
	snippeter("fori", "for (int {} = 0; {} < {}; ++{}) {{\n\t{}\n}}"),
	snippeter("class", "class {} {{\n\t{}\n}}"),
	snippeter("if", "if ({}) {{\n\t{}\n}}"),
  -- general for loop with choice nodes
  s("for", {
  c(1, {
    
  })
  })
}, {
	snippeter("println", "System.out.println({});"),
}
