" we use vim, not vi
set nocompatible

" enable filetype detection/auto indentation
filetype indent plugin on

" we have a fast terminal
set ttyfast

" zsh shell
set shell=zsh

" Keep 1000 lines of history
set history=1000

" Enable autoreading when a file changes somewhere else
set autoread

" Enable line numbers(very important!)
set number

" syntax highlighting
syntax on
syntax enable

" Colorscheme! will probably have to try some here
colorscheme autumn_YorickPeterse
set background=dark

" utf8 by default
set encoding=utf8

" switch form unsaved buffers
set hidden

" no backups(but we keep swapfiles)
set nobackup

" Better command-line completion
set wildmenu
set wildmode=list:longest,full "and some stuff for it

" Show partial commands in the command line
set showcmd

" No highlighting when searching(yess!)
set nohlsearch

" Search acts like modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" smart case sensitive search
set ignorecase
set smartcase

" Show matching brackets, blink for 2/10 of a second
set showmatch
set mat=2

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start
set whichwrap+=<,>,h,l " do i need this?
"set backspace=2 " try this also, supposed to do the same

" Don't automatically move the cursor to the beginning of a line
set nostartofline

" Always keep some lines before and after the cursor visible
set scrolloff=7
set sidescrolloff=7

" Display the cursor position with a ruler
set ruler

" Always display a status line
set laststatus=2

" Ask for saving instead of failing commands
set confirm

" Set visualbell instead of beeping
set visualbell

" And don't do anything for flashing, this disables flashing altogether
set t_vb=

" Enable mouse for all modes
set mouse=a

" Command window height is 2 lines, avoids some 'press Enter to continue' cases
set cmdheight=2

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" I have no idea what this does yet, so fuck it.
" Use <F11> to toggle between 'paste' and 'nopaste'
" set pastetoggle=<F11>

" Indentation options
set shiftwidth=4
set softtabstop=4
set tabstop=8 "to preserve formatting i think
set expandtab
set smarttab "be smart about tabs!

" Also show invisible characters
set list
set listchars=tab:>·,trail:·

" Automatic indentation, if the filetype is not known
set autoindent
set smartindent
set wrap "Wrap long lines!(soft)
" -------------------------------
" Functions
" -------------------------------
function! Browser()
    let line = getline (".")
    let line = matchstr (line, "http[^   ]*")
    exec "!firefox " .line
endfunction

" -------------------------------
" leader stuff, hotkeys and mappings
" -------------------------------

" Use , as a leader
let mapleader = ","
let g:mapleader = ","

" Fast saving - ima try this.
" nmap = map for normal mode(not visual, insert, etc)
nmap <leader>w :w!<cr>

" map ctrl-v to vsplit and ctrl-s to split
map <C-v> :vsplit<cr>
map <C-s> :split<cr>

" map space to search(/), and ctrl-space to backwards search(?)
map <space> /
map <C-@> ?

" Smart way to move between windows - will i have to adjust this for neo? - yes.
map ∫ <C-W>h
map ∀ <C-W>j
map Λ <C-W>k
map ∃ <C-W>l

" Smart way to move between tabs - in NEO! :D
map √ :tabprev<cr>
map ℂ :tabnext<cr>

" Useful mappings for tab-management
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Open new tabs in the current buffer's path
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" cd into the directory of our buffer(sets CWD)
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Return to last edit position when opening a file (I want this!)
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
    
" viminfo settings; remember open buffers on close
set viminfo^=%

" maybe i will keep this(0 moves to first non-blank character)
map 0 ^

" Open browser on url in line
map <leader>b :call Browser ()<cr>
