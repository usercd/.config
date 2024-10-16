
let mapleader="\<space>"

set number
set relativenumber
set t_Co=256  "启用256色
syntax enable
syntax on "语法高亮
set encoding=utf-8

set shiftwidth=4 "设置缩进单位为4个空格
set autoindent "缩进一致
set tabstop=4 "tap键宽度为4个空格
set expandtab "将tap转换为空格
set showmatch "高亮括号
set  ruler "在状态栏显示光标的当前位置（位于哪一行哪一列）

set ignorecase "搜索时忽略大小写
" 如果同时打开了`ignorecase`，那么对于只有一个大写字母的搜索词，将大小写敏感
" 其他情况都是大小写不敏感。比如，搜索`Test`时，将不匹配`test`；搜索`test`时，将匹配`Test`
" set smartcase
set hlsearch "高亮搜索内容
set incsearch "将光标动态跳转到第一个匹配处
"set foldmethod=indent

set autochdir "自动切换工作目录。
"这主要用在一个 Vim 会话之中打开多个文件的情况
"默认的工作目录是打开的第一个文件的目录。
"该配置可以将工作目录自动切换到，正在编辑的文件的目录

"set timeoutlen=300
nnoremap jk <Esc>
inoremap jk <Esc>
vnoremap jk <Esc>
noremap <C-h> <C-w><C-h>
noremap <C-j> <C-w><C-j>
noremap <C-k> <C-w><C-k>
noremap <C-l> <C-w><C-l>
noremap <C-s> :w<enter>

set noswapfile
set noerrorbells "出错时，不要发出响声
set autoread "打开文件监视。如果在编辑过程中文件发生外部改变（比如被别的编辑器编辑了），就会发出提示
packloadall "加载所有插件
silent! helptags ALL "为所有插件加载帮助文档


