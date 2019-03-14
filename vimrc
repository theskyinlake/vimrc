
"""""""""""""""""""" 基本设置 “”“”“”“”“”“”“”“”“”“

set nocompatible    " 去除vi的一致性
filetype on         " 侦测文件类型
syntax on 	    " 语法高亮
set number          " 设置行号显示
set cursorline      " 突出显示当前行
set cursorcolumn    " 突出显示当前列
set showmatch       " 显示括号匹配
set hlsearch        " 搜索高亮
set ruler	    " 显示标尺
set laststatus=2    " 总是显示状态栏
set showcmd         " 显示输入的命令
set helplang=cn     " 中文帮助
set confirm         " 在处理未保存或只读文件的时候，弹出确认 
set iskeyword+=_,$,@,%,#,-  " 带有如下符号的单词不要被换行分割

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

"让vimrc配置变更立即生效,即保存 .vimrc 时自动重启加载
autocmd BufWritePost $MYVIMRC source $MYVIMRC


""""""""""""""""""""" Vundle

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()        " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()            " required
filetype plugin indent on    " 打开文件类型检测
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

"python代码缩进PEP8风格
au BufNewFile,BufRead *.py,*.pyw set tabstop=4          " 设置Tab长度为4空格
au BufNewFile,BufRead *.py,*.pyw set softtabstop=4      " 设置按BackSpace的时候可以一次删除掉4个空格 
au BufNewFile,BufRead *.py,*.pyw set shiftwidth=4       " 设置自动缩进长度为4空格
au BufNewFile,BufRead *.py,*.pyw set textwidth=79 
au BufNewFile,BufRead *.py,*.pyw set expandtab 		" 使用空格来替换tab
au BufNewFile,BufRead *.py,*.pyw set smarttab 		" 开启新行时使用智能 tab 缩进
au BufNewFile,BufRead *.py,*.pyw set autoindent         " 设置自动缩进,继承前一行的缩进方式
au BufNewFile,BufRead *.py,*.pyw set smartindent        " 设置智能缩进
au BufNewFile,BufRead *.py,*.pyw set fileformat=unix
au BufNewFile,BufRead *.py,*.pyw set shiftround 
au BufNewFile,BufRead *.py,*.pyw set list                     " 显示Tab符，
au BufNewFile,BufRead *.py,*.pyw set listchars=tab:\|\ ,      " 使用一高亮竖线代替 把符号显示为 |

highlight LeaderTab guifg=#666666   " 设定行首tab为灰色
match LeaderTab /\t/        " 匹配行首tab


"高亮显示行伟不必要的空白字符
highlight Whitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match Whitespace /\s\+$\ \+/



let python_highlight_all=1











"""""新文件标题
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.py文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.py,*.pyw exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
	"如果文件类型为.sh文件 
	if &filetype == 'sh' 
		call setline(1, "##########################################################################") 
		call append(line("."), "# File Name: ".expand("%")) 
		call append(line(".")+1, "# Author: theskyinlake") 
		call append(line(".")+2, "# mail: theskyinlake@qq.com") 
		call append(line(".")+3, "# Created Time: ".strftime("%c")) 
		call append(line(".")+4, "#########################################################################") 
		call append(line(".")+5, "#!/bin/zsh")
		call append(line(".")+6, "PATH=/home/edison/bin:/home/edison/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/work/tools/gcc-3.4.5-glibc-2.3.6/bin")
		call append(line(".")+7, "export PATH")
		call append(line(".")+8, "")	
	endif
	if &filetype == 'cpp'
		call setline(1, "/*************************************************************************") 
		call append(line("."), "	> File Name: ".expand("%")) 
		call append(line(".")+1, "	> Author: theskyinlake") 
		call append(line(".")+2, "	> Mail: theskyinlake@qq.com ") 
		call append(line(".")+3, "	> Created Time: ".strftime("%c")) 
		call append(line(".")+4, " ************************************************************************/") 
		call append(line(".")+5, "")
		call append(line(".")+6, "#include<iostream>")
    		call append(line(".")+7, "using namespace std;")
		call append(line(".")+8, "")
	endif
	if &filetype == 'c'
		call setline(1, "/*************************************************************************") 
		call append(line("."), "	> File Name: ".expand("%")) 
		call append(line(".")+1, "	> Author: theskyinlake") 
		call append(line(".")+2, "	> Mail: theskyinlake@qq.com ") 
		call append(line(".")+3, "	> Created Time: ".strftime("%c")) 
		call append(line(".")+4, " ************************************************************************/") 
		call append(line(".")+5, "")
		call append(line(".")+6, "#include<stdio.h>")
		call append(line(".")+7, "")
	endif
	if &filetype == 'python'
		call setline(1, "#########################################################################") 
		call append(line("."), "# File Name: ".expand("%")) 
		call append(line(".")+1, "# Author: theskyinlake") 
		call append(line(".")+2, "# mail: theskyinlake@qq.com") 
		call append(line(".")+3, "# Created Time: ".strftime("%c")) 
		call append(line(".")+4, "#########################################################################") 
		call append(line(".")+5, "")
		call append(line(".")+6, "#!/usr/bin/env python3")
    		call append(line(".")+7, "# -*- coding: utf-8 -*-")
		call append(line(".")+8, "")
		call append(line(".")+9, "import ")
		call append(line(".")+10, "")
	endif
	"新建文件后，自动定位到文件末尾
	autocmd BufNewFile * normal G
endfunc 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""









