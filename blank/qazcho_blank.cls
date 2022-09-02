% Identification of the class and the latex version
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{qazcho_blank}[National Chemistry Olympiad Blank Class]

% Class options
\DeclareOption{twocolumn}{\OptionNotUsed}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[a4paper, 12pt]{article}

% Packages
\RequirePackage{float}

\RequirePackage{graphicx}

\RequirePackage{geometry}
\geometry{margin=2.5cm}

\RequirePackage[table]{xcolor}
\RequirePackage{tabularx}
\RequirePackage{xcolor}

% new column that centers X columns
\newcolumntype{Y}{>{\centering\arraybackslash}X}

\RequirePackage[T2A, T1]{fontenc}
\RequirePackage[russian]{babel}

\RequirePackage{ragged2e}

\RequirePackage{fancyhdr}

\RequirePackage{lastpage}

\RequirePackage{fontspec}
\setmainfont{PT Serif}

\RequirePackage{hyperref}

\hypersetup{
    colorlinks=true,
    linkcolor=black,
    filecolor=magenta,
    urlcolor=cyan
}

% Body of the class

% Header and footer

\pagestyle{fancy}
\headheight = 26pt
\fancyhf{}
\fancyhead[c]{\color{black!30}\small\textbf{\olympstage\space республиканской олимпиады по химии \olympyear. Бланк ответов теоретического тура. \olympgrade\space класс.}}
\fancyfoot[l]{\thepage/\pageref{LastPage}}
\fancyfoot[c]{\filename}
\fancyfoot[r]{ \href{https://qazcho.kz}{qazcho.kz} | \href{https://kazolymp.kz}{kazolymp.kz} }
\renewcommand{\headrulewidth}{0pt}

% Title. 3 arguments: этап, год обучения, класс
\renewcommand{\titlepage}[4]{
  \fontspec{PT Sans}
  \raggedright\thispagestyle{empty}

    \vspace*{\fill}
  \begin{minipage}{0.4\textwidth}
    \includegraphics[width=\textwidth]{qazcho_logo}
  \end{minipage}
    
  \textbf{Республиканская олимпиада по химии}\linebreak\nopagebreak
  {#1} ({#2}).\linebreak\nopagebreak
  Бланк ответов теоретического тура. {#3} класс.
  \clearpage

  \newcommand{\olympstage}{#1}
  \newcommand{\olympyear}{#2}
  \newcommand{\olympgrade}{#3}
  \newcommand{\filename}{#4}
  \fontspec{PT Serif}
}

% Problem titles and counts
\newcounter{problempartcount} % Will be needed later
\newcounter{problemcount}
\setcounter{problemcount}{0}
% argument: problem title
\newcommand{\problem}[1]{\section*{\fontspec{PT Sans}\addtocounter{problemcount}{1}\setcounter{problempartcount}{0}Задача №\arabic{problemcount}. #1}}

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

% Blanks for the problem. Argument - height
\newcommand{\answerbox}[1]{
  \addtocounter{problempartcount}{1}
  \begin{minipage}{\textwidth}
    \textbf{\arabic{problemcount}.\arabic{problempartcount}}\\

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
    \begin{minipage}{\textwidth}
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
    \begin{minipage}{\textwidth}
        \textbf{\arabic{problemcount}.#1}\\
        
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
