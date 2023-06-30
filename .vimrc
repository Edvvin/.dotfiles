set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set relativenumber
set number
set wildmenu

call plug#begin('~/.vim/plugged')

Plug 'vimwiki/vimwiki'
Plug 'dylanaraps/wal.vim'
Plug 'rigellute/shades-of-purple.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Ron89/thesaurus_query.vim'

call plug#end()

let g:vimwiki_list = [{'path':'~/vimwiki', 'syntax':'markdown', 'ext':'.md'}]
let g:vimwiki_ext2syntax  = {'.md': 'markdown', '.markdown':'markdown', '.mdown':'markdown'}
let g:vimwiki_markdown_link_ext = 1

colorscheme shades_of_purple
let g:airline_theme = 'shades_of_purple'

command Date execute "normal i<C-R>=strftime('%F')<CR><ESC>"

