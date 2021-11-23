set tabstop=4
set shiftwidth=4
set autoindent
set relativenumber
set noexpandtab

set wildmenu

call plug#begin('~/.vim/plugged')

Plug 'vimwiki/vimwiki'
Plug 'dylanaraps/wal.vim'
Plug 'rigellute/shades-of-purple.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

let g:vimwiki_list = [{'path':'~/vimwiki', 'syntax':'markdown', 'ext':'.md'}]
let g:vimwiki_ext2syntax  = {'.md': 'markdown', '.markdown':'markdown', '.mdown':'markdown'}
let g:vimwiki_markdown_link_ext = 1

colorscheme shades_of_purple
let g:airline_theme = 'shades_of_purple'
