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
        \textbf{#1}: \text{#2}

\end{flushleft}}
\newcommand{\sol}{\textbf{Solution}:}

\title{<>}
\date{}
\author{}


\makeatletter
\renewcommand{\@maketitle}{
  \newpage
  \null
  \vskip 1em 
  \begin{center}
    \Large\@title
  \end{center}
  \par
  \vskip 1.5em}
\makeatother


\begin{document}
\maketitle
<>
\end{document}
  ]],
			{ i(1, "title"),  i(2, "content"),  },
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
      ]],{
          i(1, "") , i(2, "question") 
        }, {delimiters = "<>"})
    ),
    s(
      "isq" , 
      fmt([[
      \sqrt{<>}
      ]], 
      { i(1, "") }, 
        {delimiters = "<>"})
    ),
    s(
      "pwfn", 
      fmt([[ 
    \begin{cases}
        1 & \text{if } x \in \mathbb{Q}\\
        0 & \text{if } x \in \mathbb{R}\setminus\mathbb{Q}
    \end{cases}
    ]], 
        {}, 
        {delimiters = "<>"} 
      )
    ),
    s("inft", 
      fmt([[ 
      \infty
      ]], {} ) ),
}
