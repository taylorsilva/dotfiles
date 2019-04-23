""""""""""""""""""""""""""""""""""""""""
" Set default behaviour of neovim
""""""""""""""""""""""""""""""""""""""""
" Change how tabs look
set tabstop=2
set softtabstop=0 noexpandtab
set shiftwidth=2
" Enable persistent undo
set undofile
" always show line numbers
set number
" Smart case searching
set ignorecase
set smartcase
" when doing :vs splrit right
set splitright

" Open nerdtree if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Use rg to perform the search, so that .gitignore files and the like are
" respected
let g:fzf_default_command = 'ag --ignore .git -l -g ""'
" Search from the git repo root, if we're in a repo, else the cwd
function FuzzyFind(show_hidden)
	let gitparent=system('git rev-parse --show-toplevel')[:-2]
	  if a:show_hidden
			let $FZF_DEFAULT_COMMAND = g:fzf_default_command . ' --hidden'
		else
			let $FZF_DEFAULT_COMMAND = g:fzf_default_command
		endif
		if empty(matchstr(gitparent, '^fatal:.*'))
			silent execute ':FZF -m ' . gitparent
		else
			silent execute ':FZF -m .'
		endif
endfunction

" Recommended settings for syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


""""""""""""""""""""""""""""""""""""""""
" Key Mappings
""""""""""""""""""""""""""""""""""""""""
" change the leader key to space
let mapleader="\<Space>"
" clear search highlighting with <space>,
map <leader>n :noh<CR>
" open nerdtree with the \ key, above enter
map <Bslash> :NERDTreeToggle<CR>
" open FZF with ,f
map ,f :call FuzzyFind(0)<CR>
" open FZF with ,h and include hidden files in your search
map ,h :call FuzzyFind(1)<CR>
" Quickly save, quit, or save-and-quit
map <leader>w :w<CR>
map <leader>x :x<CR>
map <leader>q :q<CR>
" Maintain visual selection after indenting
vnoremap < <gv
vnoremap > >gv

""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""

" Plugin configuration
call plug#begin('~/.local/share/nvim/plugged')

Plug 'https://github.com/scrooloose/nerdtree'
Plug 'https://github.com/ayu-theme/ayu-vim'
Plug 'https://github.com/junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }  " installs the vim plugin and becomes available on the command line with ctrl+r
Plug 'https://github.com/junegunn/fzf.vim'  " actually required for vim to use fzf
Plug 'https://github.com/ntpeters/vim-better-whitespace'
Plug 'https://github.com/jszakmeister/vim-togglecursor'
" Sublime style selection. Highlight and then <C-n> for next, <C-x> to skip,
" <C-p> to go back. <A-n> to select all matches
Plug 'https://github.com/terryma/vim-multiple-cursors'
Plug 'https://github.com/zhimsel/vim-stay'

" Language Specific Plugins
Plug 'https://github.com/fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'https://github.com/vim-syntastic/syntastic'

call plug#end()

" Set the theme
set termguicolors " enable true colors support
let ayucolor="mirage" " optiosn include light, dark, mirage
colorscheme ayu
