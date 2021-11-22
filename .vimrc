set tabstop=4
set shiftwidth=4
set autoindent
set relativenumber
set noexpandtab

call plug#begin('~/.vim/plugged')

Plug 'vimwiki/vimwiki'

call plug#end()


let g:vimwiki_list = [{'path':'~/vimwiki', 'syntax':'markdown', 'ext':'.md'}]
let g:vimwiki_ext2syntax  = {'.md': 'markdown', '.markdown':'markdown', '.mdown':'markdown'}
let g:vimwiki_markdown_link_ext = 1
