set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" All themes
Plugin 'Railscasts-Theme-GUIand256color'
Plugin 'desert.vim'
Plugin 'desert256.vim'
Plugin 'tomasr/molokai'
Plugin 'altercation/vim-colors-solarized'
  let g:solarized_termcolors=256
  " 设定配色方案
  colorscheme solarized
Plugin 'jpo/vim-railscasts-theme'
Plugin 'wombat.vim'
" ale
Plugin 'dense-analysis/ale'
  "始终开启标志列
  let g:ale_sig_column_always = 1
  let g:ale_set_highlights = 1
  let g:ale_sign_error = "E"
  let g:ale_sign_warning = "W"
  "vim自带状态栏中整合ale
  let g:ale_statusline_format = ['XXH  %d','W  %d','OK']
  "显示linter名称,出错或警告等相关信息
  let g:ale_echo_msg_error_str = "E"
  let g:ale_echo_msg_warning_str = "W"
  let g:ale_echo_msg_format = '[%linter%] %s [%serverity%]'
  "只有保存时才进行语法检测
  let g:ale_lint_on_text_changed = "never"
  let g:ale_lint_on_insert_leave = 0
  let g:ale_lint_on_enter = 1
  let g:ale_linters = {
                          \'c':['clang'],
                          \'c++':['clang'],
                          \}
  "前、后一个错误或警告
  nmap sp <Plug>(ale_previous_wrap)
  nmap np <Plug>(ale_next_wrap)
  "开启／关闭语法检查
  nmap <Leader>s :ALEToggle<CR>
  "查看详细信息
  nmap <Leader>d :ALEDetail<CR>
" YCM
Plugin 'Valloric/YouCompleteMe'
  " youcompleteme  默认tab  s-tab 和自动补全冲突
  let g:ycm_key_list_select_completion=['<c-n>']
  let g:ycm_key_list_select_completion = ['<Down>']
  let g:ycm_key_list_previous_completion=['<c-p>']
  let g:ycm_key_list_previous_completion = ['<Up>']
  let g:ycm_confirm_extra_conf=0
  let g:ycm_global_ycm_extra_conf='~/.vim/ycm_extra_conf_for_C++/.ycm_extra_conf.py'
  let g:ycm_collect_identifiers_from_tags_files=1    " 开启 YCM 基于标签引擎
  let g:ycm_min_num_of_chars_for_completion=5    "从第2个键入字符就开始罗列匹配项
  let g:ycm_seed_identifiers_with_syntax=1   " 语法关键字补全
  " disable ycm 语法检查
  let g:ycm_enable_diagnostic_signs = 0
  let g:ycm_enable_diagnostic_highlighting = 0
  " ycmd setting
  let g:ycm_error_symbol = 'K'
  let g:ycm_warning_symbol = 'O'
  inoremap <leader><leader> <C-x><C-o>
  ""在注释输入中也能补全
  let g:ycm_complete_in_comments = 1
  "在字符串输入中也能补全
  let g:ycm_complete_in_strings = 1
  "注释和字符串中的文字也会被收入补全
  let g:ycm_collect_identifiers_from_comments_and_strings = 0
  set completeopt=longest,menu    "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
  nmap <F9> :YcmRestartServer<CR>
" fugitive for git support in vim
Plugin 'tpope/vim-fugitive'
" rainbow parentheses
Plugin 'kien/rainbow_parentheses.vim'
  au VimEnter * RainbowParenthesesToggle
  au Syntax * RainbowParenthesesLoadRound
  au Syntax * RainbowParenthesesLoadSquare
  au Syntax * RainbowParenthesesLoadBraces
" modified Doxygen toolkit for comment gen
Plugin 'DoxygenToolkit.vim'
  " For all keys
  let g:DoxygenToolkit_startCommentTag="/*! "
  let g:DoxygenToolkit_startCommentBlock="/* "
  let g:DoxygenToolkit_paramTag_pre="@param[in/out] "
  let g:DoxygenToolkit_returnTag="@return"
Plugin 'kien/ctrlp.vim'
  let g:ctrlp_map = ',,'
" gutentags
Plugin 'ludovicchabant/vim-gutentags'
  " gutentags搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归 "
  let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']
  " 所生成的数据文件的名称 "
  let g:gutentags_ctags_tagfile = '.tags'
  " 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录 "
  let s:vim_tags = expand('~/.cache/tags')
  let g:gutentags_cache_dir = s:vim_tags
  " 检测 ~/.cache/tags 不存在就新建 "
  if !isdirectory(s:vim_tags)
    silent! call mkdir(s:vim_tags, 'p')
  endif
  set tags+=~/.cache/tags
  " 配置 ctags 的参数 "
  let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
  let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
  let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
  let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']
" tagbar
Plugin 'majutsushi/tagbar'
  autocmd VimEnter * nested :TagbarOpen | wincmd p
  nmap <F7> :TagbarToggle<CR>
  let g:tagbar_autofocus = 0
  let g:tagbar_ctags_bin = 'ctags'
  let g:tagbar_left = 1
" vim-airline
" will automatic load ctrlp and tagbar
Plugin 'vim-airline/vim-airline'
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#branch#enabled=1
  let g:airline#extensions#ctrlp#show_adjacent_modes = 1
  " xshell color
  set t_Co=256
" indentLine
Plugin 'Yggdroot/indentLine'
  let g:indentLine_color_term=0
  let g:indentLine_noConcealCursor = 1
  let g:indetnLine_char='︙'
" matchit for % in config
Plugin 'matchit.zip'
" bufexplorer
Plugin 'jlanzarotta/bufexplorer'
  nnoremap <F6> :ToggleBufExplorer<CR>
Plugin 'preservim/nerdtree'
  nnoremap <F3> :NERDTreeToggle<CR>
  let NERDTreeMapOpenInTab='<ENTER>'
"  autocmd StdinReadPre * let s:std_in=1
"  autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
"  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
"        \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
" Trailing whitespace to be highlighted in red.
Plugin 'bronson/vim-trailing-whitespace'
" change surround
Plugin 'tpope/vim-surround'
Plugin 'SirVer/ultisnips'
  let g:UltiSnipsExpandTrigger="<tab>"
  let g:UltiSnipsJumpForwardTrigger="<tab>"
  let g:UltiSnipsJumpBackwardTrigger="<c-z>"
Plugin 'vimwiki/vimwiki'
call vundle#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
" file type detection on/indent on
filetype indent on
" 拼写检查
set spell spelllang=en_us
setlocal spell spelllang=en_us,cjk
" 自动语法高亮
if has("syntax")
syntax on
endif
" Enable mouse usage all modes "使用鼠标
set mouse=a
set background=light
set backspace=indent,eol,start
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
"set expandtab
"high light search contex
set hlsearch
" 设置自动对齐缩进：即每行的缩进值与上一行相等；使用 noautoindent 取消设置
set autoindent
set cindent
" 智能对齐方式
set smartindent
set wildmenu
map <F1> <ESC>
imap <F1> <ESC>
" 防止手滑
nnoremap ： :
cnoremap Q! q!
command Wq wq
command Q q
command WQ wq
command Wqa wqa
" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
