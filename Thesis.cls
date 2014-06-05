\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Thesis}[2014/05/12 v0.1 Thesis Class]
\LoadClass[12pt, a4paper]{book}

%encoding
\RequirePackage[english, frenchb]{babel}
\RequirePackage{lmodern}
\RequirePackage[utf8]{inputenc} 
\RequirePackage[T1]{fontenc}
\RequirePackage{textcomp}
\RequirePackage{subscript}

\DeclareUnicodeCharacter{00A0}{ }
\DeclareUnicodeCharacter{FB01}{ }
\DeclareUnicodeCharacter{FEFF}{ }

%feature to identify UTF8 errors
% from http://tex.stackexchange.com/questions/119060/problem-after-copying-text-inputenc-error-unicode-char-u8-not-set-up-for-us
\renewcommand*{\UTFviii@defined}[1]{%
  \ifx#1\relax
    \begingroup
      % Remove prefix "\u8:"
      \def\x##1:{}%
      % Extract Unicode char from command name
      % (utf8.def does not support surrogates)
      \edef\x{\expandafter\x\string#1}%
      \StringEncodingConvert\x\x{utf8}{utf16be}% convert to UTF-16BE
      % Hexadecimal representation
      \EdefEscapeHex\x\x
      % Enhanced error message
      \PackageError{inputenc}{Unicode\space char\space \string#1\space
                              (U+\x)\MessageBreak
                              not\space set\space up\space
                              for\space use\space with\space LaTeX}\@eha
    \endgroup
  \else\expandafter
    #1%
  \fi
}

% display Chinese 
\RequirePackage{CJKutf8} 
\newcommand{\zh}[1]{\begin{CJK}{UTF8}{gbsn}#1\end{CJK}}

% Media & images
\RequirePackage{graphicx}
\RequirePackage{hyperref}
\hypersetup{
    linktocpage,
    colorlinks,
    citecolor=Crimson,
    filecolor=black,
    linkcolor=black,
    urlcolor=Crimson,
}

% figures settings
\addto\captionsfrench{\def\figurename{Graphique}} % francisation des légendes
\addto\captionsfrench{\def\tablename{Tableau}}
\RequirePackage{subfig}
\RequirePackage{float}

% table settings
\RequirePackage{tabulary}
\RequirePackage{colortbl}
\RequirePackage{longtable}


% colors
\RequirePackage{color}
\definecolor{Crimson}{rgb}{0.6471, 0.1098, 0.1882}
\definecolor{chaptergrey}{rgb}{0.6,0,0}


% page layout
\RequirePackage[a4paper, margin=2.5cm]{geometry} % cus­tomize page lay­out
\RequirePackage{fancyhdr}  % header and footer
\RequirePackage{booktabs} % for much better looking tables
\RequirePackage[palatino]{quotchap} % dec­o­ra­tive chap­ter head­ings with quo­ta­tions
\pagestyle{plain} % options: empty , plain , fancy
\RequirePackage{lscape}

% typo
\RequirePackage{lettrine} % big letter at start of chapter
\RequirePackage{setspace} %spacing between lines
\RequirePackage[labelfont={sf,bf,small},textfont={sf,small},justification=RaggedRight,margin=0pt, figurewithin=section, tablewithin=section]{caption} % caption

\onehalfspacing

% footnote
\addtolength{\footnotesep}{\footnotesep}
\setlength{\skip\footins}{0.0469in}
\renewcommand\footnoterule{\vspace*{-0.0071in}\setlength\leftskip{0pt}\setlength\rightskip{0pt plus 1fil}\noindent\textcolor{black}{\rule{0.25\columnwidth}{0.0071in}}\vspace*{0.0398in}}

% info & data
\RequirePackage{titling} %  \ti­tle, \au­thor avail­able per­ma­nently 

% licensing
\RequirePackage{cclicenses}

% biblio
\RequirePackage[authoryear]{natbib}
\bibliographystyle{plainnat-fr}

% sommaire
\RequirePackage[tight]{shorttoc}
\newcommand{\sommaire}{\shorttoc{Sommaire}{1}}

% some definitions
\def\degreeyear#1{\gdef\@degreeyear{#1}}
\def\degreemonth#1{\gdef\@degreemonth{#1}}
\def\degree#1{\gdef\@degree{#1}}
\def\advisor#1{\gdef\@advisor{#1}}
\def\department#1{\gdef\@department{#1}}
\def\field#1{\gdef\@field{#1}}
\def\university#1{\gdef\@university{#1}}
\def\universitycity#1{\gdef\@universitycity{#1}}
\def\universitystate#1{\gdef\@universitystate{#1}}

% Licensing CC
\newcommand{\copyrightpage}{
    \newpage \thispagestyle{empty} \vspace*{\fill}
    \sc \noindent \cc~\textit{\@degreeyear \hspace{3pt}~- \theauthor} \\
    \noindent under Creative Commons.
    \vspace*{\fill} \newpage \rm
}

\renewcommand{\maketitle}{
    \singlespacing
    \thispagestyle{empty}
    \vspace*{\fill} \vspace{150pt} \begin{center}
    \includegraphics[scale=0.4]{media/logoTPT.png}
    \Huge \textcolor{Crimson}{\textit{\thetitle}} \normalsize \\ \sc \vspace{100pt}
    Une dissertation écrite\\ par\\
    \theauthor\\ pour\\ l'\@department\\
    \vspace{12pt}
    pour l'obtention\\
    du grade de \\ \@degree\\
    dans la discipline \\ \@field\\
    \vspace{12pt}
    \@university\\ \@universitycity, \@universitystate\\
    \@degreemonth\ \@degreeyear
    \end{center} \vspace*{\fill}
}

\newcommand{\abstractpage}{
    \newpage
    \pagenumbering{roman}
    \setcounter{page}{3}
    \pagestyle{fancy}
    \lhead{Sous la direction de: \@advisor} \rhead{\@author}
    \renewcommand{\headrulewidth}{0.0pt}
    \begin{center}
    \vspace*{1pt}
    \Large \textcolor{Crimson}{\textit{\@title}} \normalsize\\
    \vspace*{15pt}
    \sc Résumé \\ \rm
    \end{center}
    \doublespace %Harvard registrar requests that abstract is double spaced
    \input{pages/abstract}
    \doublespace %Harvard registrar requests that abstract is double spaced
    \newpage \lhead{} \rhead{}
    \cfoot{\thepage}
    \onehalfspacing
}

% the acknowledgments page
\newcommand{\acknowledgments}{
  \chapter*{Remerciements}
  \noindent
  \input{pages/thanks}
  \vspace*{\fill}
  \newpage
  \setcounter{page}{1}
  \pagenumbering{arabic}}

% An environment for paragraph-style section
\providecommand\newthought[1]{%
   \addvspace{1.0\baselineskip plus 0.5ex minus 0.2ex}%
   \noindent\textsc{#1}}

% multipage tabulary
\def\ltabulary{%
\small
\def\endfirsthead{\\}%
\def\endhead{\\}%
\def\endfoot{\\}%
\def\endlastfoot{\\}%
\def\tabulary{%
  \def\TY@final{%
\def\endfirsthead{\LT@end@hd@ft\LT@firsthead}%
\def\endhead{\LT@end@hd@ft\LT@head}%
\def\endfoot{\LT@end@hd@ft\LT@foot}%
\def\endlastfoot{\LT@end@hd@ft\LT@lastfoot}%
\longtable}%
  \let\endTY@final\endlongtable
  \TY@tabular}%
\dimen@\columnwidth
\advance\dimen@-\LTleft
\advance\dimen@-\LTright
\tabulary\dimen@}

\def\endltabulary{\endtabulary}