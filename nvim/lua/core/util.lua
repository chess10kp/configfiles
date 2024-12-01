---@diagnostic disable: undefined-field

local ls = require("luasnip")
local s = ls.s
local t = ls.t
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
	return s(trigger, fmt(string, args))
end

function M.newline_node()
	return t({ "", "" })
end

-- replace all newlines in the string with newline_node() inserted in into the table
function M.snippet_node_from_string(string)
	local delimiters = "{}"
	local nodes = {}
	local idx = 1
	local start = 1
	while true do
		local nln, enln = string:find("\n", start)
		local str, e = string:find(delimiters, start)
		if not str and not nln then
			table.insert(nodes, t(string:sub(start)))
			break
		elseif nln and not str then
			table.insert(nodes, t(string:sub(start, nln - 1)))
			table.insert(nodes, M.newline_node())
			start = enln + 1
		elseif str and not nln then
			table.insert(nodes, t(string:sub(start, str - 1)))
			table.insert(nodes, i(idx, ""))
			idx = idx + 1
			start = e + 1
    elseif str < nln then
			table.insert(nodes, t(string:sub(start, str - 1)))
			table.insert(nodes, i(idx, ""))
			idx = idx + 1
			start = e + 1
    else
      table.insert(nodes, t(string:sub(start, nln - 1)))
      table.insert(nodes, M.newline_node())
      start = enln + 1
		end
	end
  return sn(nil, nodes)
end

return M
