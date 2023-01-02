" plugins will be downloaded under the specified directory.
" use :PlugInstall
call plug#begin('~/.vim/plugged')

Plug 'editorconfig/editorconfig-vim' " make vim compatible with editorconfig
Plug 'jiangmiao/auto-pairs' " auto-close brackets, etc
Plug 'tpope/vim-commentary' " auto-commenting with gc, etc.
Plug 'airblade/vim-gitgutter' " show diff-markers in sign-column
Plug 'wellle/targets.vim' " the BEST vim-plugin in existence
Plug 'lambdalisue/suda.vim' " write files as superuser
Plug 'kshenoy/vim-signature' " marks but way better. show marks in sign-column, etc.
Plug 'benknoble/vim-auto-origami' " show folds in sign-column but way better

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npm install' }

" Snipmate + dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'

Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

call plug#end()

" PLUGIN-CONFIG

let g:lightline = {
	\ 'active': {
	\		'left': [ [ 'mode', 'paste' ],
	\			[ 'gitbranch', 'readonly', 'filename', 'modified' ],
	\		[ 'wordcount' ] ]
	\ },
	\ 'component_function': {
	\		'gitbranch': 'FugitiveHead'
	\ }
	\ }

let g:suda_smart_edit = 1

let g:coc_global_extensions = [ 'coc-eslint', 'coc-tsserver', 'coc-json', 'coc-yaml', 'coc-rust-analyzer' ]
" use :CocInstall

let g:snipMate = { 'snippet_version' : 1 }
