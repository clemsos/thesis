\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Thesis}[2014/05/12 v0.1 Clement Thesis Class]
\LoadClass[12pt, a4paper]{book}

%encoding
\RequirePackage[english,frenchb]{babel}
\RequirePackage{lmodern}
\RequirePackage[utf8]{inputenc} 
\RequirePackage[T1]{fontenc}
\RequirePackage{textcomp}
\RequirePackage{subscript}

\DeclareUnicodeCharacter{00A0}{ }
\DeclareUnicodeCharacter{FB01}{ }
\DeclareUnicodeCharacter{FEFF}{ }

% display Chinese 
\RequirePackage{CJKutf8} 
\newcommand{\zh}[1]{\begin{CJK}{UTF8}{gkai}#1\end{CJK}}
\newcommand{\zht}[1]{\begin{CJK}{UTF8}{bkai}#1\end{CJK}} %traditional

% Media & images
\RequirePackage{graphicx}
\RequirePackage{hyperref}
\g@addto@macro{\UrlBreaks}{\UrlOrds} % hyphenate URLs
\hypersetup{
    linktocpage,
    colorlinks,
    citecolor=Crimson,%linkgrey,
    filecolor=black,
    linkcolor=black,
    urlcolor=black %Crimson%linkgrey,
}

%annexes
\RequirePackage[toc,page]{appendix} 
\renewcommand{\appendixtocname}{Annexes} 
\renewcommand\appendixpagename{Annexes}
\renewcommand{\appendixname}{{\sffamily Annexe}} 

% algorithms
\RequirePackage{algorithm}
\RequirePackage{algpseudocode}

% figures settings
\RequirePackage{subfig}
\RequirePackage{float}
\RequirePackage{rotating}

% table settings
\RequirePackage{tabulary}
\RequirePackage{colortbl}
\RequirePackage{longtable}

% francisation
\renewcommand\listalgorithmname{Liste des algorithmes} 
\addto\captionsfrench{\def\figurename{Graphique}} % francisation des légendes
\addto\captionsfrench{\def\tablename{Tableau}}

% colors
\RequirePackage{color}
\definecolor{Crimson}{rgb}{0.6471, 0.1098, 0.1882}
\definecolor{chaptergrey}{gray}{0.3}
\definecolor{linkgrey}{gray}{0.5}

% page layout
\RequirePackage[a4paper, margin=2.5cm]{geometry} % cus­tomize page lay­out
\RequirePackage{fancyhdr}  % header and footer
\RequirePackage{booktabs} % for much better looking tables
\RequirePackage[palatino]{quotchap} % dec­o­ra­tive chap­ter head­ings with quo­ta­tions
\pagestyle{plain} % options: empty , plain , fancy
\RequirePackage{lscape}

% typo
\RequirePackage{lipsum} % Lorem ipsum
\RequirePackage{lettrine} % big letter at start of chapter
\RequirePackage{setspace} %spacing between lines
\RequirePackage[
  labelfont={sf,bf,small},
  textfont={sf,small},
  justification=RaggedRight,
  margin=0pt, 
  figurewithin=section, 
  tablewithin=section
  ]{caption} % caption

\setlength{\parskip}{.6em} %paragraph spacing


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

\renewcommand*\l@figure{\@dottedtocline{1}{1.5em}{3.3em}}

% add a blank page

\newcommand*\blankpage{\newpage\null\thispagestyle{empty}\newpage}

% some definitions
\def\subtitle#1{\gdef\@subtitle{#1}}
\def\degreeyear#1{\gdef\@degreeyear{#1}}
\def\degreemonth#1{\gdef\@degreemonth{#1}}
\def\degree#1{\gdef\@degree{#1}}
\def\advisor#1{\gdef\@advisor{#1}}
\def\department#1{\gdef\@department{#1}}
\def\datesoutenance#1{\gdef\@datesoutenance{#1}}
\def\field#1{\gdef\@field{#1}}
\def\university#1{\gdef\@university{#1}}
\def\universitycity#1{\gdef\@universitycity{#1}}
\def\universitystate#1{\gdef\@universitystate{#1}}

% Licensing CC
\newcommand{\copyrightpage}{
    \newpage \thispagestyle{empty} \vspace*{\fill}
    
    \begin{flushright}
    \sc \noindent \cc~\textit{\@degreeyear \hspace{3pt}~- \theauthor} \\
    \noindent under Creative Commons.
    \end{flushright}
    
    \vspace*{\fill} 
    \newpage \rm
}

% title page
\renewcommand{\maketitle}{

    \thispagestyle{empty}

    \begin{center}
    \includegraphics[scale=0.12]{media/logoTPT.png}

    \vspace*{1cm}

    {\Large TH\`ESE DE DOCTORAT} \\
    \vspace*{0.5cm}
    en  \@field \ \\
    \vspace*{0.25cm}
    \textbf{\@department}\\

    % title 
    \vspace*{60pt}

    { \Huge 
      \begin{spacing}{1.2}
          \textcolor{Crimson}{
            \thetitle \\
            \vspace*{10pt}
            \Large{\@subtitle} \\
          }
      \end{spacing}
    }
    
    \vspace{50pt} 

    %

    % Pr\'esent\'e\ par \ \\ 
    \vspace*{0.3cm}
    {\Large \theauthor}\\
    \vspace*{0.5cm}
    le \@datesoutenance

    \vspace{70pt} 


    % soutenance

    Devant un jury composé de : \\[2ex]
      
    \begin{tabular}{r@{\ }ll}
      & Mme. Valérie {\sc Fernandez} & Directeur de thèse\\
      & M. Gilles {\sc Puel} & Directeur de thèse  \\
      & Mme. Carine {\sc Dominguez-Péry}  & Rapporteur  \\
      & M. Thierry {\sc Joliveau} &  Rapporteur \\
      & M. \'Eric {\sc Guichard} & Examinateur \\
    \end{tabular}


    \vspace{40pt} 
    
    \textbf{
      \@university \\
      \@universitycity, \@universitystate \\ 
      \@degreeyear
    }

    \end{center}
}

% page de garde
\newcommand*\titlelight{

  \thispagestyle{empty}
  \begin{center}
  
    \vspace*{0.5cm}
    {\Large \theauthor}\\
    \vspace*{5cm}


    % title 
    \vspace*{1cm}
    { \Huge 
      \begin{spacing}{1.5}
          \textcolor{Crimson}{
            \thetitle \\
            \vspace*{0.5cm}
            \Large{\@subtitle} \\
          }
      \end{spacing}
    }

    \vspace*{\fill}

    % credits
    \vspace{30pt} 
    \includegraphics[scale=0.12]{media/logoTPT.png}

    \textbf{\@university}  \\ 
    \@universitycity, \@universitystate \\ 
    \@degreeyear

  \end{center}
}

% the abstract
\newcommand{\resumepage}{
    \newpage
    \pagenumbering{roman}
    \setcounter{page}{3}
    \pagestyle{fancy}
    \lhead{Sous la direction de \@advisor} \rhead{\@author}
    \renewcommand{\headrulewidth}{0.0pt}
    \begin{center}
    \vspace*{1pt}
    \Large \textcolor{Crimson}{\textit{\@title}} \normalsize\\
    \vspace*{15pt}
    \sc Résumé \\ \rm
    \end{center}
    \doublespace %Harvard registrar requests that abstract is double spaced
    \input{pages/resume}
    \doublespace %Harvard registrar requests that abstract is double spaced
    \newpage \lhead{} \rhead{}
    \cfoot{\thepage}
    \onehalfspacing
}

% asbtarct
\newcommand{\abstractpage}{
    \newpage
    \pagenumbering{roman}
    \setcounter{page}{3}
    \pagestyle{fancy}
    \lhead{Sous la direction de \@advisor} \rhead{\@author}
    \renewcommand{\headrulewidth}{0.0pt}
    \begin{center}
    \vspace*{1pt}
    \Large \textcolor{Crimson}{
      \textit{Design of a Internet memes data visualisation toolkit}
      \normalsize\\
      The case of the Chinese social network Sina Weibo
      }
    \\
    \vspace*{15pt}
    \sc Abstract \\ \rm
    \end{center}
    \doublespace %Harvard registrar requests that abstract is double spaced
    \input{pages/abstract}
    \doublespace %Harvard registrar requests that abstract is double spaced
    \newpage \lhead{} \rhead{}
    \cfoot{\thepage}
    \onehalfspacing
}

% inspirational quote 
\newenvironment{chapquote}[2][0.2em]
  {\setlength{\@tempdima}{#1}%
   \def\chapquote@author{#2}%
   \parshape 1 \@tempdima \dimexpr\textwidth-2\@tempdima\relax%
   \itshape}
  { \par\normalfont\hfill--\ \chapquote@author\hspace*{\@tempdima}\par\bigskip}


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
