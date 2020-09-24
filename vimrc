""""""""""""""""""""""""""""""""""""
" Line
""""""""""""""""""""""""""""""""""""
" turn hybrid line numbers on
set rnu
set  nu

"""""""""""""""""""""""""""""""""""""
" Indents
"""""""""""""""""""""""""""""""""""""
" replace tabs with spaces
set expandtab
" 1 tab = 2 spaces
set tabstop=2 shiftwidth=2

" when deleting whitespace at the beginning of a line, delete 
" 1 tab worth of spaces (for us this is 2 spaces)
set smarttab

" when creating a new line, copy the indentation from the line above
set autoindent

"""""""""""""""""""""""""""""""""""""
" Search
"""""""""""""""""""""""""""""""""""""
" Ignore case when searching
set ignorecase
set smartcase

" highlight search results (after pressing Enter)
set hlsearch

" highlight all pattern matches WHILE typing the pattern
set incsearch

"""""""""""""""""""""""""""""""""""""
" Mix
"""""""""""""""""""""""""""""""""""""
" show the mathing brackets
set showmatch
"""""""""""""""""""""""""""""""""""""
"GO"
"""""""""""""""""""""""""""""""""""""
set rtp+=$GOROOT/misc/vim
filetype plugin indent on
syntax on
""""""""""""""""""""""""""""""""""""
"Statusbar
""""""""""""""""""""""""""""""""""""
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline +=%1*%=%5l%*             "current line
set statusline +=%2*/%L%*               "total lines
set statusline+=\ %l:%c
"set statusline+=\
set laststatus=2
"""""""""""""""""""""""""""""""
"Open a terminal botton
"""""""""""""""""""""""""""""""
"""""""""""""""""""""""
"Plugins"
""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Ned tree
Plug 'preservim/nerdtree'
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin'
" Theme nord-vim
"Plug 'arcticicestudio/nord-vim'
"toggle terminal
Plug 'lkebin/vim-terwin'
"demus Ocean
Plug 'mhartington/oceanic-next'

" Initialize plugin system
call plug#end()

""""""""""""""""""""
"NedTree
""""""""""""""""""""

"abrir si no especifico ningún archivo el dir actual
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"abrir al abrir un dir con vim 
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

"Shortkey
map <F6> :NERDTreeToggle<CR>

"ver archivos ocultos
let NERDTreeShowHidden=1


let g:plug_window = 'noautocmd vertical topleft new'
"cerrar vim si cierro archivos y solo queda nerdtree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif "cerrar vim si cierro archivos y solo queda nerdtree
"Nord-vim
"colorscheme nord
"set t_Co=256
"toggle terminal
nmap <F7> :TerWinToggle <CR>
let g:TerWinSize = 20

"oceanic theme
if (has("termguicolors"))
 set termguicolors
 endif

colorscheme OceanicNext
