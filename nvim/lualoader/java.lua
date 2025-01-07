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

-- gsub("^%l", string.upper)

return {
	create_snippet("voidf", "void {} ({}) {{\n\t{}\n}}"),
	create_snippet("intf", "int {} ({}) {{\n\t{}\n}}"),
	create_snippet("charf", "char {} ({}) {{\n\t{}\n}}"),
	create_snippet("Stringf", "String {} ({}) {{\n\t{}\n}}"),
	create_snippet("boolf", "bool {} ({}) {{\n\t{}\n}}"),
  create_snippet("void ", "void {} = {};"),
  create_snippet("int ", "int {} = {};"),
  create_snippet("char ", "char {} = {};"),
  create_snippet("bool ", "bool {} = {};"),
  create_snippet("String ", "String {} = {};"),
	create_snippet("pint", "public int {} ({}) {{\n\t{}\n}}"),
	create_snippet("pvoid", "public void {} ({}) {{\n\t{}\n}}"),
	s(
		"attr",
		fmt(
			[[
      private <> <>;
      public <> get<>() {
        return this.<>;
      }
      public void set<>(<> <>) {
        this.<> = <>;
      }
    ]],
			{
				i(1, "type"),
				i(2, "name"),
				f(function(args)
					return args[1][1]
				end, { 1 }),
				f(function(args)
					return args[1][1]:gsub("^%l", string.upper)
				end, { 2 }),
				f(function(args)
					return args[1][1]
				end, { 2 }),
				f(function(args)
					return args[1][1]:gsub("^%l", string.upper)
				end, { 2 }),
				f(function(args)
					return args[1][1]
				end, { 1 }),
				f(function(args)
					return args[1][1]
				end, { 2 }),
				f(function(args)
					return args[1][1]
				end, { 2 }),
				f(function(args)
					return args[1][1]
				end, { 2 }),
			},
			{ delimiters = "<>" }
		)
	),
	create_snippet("main", "public static void main(String[] args) {{\n  {}\n}}"),
	create_snippet("while", "while ({}) {{\n\t{}\n}}"),
	create_snippet("class", "class {} {{\n\t{}\n}}"),
	create_snippet("if", "if ({}) {{\n\t{}\n}}", {"cond", ""}),
	s("for", {
		c(1, {
			node_creator("for ({} {} : {}) {\n\t{}\n}"),
			node_creator("for (int {} = 0; {} < {}; ++{}) {\n\t{}\n}"),
		}),
	}),
}, {
	-- auto
	create_snippet("prnt", "System.out.println({});"),
	s("inew", {
		i(1, "type"),
		t(" "),
		i(2, "name"),
		t(" = new "),
		f(function(args)
			return args[1][1]
		end, { 1 }),
		t("("),
		i(3, ""),
		t(");"),
	}),
}
