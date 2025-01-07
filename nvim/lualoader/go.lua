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
  create_snippet("ifer", 'if err != nil {{\n\tlog.Fatal("{}", err)\n}}\n{}')
}, {
}
