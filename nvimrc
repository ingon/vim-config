call plug#begin('~/.config/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'fatih/vim-go'
Plug 'fatih/molokai'

Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'

call plug#end()

" ----- Add common settings -----

set number               " prefix lines with number
set ignorecase           " search ignoring case
set smartcase            " case insensitive search unless there's varied casing, then it's case sensitive
set showmatch            " show matching brace/backet

syntax on

set mouse=a

set clipboard+=unnamedplus

hi clear SignColumn

" ----- Custom modified by me -----
set tabstop=4
set shiftwidth=4

set expandtab       " use spaces instead of tabs
set smartindent     " smarter indent for C-like languages

set scrolloff=3

" ----- Key combos -----
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

" map <leader>q and <leader>w to buffer prev/next buffer
noremap <leader>q :bp<CR>
noremap <leader>w :bn<CR>

" save with ctrl+s
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a

" select all mapping
noremap <leader>a ggVG

" ----- Plugin specific settings -----

" ----- Color settings -----
set termguicolors
set background=dark

let g:rehash256 = 1
" let g:molokai_original = 1
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

" ----- jistr/vim-nerdtree-tabs -----
" Open/close NERDTree Tabs with \t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
nmap <silent> <leader>r :NERDTreeFind<CR>
" To have NERDTree always open on startup
" let g:nerdtree_tabs_open_on_console_startup = 1

" ----- airblade/vim-gitgutter settings -----
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1

" ----- vim-go ----
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_fmt_command = 'goimports'
let g:go_rename_command = 'gopls'
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
