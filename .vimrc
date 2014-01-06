" we use vim, not vi
set nocompatible

" we have a fast terminal
set ttyfast

" zsh shell
set shell=zsh

" we use a 256 color terminal(i hope)
set t_Co=256

" Keep 1000 lines of history
set history=1000

" Enable autoreading when a file changes somewhere else
set autoread

" Enable line numbers(very important!)
set number

" syntax highlighting
syntax on
syntax enable

" Dark Background, usually the colorscheme sets this, but who knows. also 8
" color terminals.
set background=dark

" utf8 by default
set encoding=utf8

" switch from unsaved buffers
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

" Underline current line
set cursorline

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
set pastetoggle=<F11>

" Indentation options
set shiftwidth=4
set softtabstop=4
set tabstop=8 "to preserve formatting i think
set expandtab
set smarttab "be smart about tabs!
set cindent "indentation for c-family files

" Also show invisible characters
set list
set listchars=tab:>·,trail:·

" Automatic indentation, if the filetype is not known
set autoindent
set smartindent
set wrap "Wrap long lines!(soft)

" -------------------------------
" Plugins
" -------------------------------

" required for vundle
filetype off

" use vundle to manage bundles/plugins.
" do this before setting the colorscheme
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"Vundle - Plugin Manager
Bundle 'gmarik/vundle' 

"Library needed for some other scripts
Bundle 'L9'

"vimproc, include early for other scripts
Bundle 'Shougo/vimproc'

"Unite.vim and tags
Bundle 'Shougo/unite.vim'
Bundle 'tsukkee/unite-tag'

"some colorschemes
Bundle 'altercation/vim-colors-solarized'
Bundle 'morhetz/gruvbox'
Bundle 'w0ng/vim-hybrid'

"rainbow parentheses
Bundle 'oblitum/rainbow'

"vim easymotion - TODO investigate
Bundle 'Lokaltog/vim-easymotion'

"syntax highlighting and some things for scala files
Bundle 'derekwyatt/vim-scala'

"show 'Match x of y' when searching
Bundle 'henrik/vim-indexed-search'

"GUndo script, presents a graphical representation of the vim undo tree
Bundle 'sjl/gundo.vim'

"zoom in a window, 'minimzing' all others. using again toggles back.
Bundle 'vim-scripts/ZoomWin'

"easy way to switch to a buffer, or delet a buffer/tab.
Bundle 'jeetsukumaran/vim-buffergator'

"file browser
Bundle 'scrooloose/nerdtree'

"annotations
Bundle 'scrooloose/syntastic'

"majutsushi's tagbar
Bundle 'majutsushi/tagbar'

"'vim plugin so good its criminal'
Bundle 'tpope/vim-fugitive'

"vim dispatch, run commands in background
Bundle 'tpope/vim-dispatch'

"vimshell
Bundle 'Shougo/vimshell'

"vimside bundles
"Bundle 'megaannum/self'
"Bundle 'megaannum/forms' 
"Bundle 'megaannum/vimside'

"GLSL highlighting
Bundle 'tikhomirov/vim-glsl'

"HLSL highlighting
Bundle 'beyondmarc/hlsl.vim'

"markdown filetype and syntax
Bundle 'tpope/vim-markdown'

"YCM, best autocompletion? ohhh yes!
Bundle 'Valloric/YouCompleteMe'

"extended C++ syntax highlighting
Bundle 'octol/vim-cpp-enhanced-highlight'

"color highlighting for css
Bundle 'ap/vim-css-color'

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
let mapleader = " "
let g:mapleader = " "

" Fast saving - ima try this.
" nmap = map for normal mode(not visual, insert, etc)
nmap <leader>w :w<cr>
nmap <leader>q :q<cr>
nmap <leader>x :x<cr>

" Easily save files opened as a user with sudo
nmap <leader>sw :silent :w !sudo tee % > /dev/null<cr>:edit!<cr>

" Smart way to move between windows, adjusted for neo!
" in insert mode
imap ∫ <C-o><C-W>h
imap ∀ <C-o><C-W>j
imap Λ <C-o><C-W>k
imap ∃ <C-o><C-W>l
" and in other modes
map ∫ <C-W>h
map ∀ <C-W>j
map Λ <C-W>k
map ∃ <C-W>l

" Smart way to move between tabs - in NEO! :D
" in insert mode
imap √ <C-o>:tabprev<cr>
imap ℂ <C-o>:tabnext<cr>
" in other modes
map √ :tabprev<cr>
map ℂ :tabnext<cr>
" other tab commands
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
"map <leader>tm :tabmove<cr>

" Open new tabs in the current buffer's path
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" cd into the directory of our buffer(sets CWD)
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" shortcut to build ctags
map <C-F11> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" look for tags recursively
set tags=./tags;/

" Return to last edit position when opening a file (I want this!)
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" viminfo settings; remember open buffers on close
set viminfo^=%

" ------------------------------------------------------------------------------------------------------------------
" vim-scripts & bundles
" ------------------------------------------------------------------------------------------------------------------

" Unite.vim
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>tt :Unite -buffer-name=tags -start-insert tag<CR>
nnoremap <leader>f :Unite -no-split -buffer-name=files -start-insert file_rec/async:!<cr>
nnoremap <leader>b :Unite -no-split -buffer-name=buffers -start-insert buffer<cr>

" Gundo
nnoremap <silent> <F5> :GundoToggle<CR>
let g:gundo_close_on_revert=1

" only-window, toggleable
map <leader>o <C-W>o

" Buffergator
nnoremap <silent> <F4> :BuffergatorToggle<CR>

" NERDTree
nnoremap <silent> <F2> :NERDTreeToggle<CR>
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Syntastic
let g:syntastic_always_populate_loc_list=1

" Tagbar
nmap <F8> :TagbarToggle<CR>

" YouCompleteMe
let g:ycm_extra_conf_globlist = ['~/gits/*','!~/*']
let g:ycm_allow_changing_updatetime = 0
set updatetime=1000
nnoremap <leader>y :YcmCompleter GoToDefinitionElseDeclaration<CR>

" set colorscheme AFTER loading runtimepaths using vundle, so all can be found
if has("gui_running")
    colorscheme jellybeans "gvim
elseif $DISPLAY != ''
    colorscheme jellybeans "terminal in X
else
    colorscheme default "terminal without X
endif

" guioptions
if has("gui_running")
    set guioptions= "clear guioptions
    set guioptions+=a "auto-something
    set guioptions+=c "simple dialogs in commandline instead of popup windows
    set guioptions+=i "show icon
"default is: aegimrLtT

    set guifont=Inconsolata\ 10
endif

" DON'T save global options in session file(so changes to .vimrc take effect)
set ssop-=options

" enable filetype detection/auto indentation
filetype indent plugin on
