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
	s(
		"debug",
		fmt(
			[[ 
        # DEBUG: 
        <>
        # DEBUG: 
        ]],
			{
				i(1, "debug statements"),
			},
			{ delimiters = "<>" }
		)
	),
	s(
		"leetcode",
		fmt(
			[[ 
def list_to_tree(arr): 
    if not arr:
        return None

    if arr[0] is None:
        return None

    root = TreeNode(arr[0])
    
    queue = deque([root])
    
    i = 1 
    n = len(arr)

    while queue and i < n:
        current_node = queue.popleft()
        if i < n:
            left_val = arr[i]
            if left_val is not None:
                current_node.left = TreeNode(left_val)
                queue.append(current_node.left) 
            i += 1 

        if i < n:
            right_val = arr[i]
            if right_val is not None:
                current_node.right = TreeNode(right_val)
                queue.append(current_node.right) 
            i += 1 
            
    return root

        ]],
			{},
			{ delimiters = "zx" }
		)
	),
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
				i(1, "statement"),
				i(2, "pass"),
				i(3, "statement"),
				i(4, "pass"),
			},
			{
				delimiters = "<>",
			}
		)
	),
	s(
		"whle",
		fmt(
			[[
    while <> : 
        <>
    ]],
			{
				i(1, "pass"),
				i(2, "pass"),
			},
			{
				delimiters = "<>",
			}
		)
	),
	s(
		"prnt",
		fmt(
			[[
      print({})
      ]],
			{
				i(1, "expression"),
			},
			{
				delimiters = "{}",
			}
		)
	),
	s(
		"def ",
		fmt(
			[[
        def <>(<>): 
            <>
        ]],
			{
				i(1, "function"),
				i(2, ""),
				i(3, "pass"),
			},
			{
				delimiters = "<>",
			}
		)
	),
	s(
		"ifc",
		fmt(
			[[
    if <>:
      <>
    ]],
			{ i(1, "cond"), i(2, "") },
			{ delimiters = "<>" }
		)
	),
}
