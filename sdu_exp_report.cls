\ProvidesClass{sdu_exp_report}[2025/10/16 Shandong University Experiment Report Template]

% 1. 基础类和字体设置
\LoadClass[a4paper, 10.5pt]{article} % 基于 article 文档类，设置基础字号

% 2. 宏包导入
\RequirePackage{geometry}     % 设置页边距
\RequirePackage{fontspec}     % 字体控制 (XeLaTeX 必需)
\RequirePackage{xeCJK}        % 中文处理
% \RequirePackage{ltxtable}
\RequirePackage{xltabular}    % 支持跨页表格
\RequirePackage{array}        % 自定义列类型
\RequirePackage{colortbl}     % 表格颜色
\RequirePackage{hhline}       % 自定义表格线
\RequirePackage{ragged2e}     % 文本对齐控制
\RequirePackage{environ}      % 用于捕获环境内容
\RequirePackage{zhnumber}     % 中文数字和日期
\RequirePackage{ifxetex}
\RequireXeTeX
\ifxetex\else
    \ClassError{sdu_exp_report}{You must use the 'xelatex' driver.}{Please choose 'xelatex'.}
\fi
\setlength{\parindent}{0pt} % Disable indentation globally
% 3. 几何布局 (页边距)
\geometry{
    top=2.54cm,
    bottom=2.54cm,
    left=3.18cm,
    right=3.18cm
}

% 4. 字体设置 (确保系统中已安装 Noto 字体)
\setCJKmainfont{Noto Serif CJK SC}[UprightFont=*, BoldFont=* Bold]
\setCJKsansfont{Noto Sans CJK SC}[UprightFont=*, BoldFont=* Bold]
\setCJKmonofont{Noto Sans Mono CJK SC}[UprightFont=*, BoldFont=* Bold]

% 5. 定义报告信息存储命令
\newcommand{\DepartmentName}[1]{\def\@DepartmentName{#1}}
\newcommand{\CourseName}[1]{\def\@CourseName{#1}}
\newcommand{\StudentId}[1]{\def\@StudentId{#1}}
\newcommand{\StudentName}[1]{\def\@StudentName{#1}}
\newcommand{\ClassName}[1]{\def\@ClassName{#1}}
\newcommand{\ExperimentID}[1]{\def\@ExperimentID{#1}}
\newcommand{\ExperimentTitle}[1]{\def\@ExperimentTitle{#1}}
\newcommand{\ExperimentHours}[1]{\def\@ExperimentHours{#1}}
\newcommand{\ExperimentDate}[1]{\def\@ExperimentDate{#1}}
\newcommand{\ExperimentPurpose}[1]{\def\@ExperimentPurpose{#1}}
\newcommand{\HardwareEnv}[1]{\def\@HardwareEnv{#1}}
\newcommand{\SoftwareEnv}[1]{\def\@SoftwareEnv{#1}}

% 6. 定义用于捕获内容的环境
\NewEnviron{procedure}{\gdef\@procedurecontent{\BODY}}
\NewEnviron{reflection}{\gdef\@reflectioncontent{\BODY}}

% 7. 定义默认空内容
\gdef\@procedurecontent{}
\gdef\@reflectioncontent{}

% 8. 核心绘图命令：\DrawExperimentReport
\newcommand{\DrawExperimentReport}{%
    \pagestyle{empty} % 报告页不显示页眉页脚

    % --- 标题部分 ---
    \begin{center}
        \sffamily % 设置为非衬线字体
        \fontsize{15pt}{18pt}\selectfont % 设置字号为 15pt
        \textbf{山东大学\underline{\hspace{1em }\@DepartmentName\hspace{1em }}学院} \\
        \vspace{4pt} % 标题内的小间距
        \textbf{\underline{\hspace{1em }\@CourseName \hspace{1em }}课程实验报告}
    \end{center}
    \vspace{10.5pt} % 标题与表格之间的间距
    % --- 表格部分 ---
    \begin{xltabular}
        {\linewidth}{|X|X|X|}\endhead
        \hline
        \textsf{\textbf{姓名：}} \@StudentName & \textsf{\textbf{学号：}} \@StudentId & \textsf{\textbf{班级：}} \@ClassName \\
        \hline
        \multicolumn{3}{|l|}{\textsf{\textbf{实验编号：}} \@ExperimentID} \\ \hline
        \multicolumn{3}{|l|}{\textsf{\textbf{实验标题：}} \@ExperimentTitle} \\ \hline
        \multicolumn{3}{|l|}{%
            \begin{tabular*}{\linewidth}{@{}p{0.4\linewidth}|p{0.6\linewidth}@{}}
                \textsf{\textbf{实验时长：}} \@ExperimentHours & \textsf{\textbf{实验日期：}} \@ExperimentDate
            \end{tabular*}
        } \\ \hline
        \multicolumn{3}{|>{\RaggedRight\arraybackslash}p{\dimexpr\linewidth-2\tabcolsep\relax}|}{\textsf{\textbf{实验目的：}} \@ExperimentPurpose} \\ \hline
        \multicolumn{3}{|>{\RaggedRight\arraybackslash}p{\dimexpr\linewidth-2\tabcolsep\relax}|}{\textsf{\textbf{硬件环境：}} \@HardwareEnv} \\ \hline
        \multicolumn{3}{|>{\RaggedRight\arraybackslash}p{\dimexpr\linewidth-2\tabcolsep\relax}|}{\textsf{\textbf{软件环境：}} \@SoftwareEnv} \\ \hline
        \multicolumn{3}{|>{\RaggedRight\arraybackslash}p{\dimexpr\linewidth-2\tabcolsep\relax}|}{\textsf{\textbf{实验步骤及内容：}} \@procedurecontent} \\ \hline
        \multicolumn{3}{|>{\RaggedRight\arraybackslash}p{\dimexpr\linewidth-2\tabcolsep\relax}|}{\textsf{\textbf{结论分析与体会：}} \@reflectioncontent} \\
        \hline
    \end{xltabular}
}

