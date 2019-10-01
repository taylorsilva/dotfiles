""""""""""""""""""""""""""""""""""""""""
" Set default behaviour of neovim
""""""""""""""""""""""""""""""""""""""""
syntax on
" Change how tabs look
set tabstop=2
set softtabstop=0 noexpandtab
set shiftwidth=2

" always show line numbers
set number

" highlight current line and column
set cursorline
set cursorcolumn

" Smart case searching
set ignorecase
set smartcase

" when doing :vs splrit right
set splitright

" Enable the mouse in all modes
set mouse=a

" undo persists across sessions
if has('persistent_undo')
  set undofile
  set undodir=~/.nvim/.undo
endif

" soft wrap
set textwidth=0
set wrapmargin=0
set wrap
set linebreak

" always assume bash when executing stuff
set shell=/bin/bash

" Use rg to perform the search, so that .gitignore files and the like are
" respected
let g:fzf_default_command = 'ag --ignore .git -l -g ""'

function FuzzyFind(show_hidden)
	if a:show_hidden
		let $FZF_DEFAULT_COMMAND = g:fzf_default_command . ' --hidden'
	else
		let $FZF_DEFAULT_COMMAND = g:fzf_default_command
	endif
	" Search from the git repo root, if we're in a repo, else the cwd
	let gitparent=system('git rev-parse --show-toplevel')[:-2]
	if empty(matchstr(gitparent, '^fatal:.*'))
		silent execute ':FZF -m ' . gitparent
	else
		silent execute ':FZF -m .'
	endif
endfunction


""""""""""""""""""""""""""""""""""""""""
" Key Mappings
""""""""""""""""""""""""""""""""""""""""
" change the leader key to space
let mapleader=","

" clear search highlighting with <space>,
map <leader>n :noh<CR>

" open nerdtree with the \ key
map <Bslash> :NERDTreeToggle<CR>

" open FZF with ,f and includes hidden files in your search
map <leader>f :call FuzzyFind(1)<CR>

" Quickly save, quit, or save-and-quit
map <leader>w :w<CR>
map <leader>x :x<CR>
map <leader>q :q<CR>

" Maintain visual selection after indenting
vnoremap < <gv
vnoremap > >gv

" tab for cycling through options
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

inoremap jk <Esc>
inoremap kj <Esc>
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
Plug 'Valloric/YouCompleteMe'
	let g:ycm_server_python_interpreter = '/usr/bin/python'

" Sublime style selection. Highlight and then <C-n> for next, <C-x> to skip,
" <C-p> to go back. <A-n> to select all matches
Plug 'https://github.com/terryma/vim-multiple-cursors'
Plug 'https://github.com/zhimsel/vim-stay'

" Language Specific Plugins
Plug 'https://github.com/sheerun/vim-polyglot'
Plug 'https://github.com/fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

" Set the theme
set termguicolors " enable true colors support
let ayucolor="mirage" " optiosn include light, dark, mirage
colorscheme ayu
