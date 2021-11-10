colo brandt

set clipboard=unnamedplus " make system-clipboard default register

set number
set relativenumber
set cursorcolumn
set cursorline
set updatetime=100 " vim-gitgutter
" set colorcolumn=80

set listchars=eol:¬,tab:> ,trail:~,extends:>,precedes:<,space:␣
set list

set noet ci pi " noexpandtab copyindent preserveindent
set softtabstop=0
set shiftwidth=4
set tabstop=4
set autoindent
set smartindent

set foldmethod=manual
set foldnestmax=10
set nofoldenable
set foldlevel=2
" set fdc=2 " foldcolumn

" FileType-Specific

autocmd FileType yaml set et tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType tf set et tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType tf setlocal commentstring=//\ %s
autocmd FileType typescript setlocal commentstring=//\ %s
