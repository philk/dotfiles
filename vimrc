filetype off 
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'tpope/vim-fugitive'
Bundle 'altercation/vim-colors-solarized'
Bundle 'scrooloose/nerdtree'
Bundle 'msanders/snipmate.vim'
Bundle 'mileszs/ack.vim'
Bundle 'hallettj/jslint.vim'
Bundle 'juvenn/mustache.vim'
Bundle 'rstacruz/sparkup'
Bundle 'godlygeek/tabular'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-surround'
Bundle 'gregsexton/gitv'
Bundle 't9md/vim-chef'
Bundle 'kchmck/vim-coffee-script'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'mutewinter/LustyJuggler'
Bundle 'mutewinter/vim-indent-guides'
Bundle 'Raimondi/delimitMate'
Bundle 'pangloss/vim-javascript'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-commentary'
Bundle 'scrooloose/syntastic'
Bundle 'tangledhelix/vim-octopress'
Bundle 'Lokaltog/vim-powerline'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'tsaleh/vim-matchit'

Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'JSON.vim'
Bundle 'git://git.wincent.com/command-t.git'

set nocompatible " vi compatibility is for losers
set background=dark " dark is good
syntax on
filetype on
filetype plugin on
filetype plugin indent on
set shiftwidth=2 " space width 2
set tabstop=2 " tab width 2
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
set undodir=~/.vim/undo
set autowrite " Writes on make/shell commands
set showmatch " show matching brackets
set mat=5 " matching blinky
set encoding=utf-8 " utf8 encoding
set report=0 " show a report when N lines were changed.  0 means 'all'
set ls=2 " always show status line
set cursorline " highlight cursor line
set splitbelow splitright
set nofoldenable  "dont fold by default
source ~/.vim/abbreviations

" Show trailing whitespace or tag/space in blinding red
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufWinEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/
au BufWinLeave * call clearmatches()

" Use Node.js for JavaScript interpretation
let $JS_CMD='node'

" Setup for various TERM types
if $TERM =~ '^xterm.*' || $TERM == 'screen-256color'
  set t_Co=256
  colorscheme solarized
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
        colorscheme solarized
    else
        colorscheme solarized
        set guitablabel=%M%t
    endif
    if has("gui_mac") || has("gui_macvim")
        set guifont="Menlo":h11
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

" Tabularize
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

" Ruby Debugger
" let g:ruby_debugger_debug_mode = 1
let g:ruby_debugger_progname = 'mvim'
let g:ruby_debugger_builtin_sender = 0

" JSON tidy'er
" install with: cpan JSON::XS
" http://visibletrap.blogspot.com/2010/05/vim-how-to-format-and-syntax-highlight.html
map <leader>jt  <Esc>:%!json_xs -f json -t json-pretty<CR>

" Markdown preview
imap <leader>p <ESC>:w!<CR>:!markdown % > %.html && open %.html<CR><CR>a
map  <leader>p <ESC>:w!<CR>:!markdown % > %.html && open %.html<CR><CR>a

" Chef switcher
au BufNewFile,BufRead */cookbooks/*  call s:SetupChef()
function! s:SetupChef()
    nnoremap <buffer> <silent> <C-w><C-w>    :<C-u>ChefDoWhatIMean<CR>
    nnoremap <buffer> <silent> <C-w><C-f>    :<C-u>ChefDoWhatIMeanSplit<CR>
endfunction

" LustyJuggler
nnoremap <leader>, :LustyJugglePrevious<CR>
let g:LustyJugglerShowKeys=1 " Show numbers for Lusty Buffers
let g:LustyJugglerSuppressRubyWarning=1

" Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2

" FuzzyFinder shortcuts
nmap <leader>ff <ESC>:FufFile<CR>
nmap <leader>fl <ESC>:FufLine<CR>
nmap <leader>fb <ESC>:FufBuffer<CR>

" Powerline
let g:Powerline_symbols="fancy"

" JSON.vim settings
augroup json_autocmd
  autocmd!
  autocmd FileType json set autoindent
  autocmd FileType json set formatoptions=tcq2l
  autocmd FileType json set textwidth=78 shiftwidth=2
  autocmd FileType json set softtabstop=2 tabstop=8
  autocmd FileType json set expandtab
  autocmd FileType json set foldmethod=syntax
augroup END