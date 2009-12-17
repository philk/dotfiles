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
set backupdir=~/.vimback " Vim swp directory
set directory=~/.vimtemp " temp file directory
set autowrite " Writes on make/shell commands
set showmatch " show matching brackets
set mat=5 " matching blinky
set encoding=utf-8 " utf8 encoding
set report=0 " show a report when N lines were changed.  0 means 'all'
set ls=2 " always show status line
set cursorline " highlight cursor line
set splitbelow splitright


" Set wildcard behavior
set wildmode=longest,list   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~,*.pyc,*.zip,*.gz,*.bz,*.tar,*.jpg,*.png,*.gif,*.avi,*.wmv,*.ogg,*.mp3,*.mov

autocmd FileType mkd set formatoptions=tcroqn2 comments=n:>
autocmd FileType mkd set spell
autocmd FileType c,cpp,java,javascript,python,xml,xhtml,html set shiftwidth=4

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

" when using list, keep tabs at their full width and display `arrows':
" (Character 187 is a right double-chevron, and 183 a mid-dot.)
execute 'set listchars+=tab:' . nr2char(187) . nr2char(183)
"check if file is written to elsewhere and ask to reload immediately, not when
"saving
au CursorHold * checktime

source ~/.vim/abbreviations

imap jj <Esc>
imap uu _
imap hh =>
imap aa @

" turn of highlight until next search
nnoremap <C-S> :nohl<CR><C-S>
" run ruby <current file> with F5
map <F5> :!ruby %<CR>
" refresh vimrc
map <Leader>s :source $MYVIMRC<CR>
map ,n :NERDTreeToggle<CR>
map <S-Enter> 0<ESC>
map <Enter> o<ESC>
" refresh FuzzyFileFinder
map <Leader>f :ruby finder.rescan!<CR>
" MacVim keys
map <D-q> :mksession! ~/.vim/.session<CR>
map <D-w> :tabclose<CR>
map <D-t> :tabnew<CR>
map <D-}> :tabn<CR>
map <D-}> :tabp<CR>
nmap <D-]> >>
vmap <D-]> >>
imap <D-]> <C-O>>>
nmap <D-[> <<
vmap <D-[> <<
imap <D-[> <C-O><<
" Help keys
nnoremap <F1> :help<Space>
vmap <F1> <C-C><F1>
omap <F1> <C-C><F1>
map! <F1> <C-C><F1>
" Cycle through buffers
nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>
"move around windows with ctrl key!
map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
"replace all tabs with 4 spaces
map <Leader>t :retab 2<CR> 

" Erlang
let g:erlangFold=0

" NERDTree
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyo$', '\.pyc$', '\.svn[\//]$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\.bak$', '\~$']

" Syntastic
let g:syntastic_enable_signs=1

" FuzzyFinder
map ,f :FuzzyFinderTextMate<CR>
map ,b :FuzzyFinderBuffer<CR>
let g:fuzzy_ignore = &wildignore
let g:fuzzy_matching_limit = 70
let g:fuzzy_ceiling = 50000

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

" Specky setup
let g:speckyBannerKey = "<C-S>b"
let g:speckyQuoteSwitcherKey = "<C-S>'"
let g:speckyRunRdocKey = "<C-S>r"
let g:speckySpecSwitcherKey = "<C-S>x"
let g:speckyRunSpecKey = "<C-S>s"
let g:speckyRunSpecCmd = "spec -fs"
let g:speckyRunRdocCmd = "fri -L -f plain"
let g:speckyWindowType = 2

"snipmate setup
try
  source ~/.vim/support_functions.vim
catch
  source $HOMEPATH\vimfiles\snippets\support_functions.vim
endtry
autocmd vimenter * call s:SetupSnippets()
function! s:SetupSnippets()

    "if we're in a rails env then read in the rails snippets
    if filereadable("./config/environment.rb")
        call ExtractSnips("~/.vim/snippets/ruby-rails", "ruby")
        call ExtractSnips("~/.vim/snippets/eruby-rails", "eruby")
    endif

    call ExtractSnips("~/.vim/snippets/html", "eruby")
    call ExtractSnips("~/.vim/snippets/html", "xhtml")
    call ExtractSnips("~/.vim/snippets/html", "php")
endfunction

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

set statusline+=%#warningmsg# " for enabling syntastic
set statusline+=%{SyntasticStatuslineFlag()}
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

" Mainly for Markdown in text highlighting
function! TextEnableCodeSnip(filetype,start,end,textSnipHl) abort
  let ft=toupper(a:filetype)
  let group='textGroup'.ft
  if exists('b:current_syntax')
    let s:current_syntax=b:current_syntax
    " Remove current syntax definition, as some syntax files (e.g. cpp.vim)
    " do nothing if b:current_syntax is defined.
    unlet b:current_syntax
  endif
  execute 'syntax include @'.group.' syntax/'.a:filetype.'.vim'
  try
    execute 'syntax include @'.group.' after/syntax/'.a:filetype.'.vim'
  catch
  endtry
  if exists('s:current_syntax')
    let b:current_syntax=s:current_syntax
  else
    unlet b:current_syntax
  endif
  execute 'syntax region textSnip'.ft.'
  \ matchgroup='.a:textSnipHl.'
  \ start="'.a:start.'" end="'.a:end.'"
  \ contains=@'.group
endfunction
