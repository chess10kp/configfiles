---@diagnostic disable: undefined-field

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text
local sn = ls.sn
local i = ls.i
local fmt = require("luasnip.extras.fmt").fmt -- luacheck:ignore

local M = {}

function M.make_snip(name, args)
	return s(name, args)
end

function M.make_snip_from_string(trigger, string)
	local delimiters = "{}"
	local args = {}
	local idx = 1
	local start = 1
	while true do
		local str, e = string:find(delimiters, start)
		if not str then
			break
		end
		table.insert(args, i(idx, ""))
		idx = idx + 1
		start = e + 1
	end
	return s(trigger, fmt(string, args), args)
end

function M.formatted_from_string(string)
	local delimiters = "{}"
	local args = {}
	local idx = 1
	local start = 1
	while true do
		local str, e = string:find(delimiters, start)
		if not str then
			break
		end
		table.insert(args, t(str))
		table.insert(args, i(idx, ""))
		idx = idx + 1
		start = e + 1
	end
	return sn(nil, fmt(string, args))
end

return M
