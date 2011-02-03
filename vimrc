filetype off 
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set nocompatible " vi compatibility is for losers
set background=dark " dark is good
syntax on
filetype on
filetype plugin on
filetype plugin indent on
set sw=2 " space width 2
set ts=2 " tab width 2
set binary noeol
set number " turns on line numbering
set matchpairs+=<:> " adds matching on <> pairs
set comments=s1:/*,mb:*,ex:*/,f://,b:#,:%,:XCOMM,n:>,fb:-
set backspace=indent,eol,start " fixes the backspace key
set ignorecase " ignore case during search
set smartcase " (unless caps)
set expandtab
set showcmd
set hlsearch " turns on highlight search
set incsearch " incremental search
set autoindent " turns on autoindent
set nostartofline " alters default go to begining of line behavior
set ruler " displays column numbers
set confirm
set clipboard+=unnamed " Yank to go to clipboard
set backup " enable backup files
set backupdir=~/.vim/backup " Vim swp directory
set directory=~/.vim/tmp " temp file directory
set autowrite " Writes on make/shell commands
set showmatch " show matching brackets
set mat=5 " matching blinky
set encoding=utf-8 " utf8 encoding
set report=0 " show a report when N lines were changed.  0 means 'all'
set ls=2 " always show status line
set cursorline " highlight cursor line
set splitbelow splitright
source ~/.vim/abbreviations

" Setup for various TERM types
if $TERM =~ '^xterm.*'
  set t_Co=256
  colorscheme moria
elseif $TERM == 'linux'
  set t_Co=16
elseif $TERM == 'ansi'
  set t_Co=16
  colorscheme desert
else
  set t_Co=16
endif

"dont load csapprox if we no gui support - silences an annoying warning
if !has("gui")
"    let g:CSApprox_loaded = 1    
else
    if has("gui_gnome")
        set term=gnome-256color
        let moria_style = 'black'
        colorscheme moria
    else
        colorscheme moria
        set guitablabel=%M%t
    endif
    if has("gui_mac") || has("gui_macvim")
        set guifont=PanicSans:h13
    endif
    if has("gui_win32") || has("gui_win32s")
        set guifont=Consolas:h12
        set enc=utf-8
    endif
endif

" Set wildcard behavior
set wildmode=longest,list   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~,*.pyc,*.zip,*.gz,*.bz,*.tar,*.jpg,*.png,*.gif,*.avi,*.wmv,*.ogg,*.mp3,*.mov

autocmd FileType mkd set formatoptions=tcroqn2 comments=n:>
autocmd FileType mkd set spell
autocmd FileType c,cpp,java,javascript,python,xml,xhtml,html set shiftwidth=4

" Must have shortcuts
imap jj <Esc>
imap uu _
imap hh =>
imap aa @
let mapleader = ","

" turn of highlight until next search
nnoremap <C-S> :nohl<CR><C-S>

" refresh vimrc
map <Leader>s :source $MYVIMRC<CR>
map <S-Enter> 0<ESC>
map <Enter> o<ESC>

" Command-T
map <Leader>a :CommandT<CR>

" Cycle through buffers
nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>
"move around windows with ctrl key!
map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
"replace all tabs with 2 spaces
map <Leader>r :retab 2<CR> 

" NERDTree
map ,n :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyo$', '\.pyc$', '\.svn[\//]$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\.bak$', '\~$']

" Statusline setup
set statusline=%f\ 
set statusline+=%h%m%r%w
set statusline+=[%{strlen(&ft)?&ft:'none'},
set statusline+=%{strlen(&fenc)?&fenc:&enc},
set statusline+=%{&fileformat}]
set statusline+=%=
set statusline+=%b,0x%-8B\ 
set statusline+=%c,%l/
set statusline+=%L\ %P
" display a warning if &et is wrong, or we have mixed-indenting
set statusline+=%#error#
set statusline+=%{StatuslineTabWarning()}
set statusline+=%*
" Recalculate tab warning when idle and after save
autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning
" return '[&et]' if &et is set wrong
" return '[mixed-indenting]' if spaces and tabs are used to indent
" return an empty string if everything is fine
function! StatuslineTabWarning()
  if !exists("b:statusline_tab_warning")
    let tabs = search('^\t', 'nw') != 0
    let spaces = search('^ ', 'nw') != 0

    if tabs && spaces
      let b:statusline_tab_warning =  '[mixed-indenting]'
    elseif (spaces && !&et) || (tabs && &et)
      let b:statusline_tab_warning = '[&et]'
    else
      let b:statusline_tab_warning = ''
    endif
  endif
  return b:statusline_tab_warning
endfunction

" Tabularize
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

" TComment
if exists(":TComment")
  vmap # :TComment<CR>
endif

" Ruby Debugger
" let g:ruby_debugger_debug_mode = 1
let g:ruby_debugger_progname = 'mvim'
let g:ruby_debugger_builtin_sender = 0