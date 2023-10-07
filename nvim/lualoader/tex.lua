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
	s("solutiontemplate",
	fmt([[
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
    \maketitletwo[5]  % Optional argument is assignment number
    %Keep a blank space between maketitletwo and \question[1]
    
    \question[1]{Here is my first question} 
    
    YOUR SOLUTION HERE
    
    \begin{align*}
    \int_0^2 x^2 &= \left. \frac{x^3}{3} \right|_0^2 \\
                 &= \frac{2^3}{3}-\frac{0^3}{3}\\
                 &= \frac{8}{3}
    \end{align*}
\end{document}
  ]], 
    {
 
    }, 
      {
        delimiters = "<>"
      })
  )}, {
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
		"inlineq",
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
		"lineq",
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
}
