% Identification of the class and the latex version
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{qazcho_sol}[National Chemistry Olympiad Solutions Class]

% Class options
\DeclareOption{twocolumn}{\OptionNotUsed}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[a4paper, 12pt]{article}

% Packages
\RequirePackage{enumitem}

\RequirePackage{framed}

\RequirePackage[version=4]{mhchem} % for chemical equations
\RequirePackage{siunitx} % for writing units
\RequirePackage{amsmath, amsfonts}

\RequirePackage{fontspec}
\setmainfont{PT Serif}

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

\RequirePackage{hyperref}

\hypersetup{
    colorlinks=true,
    linkcolor=black,
    filecolor=magenta,
    urlcolor=cyan
}


% Body of the class

% General

\setlength{\parskip}{1.8ex}

\renewcommand{\em}[1]{\textbf{#1}}

% Short command for frequently used units

\newcommand{\lmols}{\liter\per\mole\per\second}
\newcommand{\gcm}{\gram\per\centi\meter\cubed}
\newcommand{\kgm}{\kilo\gram\per\meter\cubed}
\newcommand{\jmol}{\joule\per\mole}
\newcommand{\jmolk}{\joule\per\mole\per\kelvin}
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

% Header and footer

\pagestyle{fancy}
\headheight = 26pt
\fancyhf{}
\fancyhead[c]{\color{black!30}\small\textbf{\olympstage\space республиканской олимпиады по химии \olympyear. Комплект решений теоретического тура. \olympgrade\space класс.}}
\fancyfoot[l]{\thepage/\pageref{LastPage}}
\fancyfoot[c]{\filename}
\fancyfoot[r]{ \href{https://qazcho.kz}{qazcho.kz} | \href{https://kazolymp.kz}{kazolymp.kz} }
\renewcommand{\headrulewidth}{0pt}

% Title

\renewcommand{\titlepage}[4]{
  \fontspec{PT Sans}
  \raggedright\thispagestyle{empty}

  \vspace*{\fill}
  \begin{minipage}{0.4\textwidth}
    \includegraphics[width=\textwidth]{qazcho_logo}
  \end{minipage}

  \textbf{Республиканская олимпиада по химии}\linebreak\nopagebreak
  {#1} ({#2}).\linebreak\nopagebreak
  Официальный комплект решений {#3} класса.
  \clearpage

  \newcommand{\olympstage}{#1}
  \newcommand{\olympyear}{#2}
  \newcommand{\olympgrade}{#3}
  \newcommand{\filename}{#4}
  \fontspec{PT Serif}
}


% creates an "icon" of the element in the periodic table
\newcommand{\chemelement}[3]{
  \begin{minipage}[c][30pt]{0.03\textwidth}\centering\tiny{#1}\vspace{1pt}\linebreak \normalsize{#2}\vspace{1pt}\linebreak\tiny{#3}\end{minipage}
}

% Problem titles and counts
\newcounter{problempartcount} % Will be needed later
\newcounter{problemcount}
\setcounter{problemcount}{0}
% argument: problem title and weight
\newcommand{\problem}[2]{
    \section*{\fontspec{PT Sans}\addtocounter{problemcount}{1}\setcounter{problempartcount}{0}Задача №\arabic{problemcount}. #1}
    \addcontentsline{toc}{section}{Задача №\arabic{problemcount}. #1 (#2\%)}
}

% Points for the problem. 1-9 arguments: points for the first 1-7 parts, total points, and problem weight
\newcommand{\ProblemPointsOne}[3]{
  \begin{table}[H]
  \small
    \begin{tabularx}{\textwidth}{|X|X|X|X|X|}
      \hline
      \cellcolor{gray!45} \textbf{\arabic{problemcount}.1} & \cellcolor{gray!45} \textbf{Всего} & \cellcolor{gray!45} \textbf{Вес(\%)} \\
      \hline
      #1 & #2 & #3 \\
      \hline
    \end{tabularx}
  \end{table}
}

\newcommand{\ProblemPointsTwo}[4]{
  \begin{table}[H]
  \small
    \begin{tabularx}{\textwidth}{|X|X|X|X|X|}
      \hline
      \cellcolor{gray!45} \textbf{\arabic{problemcount}.1} & \cellcolor{gray!45} \textbf{\arabic{problemcount}.2} & \cellcolor{gray!45} \textbf{Всего} & \cellcolor{gray!45} \textbf{Вес(\%)} \\
      \hline
      #1 & #2 & #3 & #4 \\
      \hline
    \end{tabularx}
  \end{table}
}

\newcommand{\ProblemPointsThree}[5]{
  \begin{table}[H]
  \small
    \begin{tabularx}{\textwidth}{|X|X|X|X|X|}
      \hline
      \cellcolor{gray!45} \textbf{\arabic{problemcount}.1} & \cellcolor{gray!45} \textbf{\arabic{problemcount}.2} & \cellcolor{gray!45} \textbf{\arabic{problemcount}.3} & \cellcolor{gray!45} \textbf{Всего} & \cellcolor{gray!45} \textbf{Вес(\%)} \\
      \hline
      #1 & #2 & #3 & #4 & #5 \\
      \hline
    \end{tabularx}
  \end{table}
}

\newcommand{\ProblemPointsFour}[6]{
  \begin{table}[H]
  \small
    \begin{tabularx}{\textwidth}{|X|X|X|X|X|X|}
      \hline
      \cellcolor{gray!45} \textbf{\arabic{problemcount}.1} & \cellcolor{gray!45} \textbf{\arabic{problemcount}.2} & \cellcolor{gray!45} \textbf{\arabic{problemcount}.3} & \cellcolor{gray!45} \textbf{\arabic{problemcount}.4} & \cellcolor{gray!45} \textbf{Всего} & \cellcolor{gray!45} \textbf{Вес(\%)} \\
      \hline
      #1 & #2 & #3 & #4 & #5 & #6 \\
      \hline
    \end{tabularx}
  \end{table}
}

\newcommand{\ProblemPointsFive}[7]{
  \begin{table}[H]
  \small
    \begin{tabularx}{\textwidth}{|X|X|X|X|X|X|X|}
      \hline
      \cellcolor{gray!45} \textbf{\arabic{problemcount}.1} & \cellcolor{gray!45} \textbf{\arabic{problemcount}.2} & \cellcolor{gray!45} \textbf{\arabic{problemcount}.3} & \cellcolor{gray!45} \textbf{\arabic{problemcount}.4} & \cellcolor{gray!45} \textbf{\arabic{problemcount}.5} & \cellcolor{gray!45} \textbf{Всего} & \cellcolor{gray!45} \textbf{Вес(\%)} \\
      \hline
      #1 & #2 & #3 & #4 & #5 & #6 & #7 \\
      \hline
    \end{tabularx}
  \end{table}
}

\newcommand{\ProblemPointsSix}[8]{
  \begin{table}[H]
  \small
    \begin{tabularx}{\textwidth}{|X|X|X|X|X|X|X|X|}
      \hline
      \cellcolor{gray!45} \textbf{\arabic{problemcount}.1} & \cellcolor{gray!45} \textbf{\arabic{problemcount}.2} & \cellcolor{gray!45} \textbf{\arabic{problemcount}.3} & \cellcolor{gray!45} \textbf{\arabic{problemcount}.4} & \cellcolor{gray!45} \textbf{\arabic{problemcount}.5} & \cellcolor{gray!45} \textbf{\arabic{problemcount}.6} & \cellcolor{gray!45} \textbf{Всего} & \cellcolor{gray!45} \textbf{Вес(\%)} \\
      \hline
      #1 & #2 & #3 & #4 & #5 & #6 & #7 & #8 \\
      \hline
    \end{tabularx}
  \end{table}
}

\newcommand{\ProblemPointsSeven}[9]{
  \begin{table}[H]
  \small
    \begin{tabularx}{\textwidth}{|X|X|X|X|X|X|X|X|X|}
      \hline
      \cellcolor{gray!45} \textbf{\arabic{problemcount}.1} & \cellcolor{gray!45} \textbf{\arabic{problemcount}.2} & \cellcolor{gray!45} \textbf{\arabic{problemcount}.3} & \cellcolor{gray!45} \textbf{\arabic{problemcount}.4} & \cellcolor{gray!45} \textbf{\arabic{problemcount}.5} & \cellcolor{gray!45} \textbf{\arabic{problemcount}.6} & \cellcolor{gray!45} \textbf{\arabic{problemcount}.7} & \cellcolor{gray!45} \textbf{Всего} & \cellcolor{gray!45} \textbf{Вес(\%)} \\
      \hline
      #1 & #2 & #3 & #4 & #5 & #6 & #7 & #8 & #9 \\
      \hline
    \end{tabularx}
  \end{table}
}

% New environment - solution box
\newlength{\currentparskip}
\newenvironment{solbox}[1]{
  \addtocounter{problempartcount}{1}
  \setlength{\currentparskip}{\parskip}
  \begin{framed}
    \begin{minipage}{\textwidth}
    \setlength{\parskip}{\currentparskip}
    \color{red}
    \raggedright
    \textbf{\arabic{problemcount}.\arabic{problempartcount}} (#1)
    
}{
    \end{minipage}
  \end{framed}
}

% Same as solbox but for problems with subproblems
\newenvironment{Solbox}[2]{
  \addtocounter{problempartcount}{1}
  \setlength{\currentparskip}{\parskip}
  \begin{framed}
    \begin{minipage}{\textwidth}
    \setlength{\parskip}{\currentparskip}
    \color{red}
    \raggedright
    \textbf{\arabic{problemcount}.#1} (#2)
    
}{
    \end{minipage}
  \end{framed}
}

% For solution boxes that are not fitted to one page
\newenvironment{emptysolbox}{
  \setlength{\currentparskip}{\parskip}
  \begin{framed}
    \begin{minipage}{\textwidth}
    \setlength{\parskip}{\currentparskip}
    \color{red}
    \raggedright
}{
    \end{minipage}
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