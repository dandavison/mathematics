\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{problem-set}
\LoadClass[11pt]{article}

\RequirePackage{amsmath}
\RequirePackage{mathrsfs}
\RequirePackage{amsthm}
\RequirePackage{enumerate}
\RequirePackage{color}
\RequirePackage{graphicx}
\RequirePackage{ifthen}
\RequirePackage{wrapfig}

\newcommand\truefalsepoints{2}

\newcommand{\assignmentdue}[1]{\def\@assignmentdue{#1}}
\newcommand{\subtitle}[1]{\def\@subtitle{#1}}

\newcommand{\@DeclareGotDocType}[1]{%
  \@ifundefined{@problemSetDocType}{%
    \newcommand{\@problemSetDocType}{#1}%
  }{%
    \ClassError{problem-set}{processing option: #1: document type already declared as \@problemSetDocType}%
  }%
}

\newcommand{\examInstructions}{















\begin{itemize}

\item Please do not open the exam before you are instructed to do so.

\item The exam is closed book, closed notes except your one-page cheat sheet.

\item {\bf Electronic devices are forbidden on your person}, including
cell phones, iPods, headphones, and laptops.
Turn your cell phone off and
{\bf leave all electronics at the front of the room},
or {\bf risk getting a zero} on the exam.

\item You have 1 hour and 20 minutes.

\item Please write your initials at the top right of each odd-numbered page (e.g., write ``JS'' if you are Jonathan Shewchuk).  Finish this by the end of your 1 hour and 20 minutes.

\item Mark your answers on the exam itself in the space provided.
Do {\bf not} attach any extra sheets.

\item The total number of points is 100. There are 20 multiple choice questions worth 3 points each, and 3 written questions worth a total of 40 points.



\item For multiple-choice questions, fill in the bubbles for {\bf ALL correct choices}:  there may be more than one correct choice, but there is always at least one correct choice.  {\bf NO partial credit} on multiple-choice questions:  the set of all correct answers must be checked.
  \end{itemize}
}

\DeclareOption{section}{%
  \@DeclareGotDocType{section}
  \def\@declareHidePoints{}
  \AtBeginDocument{%
    \@ifundefined{showSolutions}{%
      \@MakeTitle[\@subtitle]{\@title}%
    }{%
      \@MakeTitle[\@subtitle]{\@title~Solutions}%
    }
  }%
}

\DeclareOption{written}{%
  \@DeclareGotDocType{written}
  \AtBeginDocument{%
  \@ifundefined{showSolutions}{%
      \@MakeTitle[\@subtitle]{\@title}%
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
    }{%
      \@MakeTitle[\@subtitle]{\@title~Solutions}%
    }%
  }%
}

\DeclareOption{exam}{%
  \@DeclareGotDocType{exam}
  \AtBeginDocument{%




      \@MakeTitle{\@title}%
      \examInstructions%
      \vskip .5em
      {\newcommand{\tprompt}[1]{\raisebox{0pt}[2em][1em]{#1}}
        \begin{center}
          \begin{tabular}{|l|l@{\hspace{3.5in}}|}
            \hline
            \tprompt{First name} & \\
            \hline
            \tprompt{Last name} & \\
            \hline
            \tprompt{SID} & \\
            \hline
            \tprompt{First and last name of student to your left} &\\
           \hline
            \tprompt{First and last name of student to your right} &\\
           \hline
          \end{tabular}%
        \end{center}
     }
      

      \newpage%



  }%
}

\AtEndDocument{
  \@definelabel{NumProblems}{\thesection}
  \@definelabel{TotalPoints}{\arabic{TotalPoints}}
}

\ProcessOptions

\@ifundefined{@problemSetDocType}{%
  \ClassError{problem-set}{document type (section, written, or exam) must be specified}{}%
}


\newcommand{\@singleOrPlural}[3]{\ifthenelse{\equal{#1}{1}}{#1~#2}{#1~#3}}
\newcommand{\@definelabel}[2]{%
\@bsphack
\protected@write\@auxout{}%
       {\string\newlabel{#1}{{#2}{\thepage}}}%
\@esphack%
}

\@ifundefined{@declareHidePoints}{%
  \newcommand{\@showPts}[1]{[\@singleOrPlural{#1}{pt}{pts}]~}%
}{%
  \newcommand{\@showPts}[1]{}%
}%

\newcounter{TotalPoints}
\newcounter{ProblemPoints}[section]
\newcounter{QuestionPoints}[subsection]
\newcounter{SubQuestionPoints}[subsubsection]

\font\dunhd=cmdunh10 scaled \magstep5
\font\dunhc=cmdunh10 scaled \magstep4
\font\dunhb=cmdunh10 scaled \magstep3
\font\dunha=cmdunh10 scaled \magstep2

\newcommand{\@MakeStudentInfo}{%

}

\newcommand{\@MakeGradeBox}{%
  \begin{center}%
    \xdef\graderows{}%
    \@ifundefined{r@NumProblems}{}%
    {%
      \newcounter{qnumber}%
      {\loop%
        \ifnum\theqnumber<\ref{NumProblems}%
        \addtocounter{qnumber}{1}%
        \xdef\graderows{%
          \graderows%
           Q\arabic{qnumber}.&\ref{ProblemName:\theqnumber}&~~~/\ref{ProblemPoints:\theqnumber}\cr %
          \noalign{\hrule}%
        }%
        \repeat}%
    }%
    \vfill
{\bf For staff use only:}\\
    
      \begin{tabular}{|ll|l|}
        \hline
        \graderows
        & Total &~~~/\ref{TotalPoints}\\
        \hline
      \end{tabular}%
    
  \end{center}%
}

\newcommand{\@MakeTitle}[2][]{%
  \hrule height6pt \vspace{-0.5em}%
  \noindent%
  \parbox[b]{0.22\textwidth}{
    {\dunhb \coursenumber}\\%
    {\dunhb \coursesemester}}%
  \parbox[b]{0.35\textwidth}{%
    \raggedright
    {\dunhb \coursename}}%
  \hfill%
  \begin{tabular}[b]{l}
    \ifthenelse{\equal{#1}{}}{%
      {\dunhd #2}%
    }{%
      {\dunhb #2}\\%
      {\dunhb #1}%
    }
  \end{tabular}%
  \vskip 0.6em
  \hrule height6pt
  \par
  \vskip .5em
}

\newenvironment{problem}[2][]%
{%
  \addtocounter{section}{1}%
  \ifthenelse{\equal{\arabic{section}}{1}}{}{\newpage}%
  \setcounter{subsection}{0}%
  \setcounter{ProblemPoints}{0}%
  \begin{huge}%
    \noindent Q\arabic{section}.~\@showPts{\ref{ProblemPoints:\thesection}}#2%
  \end{huge}%
  \par
  \@definelabel{ProblemName:\thesection}{#2}%
  \def\@atproblemend {%
    \ifthenelse{\equal{#1}{}}{%
      \@definelabel{ProblemPoints:\thesection}{\theProblemPoints}%
      \addtocounter{TotalPoints}{\theProblemPoints}
    }{%
      \@definelabel{ProblemPoints:\thesection}{#1}%
      \addtocounter{TotalPoints}{#1}
    }%
  }%
}%
{%
  \@atproblemend%
}%

\newenvironment{question}[1][]%
{%
  \addtocounter{subsection}{1}%
  \setcounter{subsubsection}{0}%
  \setcounter{QuestionPoints}{0}%
  \def\@atquestionend {%
    \ifthenelse{\equal{#1}{}}{%
      \@definelabel{QuestionPoints:\thesubsection}{\theQuestionPoints}%
      \addtocounter{ProblemPoints}{\theQuestionPoints}%
    }{%
      \@definelabel{QuestionPoints:\thesubsection}{#1}%
      \addtocounter{ProblemPoints}{#1}%
    }%
  }%
  \begin{list}%
    {{\bf (\alph{subsection})}}%
    {%
      \setlength{\topsep}{0pt}%
      \setlength{\partopsep}{0pt}%
    }%
    \item\ifthenelse{\equal{#1}{}}{}{\@showPts{\ref{QuestionPoints:\thesubsection}}}%
      \ignorespaces%
}%
{%
  \end{list}%
  \@atquestionend%
}%

\newenvironment{subquestion}[1][]%
{%
  \addtocounter{subsubsection}{1}%
  \setcounter{SubQuestionPoints}{0}%
  \def\@atsubquestionend {%
    \ifthenelse{\equal{#1}{}}{%
      \@definelabel{SubQuestionPoints:\thesubsubsection}{\theSubQuestionPoints}%
      \addtocounter{QuestionPoints}{\theSubQuestionPoints}%
    }{%
      \@definelabel{SubQuestionPoints:\thesubsubsection}{#1}%
      \addtocounter{QuestionPoints}{#1}%
    }%
  }%
  \begin{list}%
    {{\bf (\roman{subsubsection})}}%
    {%
      \setlength{\topsep}{0pt}%
      \setlength{\partopsep}{0pt}%
    }%
    \item \@showPts{\ref{SubQuestionPoints:\thesubsubsection}}%
      \ignorespaces%
}%
{%
  \end{list}%
  \@atsubquestionend%
}%


\newcommand{\tfq}[1]{%
 \@showPts{\truefalsepoints} [%
  \ifthenelse{\equal{#1}{true}}{%
    \textit{\solution{true}{\underline{true}}}~or~\textit{false}%
  }{%
    \ifthenelse{\equal{#1}{false}}{%
      \textit{true}~or~\textit{\solution{false}{\underline{false}}}%
    }{%
      \textit{true}~or~\textit{false}%
    }%
  }%
  ]~\ignorespaces
}


\newenvironment{truefalse}[1][]%
{%
  \addtocounter{subsubsection}{1}%
  \setcounter{SubQuestionPoints}{0}%
  \def\@atsubquestionend {%
    \@definelabel{SubQuestionPoints:\thesubsubsection}{1}%
    \addtocounter{QuestionPoints}{\truefalsepoints}%
  }%
  \begin{list}%
    {{\bf (\roman{subsubsection})}}%
    {%
      \setlength{\topsep}{0pt}%
      \setlength{\partopsep}{0pt}%
    }%
    \item \tfq{#1}
}%
{%
  \end{list}%
  \@atsubquestionend%
}%


\newcommand{\pad}{\vspace*{\fill}\par}

\@ifundefined{showSolutions}{
  \newcommand{\solution}[2]{#1} 
  \newcommand{\solval}[2][]{}
  \newcommand{\solutioncircle}[1]{#1} 
  \newcommand{\solc}[1]{#1} 
  \newcommand{\solutionimage}[2]{#1}  
}{
  \newcommand{\solution}[2]{{\color{red}{#2}}} 
  \newcommand{\solval}[2][]{{\color{red}{#2}}}
  \newcommand{\solutioncircle}[1]{\fbox{{\color{red}#1}}}
  \newcommand{\solc}[1]{\fbox{{\color{red}#1}}}
  \newcommand{\solutionimage}[2]{\begin{center}\fcolorbox{red}{white}{#2}\end{center}}
}

\def\indep{\perp\!\!\!\perp}


\textwidth = 7.0 in
\textheight = 9.5 in
\oddsidemargin = -0.30 in
\evensidemargin = -0.30 in
\topmargin = -0.75 in
\headheight = 0.00 in
\headsep = 0.25 in
\parskip = 0.15in
\parindent = 0.0in
\itemsep=-2pt
\floatsep 5pt plus 2pt minus 3pt
\intextsep 5pt plus 2pt minus 3pt
\textfloatsep=5pt plus 2pt minus 3pt
\renewcommand{\baselinestretch}{1.0}
\font\dunhd=cmdunh10 scaled \magstep5
\font\dunhc=cmdunh10 scaled \magstep4
\font\dunhb=cmdunh10 scaled \magstep3
\font\dunha=cmdunh10 scaled \magstep2
\date{}
