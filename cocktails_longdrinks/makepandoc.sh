#!/bin/zsh

LIST=(tschunk.md whiskysour.md white_russian.md martini.md moskito.md virgin_colada.md tropical_cooler.md daviscup.md)

OUTPUT=$(cat ${LIST[@]} | sed '/---/d')

PANDOCOPTS='
---
papersize: a4
header-includes:
    - \usepackage{multicol}
    - \newcommand{\hideFromPandoc}[1]{#1}
    - \hideFromPandoc{
        \let\Begin\begin
        \let\End\end
      }
geometry: margin=1cm
---

\Begin{multicols*}{2}
'
#EOT
#)

PANDOCENDOPTS='
\End{multicols*}
'

printf '%s\n%s\n%s' "$PANDOCOPTS" "$OUTPUT" "$PANDOCENDOPTS"| pandoc -so all.pdf
