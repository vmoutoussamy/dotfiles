" ================ General Config ====================
scriptencoding utf-8
set encoding=utf-8
set nocompatible                " Use Vim settings, rather then Vi settings
set showmatch                   " Show matching brackets.
set mouse=a                     " Enable mouse usage (all modes)
filetype indent plugin on       " filetype detection, indent and plugin ON
set number                      " Line numbers are good
set backspace=indent,eol,start  " Allow backspace in insert mode
set history=1000                " Store lots of :cmdline history
set showcmd                     " Show incomplete cmds down the bottom
set showmode                    " Show current mode down the bottom
set gcr=a:blinkon0              " Disable cursor blink
set visualbell                  " No sounds
set autoread                    " Reload files changed outside vim
set colorcolumn=100             " was 80 but now 100 characters line lengh marker"
set hidden                      " You can have unwritten changes to a file and still open a new file

" Set the title of the Terminal to the currently open file
set title
function! SetTerminalTitle()
    let titleString = expand('%:t')
    if len(titleString) > 0
        let &titlestring = expand('%:t')
        " this is the format iTerm2 expects when setting the window title
        let args = "\033];".&titlestring."\007"
        let cmd = 'silent !echo -e "'.args.'"'
        execute cmd
        redraw!
    endif
endfunction
autocmd BufEnter * call SetTerminalTitle()

" Incremental search that shows partial matches.
" Automatically switch search to case-sensitive when search query contains an uppercase letter.
set ignorecase
set smartcase
" turn on Highlighting search matches, highlight as you type
set hlsearch
set incsearch

" ================ Indentation ======================

" copy the indentation from the previous line, does not interfere with other
" indentation settings
set autoindent
set smartindent
set smarttab

" Indentation with space softtab, pressing <TAB> will create space
set expandtab
set shiftwidth=2
set softtabstop=2
set shiftround

set wrap       "Wrap lines
set linebreak    "Wrap lines at convenient points

" =============== Spaces ===========================
" Display tabs and trailing spaces visually
set list listchars=tab:»·,trail:•,precedes:<,extends:>
" Show trailing whitepace and spaces before a tab in red:
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/
match ExtraWhitespace /\s\+\%#\@<!$/


" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Color theme ========================
" Color theme (drawing from altercation/vim-colors-solarized Bundle)
syntax enable
set background=light
"force default colorscheme to avoid issue with remote servers
colorscheme default
"colorscheme solarized
"color solarized
" Set the background color of the Highligh search to red
highlight Search ctermbg=181

" ===== SYNTASTIC
"mark syntax errors with :signs
let g:syntastic_enable_signs=1
"automatically jump to the error when saving the file
let g:syntastic_auto_jump=0
"show the error list automatically
let g:syntastic_auto_loc_list=1
"don't care about warnings
let g:syntastic_quiet_warnings=0

vmap <D-j> gj
vmap <D-k> gk
vmap <D-4> g$
vmap <D-6> g^
vmap <D-0> g^
nmap <D-j> gj
nmap <D-k> gk
nmap <D-4> g$
nmap <D-6> g^
nmap <D-0> g^

" Simple re-format for minified Javascript
command! UnMinify call UnMinify()
function! UnMinify()
    %s/{\ze[^\r\n]/{\r/g
    %s/){/) {/g
    %s/};\?\ze[^\r\n]/\0\r/g
    %s/;\ze[^\r\n]/;\r/g
    %s/[^\s]\zs[=&|]\+\ze[^\s]/ \0 /g
    normal ggVG=
endfunction

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()
