" multiple files {
    " be smarter about multiple buffers / vim instances
    "quick buffer switching with TAB, even with edited files
    set hidden
    nmap <TAB> :bn<CR>
    nmap <S-TAB> :bp<CR>
    set autoread            "auto-reload files, if there's no conflict
    set shortmess+=IA       "no intro message, no swap-file message

    "replacement for CTRL-I, also known as <tab>
    noremap <C-P> <C-I>
" }

" Pathogen: {
    " keep plugins nicely bundled in separate folders.
    " http://www.vim.org/scripts/script.php?script_id=2332
    runtime autoload/pathogen.vim
    if exists('g:loaded_pathogen')
        call pathogen#infect()    "load the bundles, if possible
        Helptags                  "plus any bundled help
        runtime bundle_config.vim "give me a chance to configure the plugins
    endif
" }


" Bindings for normal mode
" Bindings for insert mode
inoremap jj <esc>
nnoremap <c-j> gj
nnoremap <c-k> gk
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>
nnoremap Y y$
noremap go o<esc>
noremap gO O<esc>

" Bindings for command line
cmap <c-p> <up>
cmap <c-n> <down>

" Settings 
set number
set fo+=orjc
set textwidth=130
set scrolloff=3
set hlsearch
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smartcase
set noinfercase
set backspace=2
set foldmethod=syntax
set nocompatible
set ruler
set incsearch
set hidden
set wildmode=full
set wildmenu
set visualbell

syntax enable
colorscheme ir_black
filetype plugin on

set ai si
autocmd BufNewFile,BufRead,FileType *.sql set expandtab
autocmd BufNewFile,BufRead,FileType *.sql set nonumber

if !&diff
	autocmd BufNewFile,BufRead,FileType *.cs set foldmethod=indent
	autocmd BufNewFile,BufRead,FileType *.xml set foldmethod=indent
	autocmd BufNewFile,BufRead,FileType *.py set foldmethod=indent
endif
