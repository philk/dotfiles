set nocompatible
set background=dark
syntax on
filetype on
filetype plugin on
filetype plugin indent on
colorscheme jellybeans
set sw=2
set ts=2
set binary noeol
set number
set matchpairs+=<:>
set backspace=indent,eol,start
set ignorecase
set expandtab
set showcmd
set hlsearch
set autoindent
set nostartofline
set ruler
set confirm

source ~/.vim/abbreviations

imap jj <Esc>
imap uu _
imap hh =>
imap aa @

nnoremap <C-L> :nohl<CR><C-L>
map <F5> :!ruby %<CR>
map <Leader>s :source $MYVIMRC<CR>
map ,n :NERDTreeToggle<CR>
map <S-Enter> 0<ESC>
map <Enter> o<ESC>
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

let g:syntastic_enable_signs=1

" FuzzyFinder
map ,f :FuzzyFinderTextMate<CR>
map ,b :FuzzyFinderBuffer<CR>
let g:fuzzy_ignore = &wildignore
let g:fuzzy_matching_limit = 70
let g:fuzzy_ceiling = 10000000000

set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~,*.pyc,*.zip,*.gz,*.bz,*.tar,*.jpg,*.png,*.gif,*.avi,*.wmv,*.ogg,*.mp3,*.mov

"dont load csapprox if we no gui support - silences an annoying warning
if !has("gui")
    let g:CSApprox_loaded = 1
else
    if has("gui_gnome")
        set term=gnome-256color
        colorscheme jellybeans
    else
        set t_Co=256
        colorscheme jellybeans
        set guitablabel=%M%t
"        set lines=48
"        set columns=120
    endif
    if has("gui_mac") || has("gui_macvim")
        set guifont=Menlo:h13
    endif
    if has("gui_win32") || has("gui_win32s")
        set guifont=Consolas:h12
				set enc=utf-8
    endif
endif

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
set statusline=%f
"display a warning if &et is wrong, or we have mixed-indenting
set statusline+=%#error#
set statusline+=%{StatuslineTabWarning()}
set statusline+=%*

set statusline+=%#warningmsg# " for enabling syntastic
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"return '[&et]' if &et is set wrong
"return '[mixed-indenting]' if spaces and tabs are used to indent
"return an empty string if everything is fine
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

set backupdir=~/.vimback
set directory=~/.vimtemp