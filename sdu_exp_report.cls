\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sdu_exp_report}[2025/10/16 Shandong University Experiment Report Template]

% 1. 基础类和字体设置
\LoadClass[a4paper, 11pt]{article} % 基于 article 文档类

% 2. 宏包导入 (用于 XeLaTeX 和表格)
\RequirePackage{geometry}     % 设置页边距
\RequirePackage{fontspec}     % 字体控制 (XeLaTeX 必需)
\RequirePackage{xeCJK}        % 中文处理，兼容 xeLaTeX
\RequirePackage{tabularx}     % 可变宽度表格
\RequirePackage{array}        % 自定义列类型
\RequirePackage{multirow}     % 跨行合并
\RequirePackage{hhline}       % 自定义表格线
\RequirePackage{ragged2e}     % 文本对齐控制
\RequirePackage{environ}      % 用于捕获环境内容
\RequirePackage{zhnumber}     % 中文数字和日期
\RequirePackage{ifxetex}
\RequireXeTeX
\ifxetex\else
    \ClassError{sdureport}{You must use the `xelatex' driver. Please choose `xelatex'}{Just choose `xelatex', no `pdflatex' or `latex' and so on.}
\fi
% 3. 几何布局 (页边距)
\geometry{
    top=2.54cm,
    bottom=2.54cm,
    left=3.18cm,
    right=3.18cm
}

% 4. 字体设置 (Noto Sans/Serif CJK SC)
% 请确保您的编译环境中安装了 Noto 字体。
\setCJKmainfont{Noto Serif CJK SC}[
    UprightFont=*,  % 正常字体
    BoldFont=* Bold % 粗体
]
\setCJKsansfont{Noto Sans CJK SC}[
    UprightFont=*,
    BoldFont=* Bold
]
\setCJKmonofont{Noto Sans Mono CJK SC} [
    UprightFont=*,
    BoldFont=* Bold
]
