% Identification of the class and the latex version
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{national_olymp}[National Chemistry Olympiad Class]

% Class options
\DeclareOption{twocolumn}{\OptionNotUsed}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[a4paper, 12pt]{article}

% Packages

\RequirePackage{enumitem}

\RequirePackage{framed}

\RequirePackage{titlesec}

\RequirePackage[version=4]{mhchem} % for chemical equations
\RequirePackage{siunitx} % for writing units
\RequirePackage{amsmath, amsfonts, amssymb}

\RequirePackage{float}

\RequirePackage{graphicx}

\RequirePackage{geometry}
\geometry{margin=2.5cm}

\RequirePackage[table]{xcolor}
\RequirePackage{xcolor}

\RequirePackage{tabularx}
\newcolumntype{Y}{>{\centering\arraybackslash}X} % new column that centers X columns

\RequirePackage[T2A, T1]{fontenc}
\RequirePackage[russian]{babel}

\RequirePackage{ragged2e}

\RequirePackage{fancyhdr}

\RequirePackage{lastpage}

\RequirePackage[no-math]{fontspec}
\setmainfont{PT Serif}

\RequirePackage{hyperref}

\hypersetup{
    colorlinks=true,
    linkcolor=black,
    filecolor=magenta,
    urlcolor=cyan
}


% Body of the class

% General

% \setlength{\parskip}{1.8ex}
\titlespacing*\section{0pt}{12pt plus 4pt minus 2pt}{-2pt plus 2pt minus 2pt}
\renewcommand{\em}[1]{\textbf{#1}}

\newlength{\SpaceBeforeTable}
\setlength{\SpaceBeforeTable}{1ex} % amount of space that is removed before the tables with problem points

% Short commands for frequently used units

\newcommand{\lmols}{\liter\per\mole\per\second}
\newcommand{\gcm}{\gram\per\centi\meter\cubed}
\newcommand{\gml}{\gram\per\ml}
\newcommand{\kgm}{\kilo\gram\per\meter\cubed}
\newcommand{\jmol}{\joule\per\mole}
\newcommand{\jmolk}{\joule\per\mole\per\kelvin}
\newcommand{\jmolc}{\joule\per\mole\per\celsius}
\newcommand{\jgc}{\joule\per\gram\per\celsius}
\newcommand{\jgk}{\joule\per\gram\per\kelvin}
\newcommand{\kj}{\kilo\joule}
\newcommand{\kjg}{\kilo\joule\per\gram}
\newcommand{\jg}{\joule\per\gram}
\newcommand{\kjmol}{\kilo\joule\per\mole}
\newcommand{\mets}{\meter\per\second}
\newcommand{\kmh}{\kilo\meter\per\hour}
\newcommand{\kpa}{\kilo\pascal}
\newcommand{\mpa}{\mega\pascal}
\newcommand{\moll}{\mole\per\liter}
\newcommand{\moldm}{\mole\per\deci\meter\cubed}
\newcommand{\molls}{\mole\per\liter\per\second}
\newcommand{\js}{\joule\second}
\newcommand{\cmol}{\coulomb\per\mole}
\newcommand{\gmol}{\gram\per\mole}
\newcommand{\kgmol}{\kilo\gram\per\mole}
% \kg already exists, as well as \ms, \mm, \nm, \cm, \pm and others

% Switching languages
\def\rus{Russian}
\def\kaz{Kazakh}
\newcounter{lang}

% \SetLanguage accepts either "Kazakh" or "Russian" as an argument; otherwise, prints an error message. Values of the counter "lang": "Russian" - 1, "Kazakh" - 2.
\newcommand{\SetLanguage}[1]{
    \def\entered{#1}
    \ifx\entered\kaz{
        \setcounter{lang}{2}
    }\else
        \ifx\entered\rus{
            \setcounter{lang}{1}
        }\else{\color{green}Error: unknown language.\color{black}}
        \fi
    \fi
}

% Prints the current language mode
\newcommand{\LanguageMode}{\ifnum\value{lang}=1{The language is set to Russian.}\else\ifnum\value{lang}=2{The language is set to Kazakh.}\else{\color{green}Error: unknown language.\color{black}}\fi\fi}

% commands for "points"
\newcommand{\ball}{\ifnum\value{lang}=1{????????}\else{????????}\fi}
\newcommand{\balla}{\ifnum\value{lang}=1{??????????}\else{????????}\fi}
\newcommand{\ballov}{\ifnum\value{lang}=1{????????????}\else{????????}\fi}


% Switching templates
\def\tasks{Tasks}
\def\sols{Solutions}
\def\blank{Blank}
\newcounter{template}

% |UsingTemplate accepts "Tasks", "Solutions" and "Blank". The values assigned to the counter "template": "Tasks" - 1, "Solutions" - 2, "Blank" - 3
\newcommand{\UsingTemplate}[1]{
    \def\entered{#1}
    \ifx\entered\tasks{
        \setcounter{template}{1}
    }\else{
        \ifx\entered\sols{
            \setcounter{template}{2}
        }\else{
            \ifx\entered\blank{
                \setcounter{template}{3}
            }\else{
                \color{green}Error: unknown template.\color{black}
            }\fi
        }\fi
    }\fi
}

\newcounter{practical}
\setcounter{practical}{0}
\newcommand{\Practical}{\setcounter{practical}{1}}


% Header and footer

\pagestyle{fancy}
\headheight = 26.1pt
\fancyhf{}
\fancyhead[c]{\color{black!30}\small\textbf{\ifnum\value{lang}=1{\olympstage{} ???????? ?????????????????????????????? ?????????????????? ???? ?????????? \olympyear{}.\newline {\ifnum\value{template}=3{???????????? ??????????????}\else{???????????????? {\ifnum\value{template}=1{??????????????}\else{\ifnum\value{template}=2{??????????????}\fi}\fi}}\fi} {\ifnum\value{practical}=0{????????????????????????????}\else{??????????????????????????}\fi} ????????. \olympgrade{}-??????????.}\else{\olympyear{} ?????????????????????????? ?????????? ???????????????????????????? \lowercase\expandafter{\olympstage{}} ????????????. {\ifnum\value{practical}=0{??????????????????}\else{??????????????????????}\fi} ???????????????? \ifnum\value{template}=3{?????????? ??????????????????}\else{{\ifnum\value{template}=1{??????????????????????}\else{\ifnum\value{template}=2{????????????????}\fi}\fi} ????????????}\fi. \olympgrade{}-??????????.}\fi}}
\fancyfoot[l]{\thepage/\pageref{LastPage}}
\fancyfoot[c]{\filename}
\fancyfoot[r]{\href{https://qazcho.kz}{qazcho.kz} | \href{https://qazolymp.kz}{qazolymp.kz}}
\renewcommand{\headrulewidth}{0pt}

% Title

\renewcommand{\titlepage}[4]{
  \thispagestyle{empty}
  \fontspec{PT Sans}

  \vspace*{\fill}
  \input{periodictable}

  \vspace*{\fill}
  \noindent\begin{minipage}{0.4\textwidth}
    \includegraphics[width=\textwidth]{qazcho_logo}
  \end{minipage}

  \begin{raggedright}
    \textbf{\ifnum\value{lang}=1{?????????????????????????????? ?????????????????? ???? ??????????}\else{?????????????????????????? ?????????? ??????????????????????}\fi}\linebreak\nopagebreak
    {#1} {\ifnum\value{lang}=1{????????}\else{??????????}\fi} ({#2}).\linebreak\nopagebreak
    \ifnum\value{lang}=1{\ifnum\value{template}=3{???????????? ?????????????? ???????????????????????????? ????????}\else{?????????????????????? ???????????????? {\ifnum\value{template}=1{??????????????}\else{\ifnum\value{template}=2{??????????????}\fi}\fi} {#3}-????????????}\fi}\else{\ifnum\value{template}=3{?????????????????? ???????????????? ?????????? ??????????????????}\else{{#3}-?????????????? ???????????????? ?????????? {\ifnum\value{template}=1{??????????????????????}\else{\ifnum\value{template}=2{????????????????}\fi}\fi} ????????????}\fi}\fi.
    \clearpage
  \end{raggedright}

  \newcommand{\olympstage}{#1}
  \newcommand{\olympyear}{#2}
  \newcommand{\olympgrade}{#3}
  \newcommand{\filename}{#4}
  \fontspec{PT Serif}
}

\newenvironment{regulations}{
    \setlength{\currentparskip}{\parskip}
    \setlength{\parskip}{1.8ex}
    \vspace{-\parskip}
}{
    \setlength{\parskip}{\currentparskip}
}


% creates an "icon" of the element in the periodic table
\newcommand{\chemelement}[3]{
  \begin{minipage}[c][30pt]{0.03\textwidth}\centering\tiny{#1}\vspace{1pt}\linebreak \normalsize{#2}\vspace{1pt}\linebreak\tiny{#3}\end{minipage}
}

\newlength{\currentparskip}
\setlength{\currentparskip}{\parskip}

% Problem titles and counts
\newcounter{problemcount}
\newcounter{problempartcount} % Will be needed later
\setcounter{problemcount}{0}

\newcommand{\ProblemTitlePrefix}{\ifnum\value{lang}=1{???????????? ???\arabic{problemcount}}\else{???\arabic{problemcount} ????????}\fi}

% argument: problem title and weight
\newcommand{\problem}[2]{
    \phantomsection
    \section*{\fontspec{PT Sans}\addtocounter{problemcount}{1}\setcounter{problempartcount}{0}\ProblemTitlePrefix. #1}
    \addcontentsline{toc}{section}{\ProblemTitlePrefix. #1 (#2\%)}
}

\newcommand{\subproblem}[1]{\subsection*{\fontspec{PT Sans}#1}}

% command for writing isotopes in math mode. \isotope{symbol}{proton number}{mass number}
\newcommand{\isotope}[3]{\ce{_{#2}^{#3}#1}}

\newcommand{\uqty}[2]{#1~\unit{#2}}

\newcommand{\ProblemAuthor}[1]{\vspace{5pt}??????????: #1}

% Points for the problem. 3-9 arguments: points for the first 1-7 parts, total points, and problem weight
\newcommand{\ProblemPointsOne}[3]{
  \vspace{-\SpaceBeforeTable}
  \begin{table}[H]
  \small
    \begin{tabularx}{\textwidth}{|X|X|X|X|X|}
      \hline
      \cellcolor{gray!45} \textbf{\arabic{problemcount}.1} & \cellcolor{gray!45} \textbf{\ifnum\value{lang}=1{??????????}\else{??????????????}\fi} & \cellcolor{gray!45} \textbf{\ifnum\value{lang}=1{??????}\else{??????????}\fi(\%)} \\
      \hline
      #1 & #2 & #3 \\
      \hline
    \end{tabularx}
  \end{table}
}

\newcommand{\ProblemPointsTwo}[4]{
  \vspace{-\SpaceBeforeTable}
  \begin{table}[H]
  \small
    \begin{tabularx}{\textwidth}{|X|X|X|X|X|}
      \hline
      \cellcolor{gray!45} \textbf{\arabic{problemcount}.1} & \cellcolor{gray!45} \textbf{\arabic{problemcount}.2} & \cellcolor{gray!45} \textbf{\ifnum\value{lang}=1{??????????}\else{??????????????}\fi} & \cellcolor{gray!45} \textbf{\ifnum\value{lang}=1{??????}\else{??????????}\fi(\%)} \\
      \hline
      #1 & #2 & #3 & #4 \\
      \hline
    \end{tabularx}
  \end{table}
}

\newcommand{\ProblemPointsThree}[5]{
  \vspace{-\SpaceBeforeTable}
  \begin{table}[H]
  \small
    \begin{tabularx}{\textwidth}{|X|X|X|X|X|}
      \hline
      \cellcolor{gray!45} \textbf{\arabic{problemcount}.1} & \cellcolor{gray!45} \textbf{\arabic{problemcount}.2} & \cellcolor{gray!45} \textbf{\arabic{problemcount}.3} & \cellcolor{gray!45} \textbf{\ifnum\value{lang}=1{??????????}\else{??????????????}\fi} & \cellcolor{gray!45} \textbf{\ifnum\value{lang}=1{??????}\else{??????????}\fi(\%)} \\
      \hline
      #1 & #2 & #3 & #4 & #5 \\
      \hline
    \end{tabularx}
  \end{table}
}

\newcommand{\ProblemPointsFour}[6]{
  \vspace{-\SpaceBeforeTable}
  \begin{table}[H]
  \small
    \begin{tabularx}{\textwidth}{|X|X|X|X|X|X|}
      \hline
      \cellcolor{gray!45} \textbf{\arabic{problemcount}.1} & \cellcolor{gray!45} \textbf{\arabic{problemcount}.2} & \cellcolor{gray!45} \textbf{\arabic{problemcount}.3} & \cellcolor{gray!45} \textbf{\arabic{problemcount}.4} & \cellcolor{gray!45} \textbf{\ifnum\value{lang}=1{??????????}\else{??????????????}\fi} & \cellcolor{gray!45} \textbf{\ifnum\value{lang}=1{??????}\else{??????????}\fi(\%)} \\
      \hline
      #1 & #2 & #3 & #4 & #5 & #6 \\
      \hline
    \end{tabularx}
  \end{table}
}

\newcommand{\ProblemPointsFive}[7]{
  \vspace{-\SpaceBeforeTable}
  \begin{table}[H]
  \small
    \begin{tabularx}{\textwidth}{|X|X|X|X|X|X|X|}
      \hline
      \cellcolor{gray!45} \textbf{\arabic{problemcount}.1} & \cellcolor{gray!45} \textbf{\arabic{problemcount}.2} & \cellcolor{gray!45} \textbf{\arabic{problemcount}.3} & \cellcolor{gray!45} \textbf{\arabic{problemcount}.4} & \cellcolor{gray!45} \textbf{\arabic{problemcount}.5} & \cellcolor{gray!45} \textbf{\ifnum\value{lang}=1{??????????}\else{??????????????}\fi} & \cellcolor{gray!45} \textbf{\ifnum\value{lang}=1{??????}\else{??????????}\fi(\%)} \\
      \hline
      #1 & #2 & #3 & #4 & #5 & #6 & #7 \\
      \hline
    \end{tabularx}
  \end{table}
}

\newcommand{\ProblemPointsSix}[8]{
  \vspace{-\SpaceBeforeTable}
  \begin{table}[H]
  \small
    \begin{tabularx}{\textwidth}{|X|X|X|X|X|X|X|X|}
      \hline
      \cellcolor{gray!45} \textbf{\arabic{problemcount}.1} & \cellcolor{gray!45} \textbf{\arabic{problemcount}.2} & \cellcolor{gray!45} \textbf{\arabic{problemcount}.3} & \cellcolor{gray!45} \textbf{\arabic{problemcount}.4} & \cellcolor{gray!45} \textbf{\arabic{problemcount}.5} & \cellcolor{gray!45} \textbf{\arabic{problemcount}.6} & \cellcolor{gray!45} \textbf{\ifnum\value{lang}=1{??????????}\else{??????????????}\fi} & \cellcolor{gray!45} \textbf{\ifnum\value{lang}=1{??????}\else{??????????}\fi(\%)} \\
      \hline
      #1 & #2 & #3 & #4 & #5 & #6 & #7 & #8 \\
      \hline
    \end{tabularx}
  \end{table}
}

\newcommand{\ProblemPointsSeven}[9]{
  \vspace{-\SpaceBeforeTable}
  \begin{table}[H]
  \small
    \begin{tabularx}{\textwidth}{|X|X|X|X|X|X|X|X|X|}
      \hline
      \cellcolor{gray!45} \textbf{\arabic{problemcount}.1} & \cellcolor{gray!45} \textbf{\arabic{problemcount}.2} & \cellcolor{gray!45} \textbf{\arabic{problemcount}.3} & \cellcolor{gray!45} \textbf{\arabic{problemcount}.4} & \cellcolor{gray!45} \textbf{\arabic{problemcount}.5} & \cellcolor{gray!45} \textbf{\arabic{problemcount}.6} & \cellcolor{gray!45} \textbf{\arabic{problemcount}.7} & \cellcolor{gray!45} \textbf{\ifnum\value{lang}=1{??????????}\else{??????????????}\fi} & \cellcolor{gray!45} \textbf{\ifnum\value{lang}=1{??????}\else{??????????}\fi(\%)} \\
      \hline
      #1 & #2 & #3 & #4 & #5 & #6 & #7 & #8 & #9 \\
      \hline
    \end{tabularx}
  \end{table}
}


% New environment - solution box
\newenvironment{solbox}[1]{
  \addtocounter{problempartcount}{1}
  \begin{framed}
    \setlength{\parskip}{1ex}
    \color{red}
    \raggedright
    \vspace{-\parskip}\textbf{\arabic{problemcount}.\arabic{problempartcount}} (#1)
    
}{
    \color{black}
    \setlength{\parskip}{0pt}
  \end{framed}
}

% Same as solbox but for problems with subproblems
\newenvironment{Solbox}[2]{
  \begin{framed}
    \setlength{\parskip}{1ex}
    \color{red}
    \raggedright
    \vspace{-\parskip}\textbf{\arabic{problemcount}.#1} (#2)
    
}{
    \color{black}
    \setlength{\parskip}{0pt}
  \end{framed}
}

% A command for adding chemical compound in tables for organic chemistry problems
% Path is relative to the main directory
\newcommand{\chemcompound}[1]{
    \begin{minipage}[c][2.5cm][c]{0.33\textwidth}
        \centering
        \includegraphics{#1}
    \end{minipage}
}


% Blanks for the problem. Argument - height
\newcommand{\answerbox}[1]{
  \addtocounter{problempartcount}{1}
  \noindent\begin{minipage}{\textwidth}
    \textbf{\arabic{problemcount}.\arabic{problempartcount}}\vspace{0.5ex}

    \fbox{
      \begin{minipage}[c][#1][t]{\textwidth}
        \color{white}{nothing}
      \end{minipage}
    }
    \vspace{2ex}
  \end{minipage}
}

% Command that creates a blank without putting a number before it
\newcommand{\Answerbox}[1]{
    \noindent\begin{minipage}{\textwidth}
        \fbox{
          \begin{minipage}[c][#1][t]{\textwidth}
            \color{white}{nothing}
          \end{minipage}
        }
        \vspace{2ex}
    \end{minipage}
}

% Answer box with custom numeration (for problem with 2 and more subproblems). Arguments: counter, height
\newcommand{\ansbox}[2]{
    \noindent\begin{minipage}{\textwidth}
        \textbf{\arabic{problemcount}.#1}\vspace{0.5ex}
        
        \fbox{
          \begin{minipage}[c][#2][t]{\textwidth}
            \color{white}{nothing}
          \end{minipage}
        }
        \vspace{2ex}
    \end{minipage}
}

\newcommand{\problempart}{
  \addtocounter{problempartcount}{1}
  \textbf{\arabic{problemcount}.\arabic{problempartcount}}\nopagebreak
}