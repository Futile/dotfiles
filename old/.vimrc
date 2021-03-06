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
set dir=~/tmp//

" Better command-line completion
set wildmenu
set wildmode=list:longest,full "and some stuff for it

" Show partial commands in the command line
set showcmd

" No highlighting when searching(yess!)
"set nohlsearch
set hlsearch
nnoremap <C-S> :nohlsearch<CR>

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

" Enable mouse in tmux
set ttymouse=xterm2

" Command window height is 2 lines, avoids some 'press Enter to continue' cases
set cmdheight=2

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>

" Indentation options
set shiftwidth=4
set softtabstop=4
set tabstop=4 "to preserve formatting i think
set expandtab
set smarttab "be smart about tabs!
"set cindent "indentation for c-family files

" Also show invisible characters
set list
" set listchars=tab:\ \ ,trail:·
" set listchars=tab:··,trail:·
set listchars=tab:⊳·,trail:·

" Automatic indentation, if the filetype is not known
set autoindent
"set smartindent
set wrap "Wrap long lines!(soft)

" Breakindent, break lines with correct indentation
set breakindent

" also look for a .vimrc in the current directory, safe commands only
set exrc
set secure

" for neovim, maybe works?
let g:python_host_prog='python2'

" -------------------------------
" Plugins
" -------------------------------

" required for vundle
filetype off

" use vundle to manage bundles/plugins.
" do this before setting the colorscheme
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Vundle - Plugin Manager
Plugin 'gmarik/Vundle.vim'

"Library needed for some other scripts
Plugin 'L9'

"Faster than ack
Plugin 'rking/ag.vim'

"vimproc, include early for other scripts
Plugin 'Shougo/vimproc'

"Unite.vim and tags
Plugin 'Shougo/unite.vim'
Plugin 'tsukkee/unite-tag'

"some colorschemes
Plugin 'altercation/vim-colors-solarized'
Plugin 'baskerville/bubblegum'
Plugin 'morhetz/gruvbox'
Plugin 'w0ng/vim-hybrid'
Plugin 'jnurmine/Zenburn'
Plugin 'vim-scripts/wombat256.vim'
Plugin 'xoria256.vim'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'chriskempson/base16-vim'
Plugin 'industry.vim'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'freeo/vim-kalisi'
Plugin 'sjl/badwolf'

"lightline statusline
Plugin 'itchyny/lightline.vim'

"rainbow parentheses
Plugin 'kien/rainbow_parentheses.vim'

augroup rainbow
    au VimEnter * RainbowParenthesesToggle
    au Syntax * RainbowParenthesesLoadRound
    au Syntax * RainbowParenthesesLoadSquare
    au Syntax * RainbowParenthesesLoadBraces
augroup END

"vim easymotion - TODO investigate
Plugin 'Lokaltog/vim-easymotion'

"syntax highlighting and some things for scala files
Plugin 'derekwyatt/vim-scala'

"show 'Match x of y' when searching -- problems with hayabusa14/incsearch
" Plugin 'henrik/vim-indexed-search'

"GUndo script, presents a graphical representation of the vim undo tree
Plugin 'sjl/gundo.vim'

"zoom in a window, 'minimzing' all others. using again toggles back.
Plugin 'regedarek/ZoomWin'

"easy way to switch to a buffer, or delet a buffer/tab.
" Plugin 'jeetsukumaran/vim-buffergator'

"file browser
Plugin 'scrooloose/nerdtree'

"annotations
"Plugin 'scrooloose/syntastic'

"majutsushi's tagbar
Plugin 'majutsushi/tagbar'

"'vim plugin so good its criminal' and runtime files vor vim
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'

"vim dispatch, run commands in background
Plugin 'tpope/vim-dispatch'

"vimshell
Plugin 'Shougo/vimshell'

"vimside bundles
"Plugin 'megaannum/self'
"Plugin 'megaannum/forms'
"Plugin 'megaannum/vimside'

"GLSL highlighting
Plugin 'tikhomirov/vim-glsl'

"HLSL highlighting
Plugin 'beyondmarc/hlsl.vim'

"markdown filetype and syntax
Plugin 'tpope/vim-markdown'

"YCM, best autocompletion? ohhh yes!
Plugin 'Valloric/YouCompleteMe'
"eclim <-> YCM interop
let g:EclimCompletionMethod = 'omnifunc'

"extended C++ syntax highlighting
Plugin 'octol/vim-cpp-enhanced-highlight'

"color highlighting for css
Plugin 'ap/vim-css-color'

"autoformatting
Plugin 'Chiel92/vim-autoformat'

"delete/move/sudowrite etc for unix
Plugin 'tpope/vim-eunuch'

" "gitgutter, show changed lines
" Plugin 'airblade/vim-gitgutter'
" " maybe randomly appearing signs caused by gitgutter?
" let g:gitgutter_realtime = 0

Plugin 'mhinz/vim-signify'

" Signify
let g:signify_sign_add = '+'
let g:signify_sign_change = '⌇' " '︴⌇⌇┇
let g:signify_sign_delete = '✕'
let g:signify_sign_delete_first_line = '⌅'

"allows to switch between header and source file
Plugin 'derekwyatt/vim-fswitch'

"automatically generate source file from header file(updates!)
Plugin 'derekwyatt/vim-protodef'

" vim-hardmode: disable up/down/left/right and hjkl
" Plugin 'wikitopian/hardmode'

"augroup hardmode
    "autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
"augroup END

"automatically-close-brackets-magic
Plugin 'Raimondi/delimitMate'

"automatic toggling of comments
"Plugin 'scrooloose/nerdcommenter'

"seek motion
Plugin 'justinmk/vim-sneak'

"indent guides
" Plugin 'nathanaelkane/vim-indent-guides'

"automatic cursorline/cursorcolumn handling
"DISABLED BECAUSE IT MESSED EVERYTHING UP WHEN HITTING ENTER IN INSERT MODE
"let g:cursorcross_mappings = 0
"Plugin 'mtth/cursorcross.vim'

"vim-tmux integration
Plugin 'benmills/vimux'

"automatic absolute/relative line number toggling
Plugin 'myusuf3/numbers.vim'

":Wipeout all buffers which are not open in a tab/window
Plugin 'wipeout'

" vim unimpaired
Plugin 'tpope/vim-unimpaired'

" repeat.vim, for example for vim-unimpaired
Plugin 'tpope/vim-repeat'

" vim-surround, text-object for surroundings, etc brackets, ", '
Plugin 'tpope/vim-surround'

" vim-abolish, mainly to try out the 'Coercion' feature, which looks nice
Plugin 'tpope/vim-abolish'

" commentary.vim, trying this out instead of nerdcommenter(maybe better
" bindings, less commands)
Plugin 'tpope/vim-commentary'

" vim exchange, easily exchange two regigons of text
Plugin 'tommcdo/vim-exchange'

" vim-go, for go yo
Plugin 'fatih/vim-go'
let g:go_auto_type_info = 1
" do imports on save, will also run fmt
let g:go_fmt_command = "goimports"

Plugin 'godlygeek/csapprox'

" substitute/hl preview
" Plugin 'osyo-manga/vim-over'

" mini buf expl, because nice
" Plugin 'fholgado/minibufexpl.vim'

Plugin 'fdietze/goodday.vim'

" ulti snips
Plugin 'SirVer/ultisnips'

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" multiple cursors!
Plugin 'terryma/vim-multiple-cursors'

" buffers in statusline
Plugin 'bling/vim-bufferline'
let g:bufferline_echo = 0
let g:bufferline_active_buffer_left = ''
let g:bufferline_active_buffer_right = ''
let g:bufferline_show_bufnr = 0

Plugin 'vim-scripts/restore_view.vim'
"matchit already installed, just enable it
runtime macros/matchit.vim

Plugin 'junegunn/goyo.vim'

Plugin 'mattn/flappyvird-vim'

Plugin 'caigithub/a_indent'

Plugin 'wting/rust.vim'

Plugin 'cstrahan/vim-capnp'

" stuff for racer
let g:racer_cmd = "racer"
let $RUST_SRC_PATH="/home/felix/gits/rust/src"

Plugin 'roman/golden-ratio'

Plugin 'emgram769/vim-multiuser'

Plugin 'haya14busa/incsearch.vim'
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

let g:incsearch#auto_nohlsearch = 1

map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

Plugin 'pelodelfuego/vim-swoop'
" <leader>gc <leader>gg <leader>gb

Plugin 'ntpeters/vim-better-whitespace'
au VimEnter * silent ToggleStripWhitespaceOnSave " somehow doesn't work if put into augroup

Plugin 'EinfachToll/DidYouMean'

" required
call vundle#end()

" enable filetype detection/auto indentation
filetype plugin indent on

"disable powerline
let g:powerline_loaded = 1

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

" select last pasted text
" see http://vim.wikia.com/wiki/Selecting_your_pasted_text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" Smart way to move between windows, adjusted for neo!
" in insert mode
" imap ∫ <C-o><C-W>h
" imap ∀ <C-o><C-W>j
" imap Λ <C-o><C-W>k
" imap ∃ <C-o><C-W>l
" this sucked when wanting to really write ∀ etc.
" and in other modes
map ∫ <C-W>h
map ∀ <C-W>j
map Λ <C-W>k
map ∃ <C-W>l

nnoremap ß @q
nnoremap ö :update<CR>
nnoremap ä :q<CR>
nnoremap ü :bd<CR>

" folding with + and -
noremap + za
noremap - zf

" jump to tag (for example in help files)
nnoremap <leader>j <C-]>

" map <leader>n to insert current timestamp
" from: http://dailyvim.tumblr.com/post/102459770753/insert-the-current-time
map <leader>n "=strftime("%FT%T%z")"<CR>Pa<SPACE>

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
nnoremap <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>
map <leader>tv :tabnew ~/.dotfiles/.vimrc<cr>

" Open new tabs in the current buffer's path
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" cd into the directory of our buffer(sets CWD)
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" make Y behave like D and C
map Y y$
" why do I need this as well?
noremap Y y$

function! BuildTags()
    !ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .
endfunction

" shortcut to build ctags
map <C-F11> :call BuildTags()<CR>

augroup go_mappings
    autocmd!
    au FileType go nmap <leader>r :w<CR><bar><Plug>(go-run)
    au FileType go nmap <leader>m :w<CR><bar><Plug>(go-build)
    au FileType go nmap <leader>gt <Plug>(go-test)
    au FileType go nmap <leader>gd <Plug>(go-doc)
    au FileType go nmap <leader>gv <Plug>(go-doc-vertical)
    au FileType go nmap <leader>d <Plug>(go-def)
    au FileType go nmap <leader>v <Plug>(go-vet)
augroup END

" look for tags recursively
set tags=./tags;/

" viminfo settings; remember open buffers on close
set viminfo^=%

" ------------------------------------------------------------------------------------------------------------------
" vim-scripts & bundles
" ------------------------------------------------------------------------------------------------------------------

"*** Unite.vim ***
" fuzzy matcher
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

" start in insert mode by default
let g:unite_enable_start_insert = 1

" key bindings
nnoremap <leader>tt :Unite -buffer-name=tags tag<cr>
nnoremap <leader>f :Unite -no-split -buffer-name=files file_rec/async<cr>
nnoremap <leader>b :Unite -buffer-name=buffers -no-start-insert buffer<cr>
nnoremap <leader>/ :Unite -buffer-name=grep grep:.<cr>

" Use ag for grep
if executable('ag')
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
    let g:unite_source_grep_recursive_opt = ''
endif

" max search candidates (we want everything!)
let g:unite_source_file_rec_max_cache_files = 0
call unite#custom#source('file_rec,file_rec/async', 'max_candidates', 0)

"*** Gundo ***
nnoremap <silent> <F5> :GundoToggle<CR>
let g:gundo_close_on_revert=1

" only-window, toggleable
map <leader>o <C-W>o

" Buffergator
nnoremap <silent> <F4> :BuffergatorToggle<CR>

" NERDTree
nnoremap <silent> <F2> :NERDTreeToggle<CR>
augroup nerdtree
    "autocmd vimenter * if !argc() | NERDTree | endif
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
augroup END

" Syntastic - currently not enabled
"let g:syntastic_always_populate_loc_list=1

" Tagbar
nmap <silent> <F8> :TagbarToggle<CR>

" YouCompleteMe
let g:ycm_extra_conf_globlist = ['~/gits/*', '~/seclab/*', '!~/*']
let g:ycm_allow_changing_updatetime = 0
set updatetime=1000
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
nnoremap <leader>y :YcmCompleter GoToDefinitionElseDeclaration<CR>

" FSwitch
nnoremap <leader>l :FSHere<CR>

" delimitMate
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

" lightline
let g:lightline = {
    \ 'colorscheme': 'jellybeans',
    \ 'active': {
    \   'left': [ [ 'mode' ],
    \             [ 'fugitive', 'readonly', 'filename', 'bufferline'] ]
    \ },
    \ 'component' : {
    \   'bufferline' : '%{bufferline#refresh_status()}%{g:bufferline_status_info.before}%#TabLineSel#%{g:bufferline_status_info.current}%#LightLineLeft_active_1#%{g:bufferline_status_info.after}',
    \ },
    \ 'component_function': {
    \   'fugitive': 'MyFugitive',
    \   'modified': 'MyModified',
    \   'filename': 'MyFilename',
    \   'readonly': 'MyReadonly',
    \   'current_tag': 'MyCurrentTag',
    \ },
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '|', 'right': '|' }
    \ }

function! MyModified()
    return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
    return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! MyFugitive()
    if !exists('*fugitive#head')
        return ''
    endif
    return fugitive#head()
endfunction

function! MyCurrentTag()
    return tagbar#currenttag('%s', '', 'f')
endfunction

function! MyFilename()
  let fname = expand('%')
  return fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ &ft == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != MyGitModified() ? ' ' . MyGitModified() : '') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
"        \ ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
endfunction

function! MyGitModified()
    if !exists('b:git_modified')
        let b:git_modified = ''
    endif
    return b:git_modified
endfunction

function! UpdateGitModified()
    if !exists('*fugitive#head')
        return
    endif
    let full_path = expand('%:p')
    let git_dir = fugitive#extract_git_dir(full_path)
    if empty(git_dir)
        return
    endif
    let work_dir = fnamemodify(git_dir, ':h')
    let status = system("git --git-dir=" . shellescape(git_dir) . " --work-tree="
                \ . shellescape(work_dir) . " status --porcelain "
                \ . shellescape(full_path))
    if status == ''
        let b:git_modified = ''
    else
        let b:git_modified = split(status)[0]
    endif
endfunction

augroup git_modified
    autocmd!
    autocmd BufWritePost * call UpdateGitModified()
    autocmd WinEnter * call UpdateGitModified()
    autocmd WinLeave * call UpdateGitModified()
augroup END

augroup misc
    autocmd!
    autocmd BufReadPost *    " Return to last edit position when opening a file (I want this!)
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

    " git commit msg's always on the first line though, pls
    autocmd BufReadPost *
    \ if @% == '.git/COMMIT_EDITMSG' |
    \   exe "normal gg" |
    \ endif

    autocmd BufEnter *.hh,*.cc,*.h,*.cpp let g:formatprg_args_expr_cpp = '"--mode=c"'

    " apply autoformat and delete trailing empty line
    autocmd BufWritePost *.hh,*.cc,*.h,*.cpp
    \ exec 'Autoformat' |
    \ call TrimEmptyLines()
augroup END

function! TrimEmptyLines()
    let save_cursor = getpos(".")
    :silent! %s#\($\n\s*\)\+\%$##
    call setpos('.', save_cursor)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

" ------------------------------------------------------------------------------------------------------------------
" settings & options
" ------------------------------------------------------------------------------------------------------------------

" set colorscheme AFTER loading runtimepaths using vundle, so all can be found
if has("gui_running")
    colorscheme jellybeans "gvim
elseif $DISPLAY != ''
    " colorscheme goodmorning "terminal in X
    " colorscheme jellybeans "terminal in X
    colorscheme lucius "terminal in X
    " colorscheme badwolf "terminal in X
    " colorscheme kalisi "terminal in X
    " colorscheme Tomorrow-Night "terminal in X
    " colorscheme bubblegum "terminal in X
    " colorscheme wombat256mod "terminal in X
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

" save tabpages though
set ssop+=tabpages

augroup SyntaxAddons
    autocmd!
    autocmd Syntax {cpp,c} runtime syntax/doxygen.vim
augroup END
