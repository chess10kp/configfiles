local ls = require("luasnip")

local s = ls.s --> snippet
local i = ls.i --> insert node
-- local t = ls.t --> text node

-- local d = ls.dynamic_node
-- local c = ls.choice_node
-- local f = ls.function_node
-- local sn = ls.snippet_node

local fmt = require("luasnip.extras.fmt").fmt
-- local rep = require("luasnip.extras").rep

return {
	s(
		"tabletemplate",
		fmt(
			[[
\begin{table}[h!]
  \begin{center}
    \caption{Your first table.}
    \label{tab:table1}
    \begin{tabular}{<>|<>|<>} 
      \textbf{Value 1} & \textbf{Value 2} & \textbf{Value 3}\\
      $\alpha$ & $\beta$ & $\gamma$ \\
      \hline
      1 & 1110.1 & a\\
      2 & 10.1 & b\\
      3 & 23.113231 & c\\
    \end{tabular}
  \end{center}
\end{table}
  ]],
			{ i(1, "l/c/r"),  i(2, "l/c/r"),  i(3, "l/c/r")  },
			{ delimiters = "<>" }
		)
	),
	s(
		"solutiontemplate",
		fmt(
			[[
\documentclass{article}

\usepackage{geometry}
\usepackage{amsmath}
\usepackage{graphicx}

\newcommand{\question}[2][]{\begin{flushleft}
        \textbf{Question #1}: \textit{#2}

\end{flushleft}}
\newcommand{\sol}{\textbf{Solution}:}
\newcommand{\maketitletwo}[2][]{\begin{center}

\end{center}}
\begin{document}
    \question[1]{Here is my first question}

    \begin{align*}
    \int_0^2 x^2 &= \left. \frac{x^3}{3} \right|_0^2 \\
                 &= \frac{2^3}{3}-\frac{0^3}{3}\\
                 &= \frac{8}{3}
    \end{align*}
\end{document}
  ]],
			{},
			{
				delimiters = "<>",
			}
		)
	),
}, {
	s(
		"begindoc",
		fmt(
			[[
\documentclass{article}

\usepackage{amsmath}
\usepackage{graphicx}
\usepackage{pgfplots}
\pgfplotsset{compat=1.18}

\title{}
\begin{document}
<>
\end{document}
      ]],
			{
				i(1, "thing i can insert text into"),
			},
			-- more snips here
			{
				delimiters = "<>",
			}
		)
	),
	s(
		"ieq",
		fmt(
			[[
    $ <> $
      ]],
			{
				i(1, "equation"),
			},
			{
				delimiters = "<>",
			}
		)
	),
	s(
		"beq", -- block equation
		fmt(
			[[
      $$ <> $$
      ]],
			{
				i(1, "equation"),
			},
			{
				delimiters = "<>",
			}
		)
	),
    s(
      "ifrac", 
      fmt([[
      \frac{<>}{<>}
      ]], {
          i(1, ""), i(2, ""),
        }, {delimiters = "<>"})
    ),
    s(
      "newques",
      fmt([[ 
    \question[<>]{<>}
    \vspace{-.5cm}
    \begin{align*}
      x &= <> \\
      y &= <>
    \end{align*}
      ]],{
          i(1, "") , i(2, "question"), i(3, ""), i(4, "")
        }, {delimiters = "<>"})
    ),
    s(
      "isq" , 
      fmt([[
      \sqrt{<>}
      ]], 
      { i(1, "") }, 
        {delimiters = "<>"})
    )
}
