
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
  s("if", 
    fmt([[
    if <> : 
      <>
    ]], 
      {
        i(1, "statement"), i(2, "pass"),
      }, 
      {
        delimiters = "<>",
      })

  )
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
        i(1, "statement"),i(2, "pass"),i(3, "statement"), i("4", "pass")
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
  )
}
