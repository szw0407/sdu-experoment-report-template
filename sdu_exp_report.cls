\ProvidesClass{sdu_exp_report}[2025/10/16 Shandong University Experiment Report Template]

% 1. 基础类和字体设置
\LoadClass[a4paper, 11pt]{article} % 基于 article 文档类，设置基础字号

% 2. 宏包导入
\RequirePackage{geometry}     % 设置页边距
\RequirePackage{fontspec}     % 字体控制 (XeLaTeX 必需)
\RequirePackage{xeCJK}        % 中文处理
% \RequirePackage{ltxtable}
\RequirePackage{tabularx}     % 支持自动列宽表格
\RequirePackage{array}        % 自定义列类型
\RequirePackage{colortbl}     % 表格颜色
\RequirePackage{hhline}       % 自定义表格线
\RequirePackage{ragged2e}     % 文本对齐控制
\RequirePackage{environ}      % 用于捕获环境内容
\RequirePackage{zhnumber}     % 中文数字和日期
\RequirePackage{ifxetex}
\RequirePackage{amsmath}      % 数学公式
\RequirePackage{mdframed}     % 盒子环境
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

% ==== 新增：全局与表格行距设置，避免拥挤 ====
% 全局行距（基于 10.5pt，略放大）
\linespread{1} 
\setlength{\topmargin}{-1.2cm} % 将顶部留白设置为 2cm
% 表格默认行高：增大行距和额外行高
\renewcommand{\arraystretch}{1}
\setlength{\extrarowheight}{0.3ex}
% ============================================

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
\newcommand{\ExperimentProcedure}[1]{\def\@ExperimentProcedure{#1}}
\newcommand{\ExperimentReflection}[1]{\def\@ExperimentReflection{#1}}

% 8. 核心绘图命令：\DrawExperimentReport
\newcommand{\DrawExperimentReport}{%
    \pagestyle{empty} % 报告页不显示页眉页脚
    % --- 标题部分 ---
    \begin{center}
        \sffamily % 设置为非衬线字体
        \fontsize{15pt}{28pt}\selectfont % 设置字号为 16pt
        {山东大学\underline{\hspace{1em }\@DepartmentName\hspace{1em }}学院} \\
        \vspace{4pt} % 标题内的小间距
        {\underline{\hspace{1em }\@CourseName \hspace{1em }}课程实验报告}
    \end{center}
    % \vspace{3pt} % 标题与表格之间的间距
    % --- 表格部分 ---
    \begin{tabularx}
        {\linewidth}{|X|X|X|}
        \hline
        \textsf{\textbf{姓名：}} \@StudentName & \textsf{\textbf{学号：}} \@StudentId & \textsf{\textbf{班级：}} \@ClassName \\
        \hline
        \multicolumn{3}{|l|}{\textsf{\textbf{实验编号：}} \@ExperimentID} \\ \hline
        \multicolumn{3}{|l|}{\textsf{\textbf{实验标题：}} \@ExperimentTitle} \\ \hline
        \multicolumn{3}{|l|}{%
            \begin{tabular*}{0.9\linewidth}{@{}p{0.4\linewidth}|p{0.6\linewidth}@{}}
                \textsf{\textbf{实验时长：}} \@ExperimentHours & \textsf{\textbf{实验日期：}} \@ExperimentDate
            \end{tabular*}
        } \\ \hline
    \end{tabularx}%
    % \nointerlineskip% 消除行间距
    \vspace{-3pt} % 表格与正文之间的间距
    \begin{mdframed}[
        style=mymdfstyle,
        innertopmargin=2pt,
        skipabove=0pt,
        innerleftmargin=6pt,
    ]
    \textsf{硬件环境：} \@HardwareEnv
    \mdfsubtitle[
        subtitleaboveline=true,
        subtitleabovelinewidth=0.8pt, % 经验值，肉眼看跟上面 linewidth = 0.5pt 粗细差不多
        subtitlebelowskip=0.2\baselineskip,
        subtitleinneraboveskip=0pt,
        subtitleinnerbelowskip=0pt,
    ]{}
    \textsf{软件环境：} \@SoftwareEnv
    \mdfsubtitle[
        subtitleaboveline=true,
        subtitleabovelinewidth=0.8pt, % 经验值，肉眼看跟上面 linewidth = 0.5pt 粗细差不多
        subtitlebelowskip=0.2\baselineskip,
        subtitleinneraboveskip=0pt,
        subtitleinnerbelowskip=0pt,
    ]{}
    \textsf{实验步骤及内容：} \@ExperimentProcedure
    \mdfsubtitle[
        subtitleaboveline=true,
        subtitleabovelinewidth=0.8pt, % 经验值，肉眼看跟上面 linewidth = 0.5pt 粗细差不多
        subtitlebelowskip=0.2\baselineskip,
        subtitleinneraboveskip=0pt,
        subtitleinnerbelowskip=0pt,
    ]{}
    \textsf{结论分析与体会：} \@ExperimentReflection

    \end{mdframed}
}

