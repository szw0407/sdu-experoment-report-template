\ProvidesClass{sdu_exp_report}[2025/10/16 Shandong University Experiment Report Template]

% 1. 基础类和字体设置
\LoadClass[a4paper, 10.5pt]{article} % 基于 article 文档类，设置基础字号

% 2. 宏包导入
\RequirePackage{geometry}     % 设置页边距
\RequirePackage{fontspec}     % 字体控制 (XeLaTeX 必需)
\RequirePackage{xeCJK}        % 中文处理
\RequirePackage{tabularx}     % 可变宽度表格
\RequirePackage{longtable}    % 用于创建跨页表格
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
\newcommand{\DepartmentNam}[1]{\def\@DepartmentNam{#1}}
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
        \textbf{山东大学\underline{\hspace{8em}}学院} \\
        \vspace{4pt} % 标题内的小间距
        \textbf{\@CourseName 课程实验报告}
    \end{center}
    \vspace{10.5pt} % 标题与表格之间的间距

    % --- 表格部分 ---
    % 使用 longtable 实现跨页，定义3列表格
    \begin{longtable}{|p{5.5cm}|p{4.5cm}|p{4.5cm}|}
    \hline
    % 第一行：学号、姓名、班级
    \sffamily 学号：\rmfamily \@StudentId & 
    \sffamily 姓名：\rmfamily \@StudentName & 
    \sffamily 班级：\rmfamily \@ClassName \\
    \hline
    % 第二行：实验编号
    \multicolumn{3}{|p{14.5cm}|}{\sffamily 实验编号：\rmfamily \@ExperimentID} \\
    \hline
    % 第三行：实验题目
    \multicolumn{3}{|p{14.5cm}|}{\sffamily 实验题目：\rmfamily \@ExperimentTitle} \\
    \hline
    % 第四行：实验学时、实验日期
    \multicolumn{1}{|p{5.8cm}|}{\sffamily 实验学时：\rmfamily \@ExperimentHours} &
    \multicolumn{2}{p{8.7cm}|}{\sffamily 实验日期：\rmfamily \@ExperimentDate} \\
    \hline
    % 后续内容部分
    \multicolumn{3}{|l|}{\textbf{实验目的：}} \\
    \multicolumn{3}{|p{14.5cm}|}{\parbox[t][3\baselineskip][t]{\linewidth}{\@ExperimentPurpose}} \\
    \hline
    \multicolumn{3}{|l|}{\textbf{硬件环境：}} \\
    \multicolumn{3}{|p{14.5cm}|}{\parbox[t][2\baselineskip][t]{\linewidth}{\@HardwareEnv}} \\
    \hline
    \multicolumn{3}{|l|}{\textbf{软件环境：}} \\
    \multicolumn{3}{|p{14.5cm}|}{\parbox[t][2\baselineskip][t]{\linewidth}{\@SoftwareEnv}} \\
    \hline
    \multicolumn{3}{|l|}{\textbf{实验步骤与内容：}} \\
    \multicolumn{3}{|p{14.5cm}|}{\parbox[t][10\baselineskip][t]{\linewidth}{\@procedurecontent}} \\
    \hline
    \multicolumn{3}{|l|}{\textbf{结论分析与体会：} } \\
    \multicolumn{3}{|p{14.5cm}|}{\parbox[t][8\baselineskip][t]{\linewidth}{\@reflectioncontent}} \\
    \hline
    \endfirsthead

    % 定义续页的表头
    \multicolumn{3}{c}%
    {{\bfseries \@CourseName 课程实验报告 (续)}} \\
    \hline
    \endhead

    % 定义表格末尾
    \hline
    \endfoot
    
    \end{longtable}
}

