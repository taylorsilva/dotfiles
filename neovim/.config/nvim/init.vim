" Change how tabs look
set tabstop=2
set softtabstop=0 noexpandtab
set shiftwidth=2

" clear search highlighting with <space>,
map <Space> :noh<cr>
" open nerdtree with the \ key, above enter
map <Bslash> :NERDTreeToggle<CR>
" open FZF with ,f
map ,f :FZF<CR>

" Open nerdtree if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" always show line numbers
set number

""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""

" Plugin configuration
call plug#begin('~/.local/share/nvim/plugged')

Plug 'https://github.com/scrooloose/nerdtree'
Plug 'https://github.com/ayu-theme/ayu-vim'
Plug 'https://github.com/fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'https://github.com/junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }  " installs the vim plugin and becomes available on the command line with ctrl+r
Plug 'https://github.com/junegunn/fzf.vim'  " actually required for vim to use fzf

call plug#end()

" Set the theme
set termguicolors " enable true colors support
let ayucolor="mirage" " optiosn include light, dark, mirage
colorscheme ayu
