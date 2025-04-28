---@diagnostic disable: undefined-field
local ls = require("luasnip")
local custom = require("core.util")
local create_snippet = custom.create_snippet
local node_creator = custom.snippet_node_from_string

local s = ls.s
local i = ls.i
local t = ls.t
local f = ls.f
local c = ls.c
local sn = ls.snippet_node -- luacheck:ignore
local fmt = require("luasnip.extras.fmt").fmt -- luacheck:ignore

return {
	create_snippet("voidf", "void {} ({}) {{\n\t{}\n}}"),
	create_snippet("intf", "int {} ({}) {{\n\t{}\n}}"),
	create_snippet("charf", "char {} ({}) {{\n\t{}\n}}"),
	create_snippet("stringf", "std::string {} ({}) {{\n\t{}\n}}"),
	create_snippet("boolf", "bool {} ({}) {{\n\t{}\n}}"),
  create_snippet("int ", "int {} = {};"),
  create_snippet("int[] ", "int[] {} = {};"),
  create_snippet("char ", "char {} = {};"),
  create_snippet("char[] ", "char[] {} = {};"),
  create_snippet("bool ", "bool {} = {};"),
  create_snippet("string ", "std::string {} = {};"),
	create_snippet("while", "while ({}) {{\n\t{}\n}}"),
	create_snippet("fore", "for ({} {} : {}) {{\n\t{}\n}}", {"type", "name", "val", ""}),
	create_snippet("fori", "for (int {} = 0; {} < {}; ++{}) {{\n\t{}\n}}"),
	create_snippet("class", "class {} {{\n\t{}\n}};"),
	create_snippet("if", "if ({}) {{\n\t{}\n}}", {"cond", ""}),
	s("for", {
		c(1, {
			node_creator("for ({} {} : {}) {\n\t{}\n}"),
			node_creator("for (int {} = 0; {} < {}; ++{}) {\n\t{}\n}"),
		}),
	}),
}, {
	-- auto
	create_snippet("coute", "std::cout << {} << std::endl;"),
	create_snippet("coutse", "std::cout << \"{}\" << std::endl;"),
	create_snippet("stdcout", "std::cout << \"{}\" ;"),
}
