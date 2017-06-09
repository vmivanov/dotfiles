" Initialise vim-plug for plugin management
call plug#begin('~/.vim/plugged')
    " Plugin: airline
    Plug 'https://github.com/vim-airline/vim-airline.git'
    Plug 'https://github.com/vim-airline/vim-airline-themes.git'

    " Plugin: colorschemes
    Plug 'https://github.com/flazz/vim-colorschemes.git'

    " Plugin: fugitive
    Plug 'https://github.com/tpope/vim-fugitive.git'

    " Plugin: syntastic
    Plug 'https://github.com/vim-syntastic/syntastic.git'
call plug#end()

" Plugin config: vim-airline
let g:airline_powerline_fonts = 1               " Use powerline symbols
let g:airline#extensions#tabline#enabled = 1    " Enable tabline

" Plugin config: syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

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

" vim: fenc=utf-8 ft=vim ts=4 sts=4 sw=4 et
