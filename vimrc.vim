""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"   Sina Khorami
"
"
""""""""""""""""""""""""""""""""""""""""
" Plugins Install
""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'preservim/nerdcommenter'
Plug 'dense-analysis/ale'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'posva/vim-vue'
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'mattn/emmet-vim'
Plug 'ap/vim-css-color'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

call plug#end()


""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""

" Auto read when file changes from outside
set autoread
au FocusGained,BufEnter * checktime

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Highlight search
set hlsearch

" Split window direction
set splitbelow
set splitright

" Ignore case when searching
set ignorecase

" Show line number
set number

" Highlight current line
set cursorline

" Enable filetype plugins
filetype plugin on
filetype indent on

" Ignore compiled and temporary files & folders
set wildignore=*.o,*~,*.pyc,*.so,*.swp,*.zip,*/tmp/*,*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/vendor,*/node_modules/*,*/dist/*,*/venv/*


""""""""""""""""""""""""""""""""""""""""
" Theme, Colors & Fonts
""""""""""""""""""""""""""""""""""""""""

" Enable Syntax highlighting
syntax enable

" Enable 256 colors pallete in terminal
set t_Co=256
set background=dark

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Select color scheme
colorscheme kuroi
" colorscheme dracula

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Set font
set guifont=DroidSansMono\ 10


""""""""""""""""""""""""""""""""""""""""
" Files, Backups & Undo
""""""""""""""""""""""""""""""""""""""""

" Turn backup off
set nobackup
set nowb
set noswapfile


""""""""""""""""""""""""""""""""""""""""
" Text, Tab & Indent
""""""""""""""""""""""""""""""""""""""""

" Use spaces instead of tabs and be smart!
set expandtab
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Line break on 120 characters
set foldmethod=indent
set textwidth=119
set foldlevel=119
set colorcolumn=119

" Set auto & smart indent
set autoindent
set smartindent

" Wrap lines
set wrap


""""""""""""""""""""""""""""""""""""""""
" NERDTree Config
""""""""""""""""""""""""""""""""""""""""

" Start NERDTree and leave the cursor in it if file not specified
autocmd VimEnter * if argc() == 0 | NERDTree | endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Ignore files and folders
let NERDTreeIgnore=['venv', 'node_modules', '\.pyc$', '\~$', '^__pycache__$', '\.egg-info$', '^build$', '^dist$', '\.so$', '\.o$']

" Map keys
map \ :NERDTreeToggle<cr>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
map cc <Plug>NERDCommenterToggle

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" NERDCommenter compatibility with vue
let g:ft = ''
function! NERDCommenter_before()
  if &ft == 'vue'
    let g:ft = 'vue'
    let stack = synstack(line('.'), col('.'))
    if len(stack) > 0
      let syn = synIDattr((stack)[0], 'name')
      if len(syn) > 0
        exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
      endif
    endif
  endif
endfunction
function! NERDCommenter_after()
  if g:ft == 'vue'
    setf vue
    let g:ft = ''
  endif
endfunction


""""""""""""""""""""""""""""""""""""""""
" ALE Config
""""""""""""""""""""""""""""""""""""""""

" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 0

" Fixing
let g:ale_fixers = {
    \ '*': ['remove_trailing_lines', 'trim_whitespace'],
    \ 'javascript': ['eslint'],
    \ }


""""""""""""""""""""""""""""""""""""""""
" CtrlP Config
""""""""""""""""""""""""""""""""""""""""

" Persist cache files between sessions
let g:ctrlp_clear_cache_on_exit = 0


""""""""""""""""""""""""""""""""""""""""
" Emmet Config
""""""""""""""""""""""""""""""""""""""""

" Set emmet expand key
let g:user_emmet_expandabbr_key = '<tab>'

" Enable emmet only on these files
let g:user_emmet_install_global = 0
autocmd FileType html,css,vue EmmetInstall


""""""""""""""""""""""""""""""""""""""""
" Markdown Config
""""""""""""""""""""""""""""""""""""""""

" Set folding key
nnoremap <space> za


""""""""""""""""""""""""""""""""""""""""
" Lightline Config
""""""""""""""""""""""""""""""""""""""""

let g:lightline = {
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'gitbranch#name'
    \ },
    \ }


""""""""""""""""""""""""""""""""""""""""
" Custom file local settings
""""""""""""""""""""""""""""""""""""""""

" js, css , HTML
au BufNewFile,BufRead *.js,*.json,*.html,*.css,*.styl,*.scss,*.ts,*.cshtml,*.vue
    \ setlocal noexpandtab |
    \ setlocal tabstop=2 |
    \ setlocal softtabstop=2 |
    \ setlocal shiftwidth=2 |

