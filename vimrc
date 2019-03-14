"""""""""""""""""""" 基本设置 “”“”“”“”“”“”“”“”“”“

syntax on 	    " 语法高亮
set number          " 设置行号显示
set encoding=utf-8  " 设置utf-8编码
set mouse=a         " 启用鼠标
set hlsearch        " 搜索高亮
set ruler	    " 显示标尺
set showcmd         " 显示输入的命令




""""""""""""""""""""" Vundle

set nocompatible    " 去除vi的一致性
filetype on        " 侦测文件类型
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()        " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()            " required
filetype plugin indent on    " required
""""""""""""""""""""" Vundle


" YouCompleteMe:语句补全插件
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"离开插入模式后自动关闭预览窗口"
let g:ycm_collect_identifiers_from_tags_files = 1           " 开启YCM基于标签引擎
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释与字符串中的内容也用于补全
let g:syntastic_ignore_files=[".*\.py$"]
let g:ycm_seed_identifiers_with_syntax = 1                  " 语法关键字补全
let g:ycm_complete_in_comments = 1
let g:ycm_confirm_extra_conf = 0                            " 关闭加载.ycm_extra_conf.py提示
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']  " 映射按键,没有这个会拦截掉tab, 导致其他插件的tab不能用.
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
let g:ycm_complete_in_comments = 1                          " 在注释输入中也能补全
let g:ycm_complete_in_strings = 1                           " 在字符串输入中也能补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释和字符串中的文字也会被收入补全
let g:ycm_show_diagnostics_ui = 0                           " 禁用语法检查
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"      " 回车即选中当前项
nnoremap <c-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>     " 跳转到定义处
let g:ycm_min_num_of_chars_for_completion=2                 " 从第2个键入字符就开始罗列匹配项
" "







let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py' "配置全局路径
let g:ycm_confirm_extra_conf=0   "每次直接加载该文件，不提示是否要加载



"python代码缩进PEP8风格
au BufNewFile,BufRead *.py,*.pyw set tabstop=4 
au BufNewFile,BufRead *.py,*.pyw set softtabstop=4 
au BufNewFile,BufRead *.py,*.pyw set shiftwidth=4 
au BufNewFile,BufRead *.py,*.pyw set textwidth=79 
au BufNewFile,BufRead *.py,*.pyw set expandtab 
au BufNewFile,BufRead *.py,*.pyw set autoindent         "自动对齐
au BufNewFile,BufRead *.py,*.pyw set fileformat=unix
au BufNewFile,BufRead *.py,*.pyw set shiftround 
"对其他文件类型设置au命令
au BufNewFile,BufRead *.js, *.html, *.css set tabstop=2
au BufNewFile,BufRead *.js, *.html, *.css set softtabstop=2
au BufNewFile,BufRead *.js, *.html, *.css set shiftwidth=2

"高亮显示行伟不必要的空白字符
highlight Whitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match Whitespace /\s\+$\ \+/

let python_highlight_all=1




