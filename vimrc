set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#begin()
Bundle 'gmarik/vundle'
Bundle 'Valloric/YouCompleteMe'
Bundle 'tomasr/molokai'
Bundle 'altercation/vim-colors-solarized'
Bundle 'wombat256.vim'
Bundle 'Wombat'
Bundle 'Railscasts-Theme-GUIand256color'
Bundle 'railscasts'
Bundle 'desert256.vim'
Bundle 'desert.vim'
Bundle 'DoxygenToolkit.vim'
Bundle 'vim-ruby/vim-ruby'
Bundle 'bling/vim-airline'
Bundle 'Yggdroot/indentLine'
  let g:indentLine_color_term=0
  let g:indentLine_noConcealCursor = 1
  let g:indetnLine_char='︙'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'kien/ctrlp.vim'
Bundle 'The-NERD-tree'
Bundle 'majutsushi/tagbar'
Bundle 'matchit.zip'
"Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-rails'
Bundle 'taglist.vim'
"Bundle 'garbas/vim-snipmate'
Bundle 'SirVer/ultisnips'
Bundle 'vimwiki/vimwiki'
  let g:UltiSnipsExpandTrigger="<tab>"
  let g:UltiSnipsJumpForwardTrigger="<tab>"
  let g:UltiSnipsJumpBackwardTrigger="<c-z>"
call vundle#end()
set spell spelllang=en_us
setlocal spell spelllang=en_us,cjk
" 自动语法高亮
if has("syntax")
syntax on
endif
filetype indent on
" Enable mouse usage all modes "使用鼠标
set mouse=a
set background=light
set nocompatible
set backspace=indent,eol,start

let g:solarized_termcolors=256
" 设定配色方案
colorscheme solarized
" 显示行号
set number
" 相对行号 nj/nk跳转
set relativenumber number
au FocusLost * :set norelativenumber number
au FocusGained * :set relativenumber
"插入/普通模式行号区分
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber number
  else
    set relativenumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>


" 突出显示当前行
set cursorline
" 打开状态栏标尺
set ruler
" 设定 tab 长度为 4
autocmd FileType c setlocal shiftwidth=2 tabstop=2
set tabstop=2
set softtabstop=2
set shiftwidth=2
" 设置空格代替tab
set expandtab
" 禁止在搜索到文件两端时重新搜索
" set nowrapscan
" 输入搜索内容时就显示搜索结果
set incsearch
" 插入括号时，短暂地跳转到匹配的对应括号
set showmatch
" 短暂跳转到匹配括号的时间
set matchtime=2
" 显示状态栏 (默认值为 1, 无法显示状态栏)
set laststatus=2
"
"set expandtab
"high light search contex
set hlsearch
" 设置自动对齐缩进：即每行的缩进值与上一行相等；使用 noautoindent 取消设置
set autoindent
set cindent
" 智能对齐方式
set smartindent
set wildmenu

"""""""""""""""""""""""""""""""""
""Tlist setting
"""""""""""""""""""""""""""""""""
nmap <silent> <leader>tt :silent! Tlist<CR>

"设置ctags路径
"let Tlist_Ctags_Cmd = '/usr/local/bin'

"启动vim后自动打开taglist窗口
let Tlist_Auto_Open = 1

"不同时显示多个文件的tag，仅显示一个
let Tlist_Show_One_File = 1

"taglist为最后一个窗口时，退出vim
let Tlist_Exit_OnlyWindow = 1

"taglist窗口显示在右侧，缺省为左侧
"let Tlist_Use_Right_Window =1

"设置taglist窗口大小
"let Tlist_WinHeight = 100
let Tlist_WinWidth = 30

"设置taglist打开关闭的快捷键F7
noremap <F7> :TlistToggle<CR>

"更新ctags标签文件快捷键设置
noremap <F6> :!ctags -R<CR>

""""""""""""""""""""""""""""""""""""""""""""
"cscope setting
""""""""""""""""""""""""""""""""""""""""""'"
if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=0
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb
    set cscopetag
	set cscopequickfix=s-,c-,d-,t-,e-,i-
	"set cscopequickfix=s-,g-,c-,d-,t-,e-,f-,i-
    "set cscopequickfix=s-,c-,d-,t-,e-,i-,g0,f0

    nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR>
    nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR>
    nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR>
    nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR>
    nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>:copen<CR>
    nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:copen<CR>
    nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR>
endif
map <M-F2> :tabnew<CR>
map <F3> :tabnew .<CR>
map <C-F3> : \be
" 设置winmanager
" 设置界面分割
let g:winManagerWindowLayout = "TagList|FileExplorer"
"设置winmanager的宽度，默认为25
let g:winManagerWidth = 30
"定义打开关闭winmanager快捷键为F8
"nmap <silent> <F8> :WMToggle<cr>
"在进入vim时自动打开winmanager
let g:AutoOpenWinManager = 1

" Aireline
let g:ctrlp_map = ',,'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#ctrlp#show_adjacent_modes = 1
"timeoutlen=50
set t_Co=256
"hi Normal ctermbg=NONE
"hi Normal ctermfg=252 ctermbg=none
map <F1> <ESC>
imap <F1> <ESC>
" 防止手滑
nnoremap ： :
cnoremap Q! q!
command Wq wq
command Q q
command WQ wq
command Wqa wqa

"YCM
"youcompleteme  默认tab  s-tab 和自动补全冲突
let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_confirm_extra_conf=0
let g:ycm_global_ycm_extra_conf='~/.vim/ycm_extra_conf_for_C++/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files=1    " 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=1    "从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0 " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1   " 语法关键字补全
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>   "force recomile with syntastic
inoremap <leader><leader> <C-x><C-o>
""在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
set completeopt=longest,menu    "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
nmap <F9> :YcmRestartServer<CR>
" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"Doxygen
" For all keys
let g:DoxygenToolkit_startCommentTag="/*! "
let g:DoxygenToolkit_startCommentBlock="/* "
let g:DoxygenToolkit_paramTag_pre="@param[in/out] "
let g:DoxygenToolkit_returnTag="@return"
"Auto file header
au BufNewFile *.c,*.h,*.hpp,*.cpp,*.cc exec ":call SetTitle()"

func SetCopyRight()
  call setline(1,["/*************************************************************************"," * Copyright (C) [2020-2023] by Cambricon, Inc."," *"," * Permission is hereby granted, free of charge, to any person obtaining a"," * copy of this software and associated documentation files (the"," * \"Software\"), to deal in the Software without restriction, including"," * without limitation the rights to use, copy, modify, merge, publish,"," * distribute, sublicense, and/or sell copies of the Software, and to"," * permit persons to whom the Software is furnished to do so, subject to"," * the following conditions:"," *"," * The above copyright notice and this permission notice shall be included"," * in all copies or substantial portions of the Software."," *"," * THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS"," * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF"," * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT."," * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY"," * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,"," * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE"," * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE."," *************************************************************************/"])
endfunc

func SetAuthor()
  call append(line("$"), ["/*************************************************************************"," * Author: Nan Lin"," * Created Time:".strftime("%c")," * File Name:".expand("%")," * Description: ","*************************************************************************/"])
endfunc

func SetMacro()
  let filepath=expand("%:p")
  let filename=expand("%")
  let path=matchstr(filepath,'magicmind\/\zsmagicmind.*'.filename.'\ze')
  let macro=toupper(tr(path,"/.","__")."_")
  call append(line("$"), ["#ifndef ".macro,"#define ".macro,"namespace magicmind {","}  // namespace magicmind","#endif  // ".macro])
endfunc

func SetNameSpace()
  call append(line("$"), ["namespace magicmind {","}  // namespace magicmind"])
endfunc


func SetTitle()
  call SetCopyRight()
  call SetAuthor()
  if expand("%:e") == 'hpp' || expand("%:e") == 'h'
    call SetMacro()
  endif
  if expand("%:e") == 'cc' || expand("%:e") == 'cpp'
    call SetNameSpace()
  endif
endfunc
