
"""""""""""""""""""" 基本设置 “”“”“”“”“”“”“”“”“”“

set nocompatible    " 去除vi的一致性
filetype on         " 侦测文件类型
syntax enable  	    " 语法高亮
set number          " 设置行号显示
"set cursorline      " 突出显示当前行
"set cursorcolumn    " 突出显示当前列
set showmatch       " 显示括号匹配
" 匹配括号高亮的时间（单位是十分之一秒） 
set matchtime=5 
" 在搜索的时候忽略大小写 
set ignorecase 
set hlsearch        " 搜索高亮
" 在搜索时，输入的词句的逐字符高亮 
set incsearch 
set helplang=cn     " 中文帮助
set confirm         " 在处理未保存或只读文件的时候，弹出确认 
set iskeyword+=_,$,@,%,#,-  " 带有如下符号的单词不要被换行分割
set  nobackup nowritebackup  "禁用备份
set noswapfile 			"禁用交换文件
" 使回格键（backspace）正常处理indent, eol, start等 
set backspace=indent,eol,start
" 允许backspace和光标键跨越行边界 
set whichwrap+=<,>,b,s,[,]

" 命令行与状态行
" -----------------------------------------------------------------------
set laststatus=2                          " 开启状态栏信息
set ruler	  			  " 显示标尺
set showcmd         			  " 显示输入的命令
set cmdheight=1                           " 命令行的高度，默认为1，这里设为2
" 状态行显示的内容 [包括系统平台、文件类型、坐标、所占比例、时间等]
"set statusline=%F%m%r%h%w%=\ [ft=%Y]\ %{\"[fenc=\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\"+\":\"\").\"]\"}\ [ff=%{&ff}]\ [asc=%03.3b]\ [hex=%02.2B]\ [pos=%04l,%04v][%p%%]\ [len=%L]
set statusline=%F%m%r%h%w%=\ %Y\ %{\"\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\"+\":\"\").\"\"}\ %l,%v\ %p%%,%L



"设置粘贴模式
set paste      
set listchars=tab:>-,trail:-


"设置编码
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936  " 写入文件时采用的编码类型
set termencoding=utf-8    " 输出到终端时采用的编码类型
set encoding=utf-8        " 缓存的文本、寄存器、Vim 脚本文件等

" 启用鼠标
set mouse=a         
set selection=exclusive
set selectmode=mouse,key



""""""""""""""""""""" Vundle

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()        " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'davidhalter/jedi-vim'



call vundle#end()            " required
filetype plugin indent on    " 打开文件类型检测 不同的文件采用不同的插件和缩进
""""""""""""""""""""" Vundle


"""""""""""""""""""""""""""""""YouCompleteMe:语句补全插件""""""""""""""""""""""""""
autocmd InsertLeave * if pumvisible() == 0|pclose|endif     "离开插入模式后自动关闭预览窗口
let g:ycm_collect_identifiers_from_tags_files = 1           " 开启YCM基于标签引擎
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释与字符串中的内容也用于补全
let g:syntastic_ignore_files=[".*\.py$"]
let g:ycm_seed_identifiers_with_syntax = 1                  " 语法关键字补全
let g:ycm_complete_in_comments = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'     "配置全局路径
let g:ycm_confirm_extra_conf = 0                            " 关闭加载.ycm_extra_conf.py提示
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']  " 映射按键,没有这个会拦截掉tab, 导致其他插件的tab不能用
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
let g:ycm_complete_in_comments = 1                          " 在注释输入中也能补全
let g:ycm_complete_in_strings = 1                           " 在字符串输入中也能补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释和字符串中的文字也会被收入补全
let g:ycm_show_diagnostics_ui = 0                           " 禁用语法检查
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"      " 回车即选中当前项
nnoremap <c-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>     " 跳转到定义处
let g:ycm_min_num_of_chars_for_completion=2                 " 从第2个键入字符就开始罗列匹配项
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:jedi#popup_on_dot = 0
autocmd FileType python setlocal completeopt-=preview




"python代码缩进PEP8风格
au BufNewFile,BufRead *.py,*.pyw set tabstop=4          " 设置Tab长度为4空格
au BufNewFile,BufRead *.py,*.pyw set softtabstop=4      " 设置按BackSpace的时候可以一次删除掉4个空格 
au BufNewFile,BufRead *.py,*.pyw set shiftwidth=4       " 设置自动缩进长度为4空格
au BufNewFile,BufRead *.py,*.pyw set textwidth=79 	" 行最大宽度
au BufNewFile,BufRead *.py,*.pyw set expandtab 		" 使用空格来替换tab
au BufNewFile,BufRead *.py,*.pyw set smarttab 		" 开启新行时使用智能 tab 缩进
au BufNewFile,BufRead *.py,*.pyw set autoindent         " 设置自动缩进,继承前一行的缩进方式
au BufNewFile,BufRead *.py,*.pyw set smartindent        " 设置智能缩进
au BufNewFile,BufRead *.py,*.pyw set fileformat=unix	" 保存文件格式
au BufNewFile,BufRead *.py,*.pyw set shiftround 
au BufNewFile,BufRead *.py,*.pyw set list                     " 显示Tab符，
au BufNewFile,BufRead *.py,*.pyw set listchars=tab:\|\ ,      " 使用一高亮竖线代替 把符号显示为 |

highlight LeaderTab guifg=#666666   " 设定行首tab为灰色
match LeaderTab /\t/        " 匹配行首tab


"高亮显示行伟不必要的空白字符
highlight Whitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match Whitespace /\s\+$\ \+/

let python_highlight_all=1










""""""""""""""""""""""""""""""""""""新文件标题"""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.py,*.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
    "如果文件类型为.sh文件 
    if &filetype == 'sh' 
        call setline(1,"\#########################################################################") 
        call append(line("."), "\# File Name: ".expand("%"))         
        call append(line(".")+1, "\# Created Time: ".strftime("%c")) 
        call append(line(".")+2, "\#########################################################################") 
        call append(line(".")+3, "\#!/bin/bash") 
        call append(line(".")+4, "") 
    elseif &filetype == 'python'
        call setline(1,"\#########################################################################") 
        call append(line("."), "\# File Name: ".expand("%"))     
        call append(line(".")+1, "\# Created Time: ".strftime("%c")) 
        call append(line(".")+2, "\#########################################################################") 
        call append(line(".")+3, "\#!/usr/bin/env python3") 
        call append(line(".")+4, "\#! -*- coding: utf-8 -*-")
	call append(line(".")+5, "")
	call append(line(".")+6, "")
    else 
        call setline(1, "/*************************************************************************") 
        call append(line("."), "    > File Name: ".expand("%"))        
        call append(line(".")+1, "  > Created Time: ".strftime("%c")) 
        call append(line(".")+2, " ************************************************************************/") 
        call append(line(".")+3, "")
    endif
    if &filetype == 'cpp'
        call append(line(".")+4, "#include<iostream>")
        call append(line(".")+5, "using namespace std;")
        call append(line(".")+6, "")
    endif
    if &filetype == 'c'
        call append(line(".")+4, "#include<stdio.h>")
        call append(line(".")+5, "")
    endif
    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"让vimrc配置变更立即生效,即保存 .vimrc 时自动重启加载
autocmd BufWritePost $MYVIMRC source $MYVIMRC









