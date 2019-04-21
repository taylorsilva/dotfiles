" Change how tabs look
set tabstop=2
set softtabstop=0 noexpandtab
set shiftwidth=2

" clear search highlighting with <space>,
nnoremap <leader>, :noh<cr>

" Open nerdtree if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" open nerdtree with the \ key, above enter
map <Bslash> :NERDTreeToggle<CR>

" always show line numbers
set number

""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""

" Plugin configuration
call plug#begin('~/.local/share/nvim/plugged')

Plug 'https://github.com/scrooloose/nerdtree'

call plug#end()
