" Automatically install vim-plug, if not already present
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Initialise vim-plug for plugin management
call plug#begin()
    " Plugin: airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " Plugin: colorschemes
    Plug 'flazz/vim-colorschemes'

    " Plugin: fugitive
    Plug 'tpope/vim-fugitive'

    " Plugin: A.L.E. (Asynchronous Lint Engine)
    Plug 'dense-analysis/ale'
call plug#end()

" Plugin config: vim-airline
let g:airline_powerline_fonts = 1               " Use powerline symbols
let g:airline#extensions#tabline#enabled = 1    " Enable tabline

" Plugin config: A.L.E.
let g:airline#extensions#ale#enabled = 1        " Enable integration with Airline

" Theme config: solarized
let g:solarized_termcolors = 256
let g:airline_solarized_bg = 'dark'

" Other configuration
set linebreak
set modeline                    " Enable Vim modelines
set modelines=5                 " Number of lines to check for a modeline

" Colours
syntax on                       " Enable syntax highlighting
set background=dark             " Always use dark background
colorscheme cobalt2

" Indentation
set autoindent                  " Copy indent from current line when starting a new line
set expandtab                   " Use tab characters instead of spaces
set shiftwidth=4                " Number of spaces to use for each step of (auto)indent
set tabstop=4                   " Number of spaces that a <Tab> in the file counts for

" Interface
set colorcolumn=+1
set completeopt=longest,menuone " Completions behaviour
set laststatus=2                " Always show the status line
set mouse=a                     " Enable mouse for all modes
set nowrap                      " Do not wrap lines longer than the width of the window
set number                      " Print the line number in front of each line
set scrolloff=1                 " Number of lines to keep above and below the cursor when scrolling
set showmatch                   " When a bracket is inserted, briefly jump to the matching one
set wildmenu                    " Enable enhanced command completion
set ttymouse=sgr                " Allow mouse to work after 220th column

" Searching
set hlsearch                    " Highlight search matches
set incsearch                   " Search while typing

" Remap suggestions from C-N to C-Space
inoremap <expr> <C-Space> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' : '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
imap <C-@> <C-Space>

" Remove trailing whitespace when saving files
autocmd BufWritePre * :%s/\s\+$//e

" Fix bugged arrow keys with tmux
if &term =~ '^screen'
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

" vim: fenc=utf-8 ft=vim ts=4 sts=4 sw=4 et
