" ----- Inspired by https://github.com/jez/vim-as-an-ide -----

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" ----- Load plugins -----

filetype off

execute pathogen#infect()

" Enable file type detection.
filetype plugin indent on

" ----- Add common settings -----

set backspace=indent,eol,start         " allow backspacing over everything in insert mode
set ruler		                       " show the cursor position all the time
set number                             " prefix lines with a number
set showcmd		                       " display incomplete commands

set ignorecase                         " search ignoring case
set smartcase                          " case insensitive search unless there's varied casing, then it's case sensitive
set showmatch                          " ???
set incsearch		                   " do incremental searching
set hlsearch                           " highlight the search

syntax on                              " enable syntax highlighting

set mouse=a                            " enable mouse

set clipboard=unnamed				   " system clipboard integration

set backup		    " keep a backup file (restore to previous version)
set undofile		" keep an undo file (undo changes after closing)
set history=50		" keep 50 lines of command line history

" Move help files aside
set undodir=~/.vim/dotfiles/undo//
set backupdir=~/.vim/dotfiles/backup//
set directory=~/.vim/dotfiles/swp//

" We need this for plugins like Syntastic and vim-gitgutter which put symbols in the sign column.
hi clear SignColumn

" ----- Custom modified by me -----

set tabstop=4
set shiftwidth=4
set expandtab

set scrolloff=5

" disable cursor keys in normal mode
noremap <left> <nop>
noremap <right> <nop>
noremap <up> <nop>
noremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
" inoremap <ESC> <nop>

" make the j and k work better with wrapped text
" if you hit j, it goes down a visual line, not a logical line
noremap j gj
noremap k gk

" navigate splits by adding the Ctrl-modifier to the analogous vim motion
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" clear hilighting from search
nmap <leader><space> :noh<cr>

" override yaml specific settings
autocmd FileType yml,yaml setlocal tabstop=2 shiftwidth=2 expandtab
" docker compose settings
autocmd FileType docker-compose setlocal tabstop=2 shiftwidth=2 expandtab
" java settings
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" ----- Plugin specific settings -----

" ----- Color settings -----
set background=dark

colorscheme molokai

" ----- bling/vim-airline settings -----
" Always show statusbar
set laststatus=2

" Fancy arrow symbols, requires a patched font
" To install a patched font, run over to
"     https://github.com/abertsch/Menlo-for-Powerline
" download all the .ttf files, double-click on them and click "Install"
" Finally, uncomment the next line
let g:airline_powerline_fonts = 1

" Show PASTE if in paste mode
let g:airline_detect_paste=1

" Show airline for tabs too
let g:airline#extensions#tabline#enabled = 1

" Use the solarized theme for the Airline status bar
let g:airline_theme='molokai'

" ----- ctrl.p -----
let g:ctrlp_custom_ignore = '\v[\/]vendor$'

" ----- jistr/vim-nerdtree-tabs -----
" Open/close NERDTree Tabs with \t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
" To have NERDTree always open on startup
" let g:nerdtree_tabs_open_on_console_startup = 1

" ----- vim-syntastic/syntastic settings -----
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
	au!
	au FileType tex let b:syntastic_mode = "passive"
augroup END
let g:syntactic_check_on_wq = 0

" ----- airblade/vim-gitgutter settings -----
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1

" ----- xolox/vim-easytags settings -----
" Where to look for tags files
set tags=./tags;,~/.vimtags
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" ----- majutsushi/tagbar settings -----
" Open/close tagbar with \b
nmap <silent> <leader>b :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)

" ----- artur-shaik/vim-javacomplete2 settings -----
nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
imap <F4> <Plug>(JavaComplete-Imports-AddSmart)
nmap <F5> <Plug>(JavaComplete-Imports-Add)
imap <F5> <Plug>(JavaComplete-Imports-Add)
nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
imap <F6> <Plug>(JavaComplete-Imports-AddMissing)
nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
imap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)

" ----- Settings present in the example vimrc -----

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
" inoremap <C-U> <C-G>u<C-U>

"" Put these in an autocmd group, so that we can delete them easily.
"augroup vimrcEx
"au!
"
"" When editing a file, always jump to the last known cursor position.
"" Don't do it when the position is invalid or when inside an event handler
"" (happens when dropping a file on gvim).
"autocmd BufReadPost *
"\ if line("'\"") >= 1 && line("'\"") <= line("$") |
"\   exe "normal! g`\"" |
"\ endif
"
"augroup END

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
"if !exists(":DiffOrig")
"  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
"		  \ | wincmd p | diffthis
"endif

"if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
"  set langnoremap
"endif

