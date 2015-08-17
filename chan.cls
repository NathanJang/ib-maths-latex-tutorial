%% chan.cls
%% Copyright 2015 Jonathan Chan
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This work has the LPPL maintenance status `maintained'.
% 
% The Current Maintainer of this work is Jonathan Chan.
%
% This work consists of the file chan.cls.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{chan}[2015/03/08 Chanathan's Report]

%% declare option(s)

%%%% initialise conditionals
\newif\if@haspartners
\newif\if@shouldmaketitle
\@shouldmaketitletrue

%%%% actually declare options
\DeclareOption{a4paper}{
	\PassOptionsToClass{a4paper}{article}
}
\DeclareOption{notitle}{
	\@shouldmaketitlefalse
}
\ExecuteOptions{a4paper}
\DeclareOption*{
	\PassOptionsToClass{\CurrentOption}{article}
}

%%%% execute
\ProcessOptions


%% load the default packages
\LoadClass{article}

%%%% geometries
\RequirePackage[margin=3cm]{geometry}

\RequirePackage{fix-cm}

%%%% ISO date
\RequirePackage{datetime}
\yyyymmdddate
\renewcommand{\dateseparator}{-}

%%%% url
\RequirePackage{url}

%%%% ifthen
\RequirePackage{ifthen}


%% redefine maketitle
\def\@author{Jonathan Chan}
\renewcommand{\author}[1]{\gdef\@author{#1}}

\def\@course{Course Title}
\newcommand{\course}[1]{\gdef\@course{#1}}

\def\@instructor{Instructor's Name}
\newcommand{\instructor}[1]{\gdef\@instructor{#1}}

\newcommand{\partners}[1]{\@haspartnerstrue\gdef\@partners{#1}}

%%%% shorttitle for headers
\def\@title{Title}
\renewcommand{\title}[1]{\gdef\@title{#1}}

\def\@subtitle{Subtitle}
\newcommand{\subtitle}[1]{\gdef\@subtitle{#1}}

\def\@headername{Chan}
\newcommand{\headername}[1]{\gdef\@headername{#1}}

%% Make title by default
\AtBeginDocument{\if@shouldmaketitle\maketitle\fi}

\renewcommand\maketitle{{
	\setlength{\parskip}{0cm}
	\noindent\@author\par
	\if@haspartners
		\noindent Partner(s): \@partners\par
	\fi
	\noindent\@instructor\par
	\noindent\@course\par
	\noindent\@date\par
	\begin{center}
		\@title
		\ifthenelse{\equal{\@subtitle}{}}{}{:\\\@subtitle}
	\end{center}
}}

%% headers
\pagestyle{myheadings}
\markright{\emph{\protect\@title\hfill\protect\@date\hfill\protect\@headername\ }}


%% section headings
\RequirePackage{titlesec}
\setcounter{secnumdepth}{4}

\titleformat{\section}{\Large\bfseries}{\thesection}{.5cm}{}
\titlespacing*{\section}{0pt}{.5cm}{.25cm}

\titleformat{\subsection}{\large\bfseries}{\thesubsection}{.5cm}{}
\titlespacing*{\subsection}{0pt}{.5cm}{.25cm}

\titleformat{\subsubsection}{\normalsize\bfseries}{\thesubsubsection}{.5cm}{}
\titlespacing*{\subsubsection}{0pt}{.5cm}{.25cm}

\titleformat{\paragraph}{\normalsize\bfseries}{\theparagraph}{.5cm}{}
\titlespacing{\paragraph}{0pt}{.5cm}{.25cm}

%% paragraph styles
\raggedright
\RequirePackage{setspace}
\RequirePackage{indentfirst}
\onehalfspacing

\setlength{\parindent}{1cm}

%% items
\RequirePackage{enumitem}
\setlist{leftmargin=1cm}


%% footnotes
\renewcommand{\thefootnote}{\fnsymbol{footnote}}


%% abstracts
\renewcommand{\abstract}[1]{\noindent\emph{#1}\vspace{0.25cm}}


%% word count
\newcommand{\wordcount}[1]{\begin{flushright}(#1\ words)\end{flushright}}


\endinput
