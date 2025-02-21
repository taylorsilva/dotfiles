""""""""""""""""""""""""""""""""""""""""
" Set default behaviour of neovim
""""""""""""""""""""""""""""""""""""""""
syntax on
" use spaces instead of tabs
set expandtab
set tabstop=4
set shiftwidth=4

" don't remove the EOL at the end of files
set nofixeol
set nofixendofline

" always show line numbers
set number

" highlight current line and column
set cursorline
set cursorcolumn

" Smart case searching
set ignorecase
set smartcase

" when doing :vs split right
set splitright
" when doing :sp split below
set splitbelow

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

" set zsh as default shell when running terminal commands
set shell=zsh

" Use rg to perform the search, so that .gitignore files and the like are
" respected
let g:fzf_default_command = 'rg --files'

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
" change the leader key to comma
let mapleader=","

" clear search highlighting with <space>,
map <space> :noh<CR>

" open FZF with ,f and includes hidden files in your search
map <leader>f :call FuzzyFind(0)<CR>

" Quickly save, quit, or save-and-quit
map <leader>w :w<CR>
map <leader>x :x<CR>
map <leader>q :q<CR>

map <leader>t :tab terminal<CR>

"navigate tabs
map <leader>n :tabn<CR>
map <leader>p :tabp<CR>

" tab for cycling through options
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" escape by mashing j and k
inoremap jk <Esc>
inoremap jj <Esc>

" sensible long line navigation
nmap j gj
nmap k gk

" open up netrw
map - :Explore<CR>
" hide the netrw banner
let g:netrw_banner = 0

" don't auto-fold
set foldlevelstart=99

" Escape mappings for terminal mode
:tnoremap <Esc> <C-\><C-n>
:tnoremap jk <C-\><C-n>
:tnoremap jj <C-\><C-n>

""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""

" Plugin configuration
" run :PlugInstall to install new plugins
call plug#begin('~/.local/share/nvim/plugged') "where plugins are installed

Plug 'dracula/vim', { 'as': 'dracula' } "dracula theme
Plug 'https://github.com/junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }  " installs the vim plugin and becomes available on the command line with ctrl+r
Plug 'https://github.com/junegunn/fzf.vim'  " actually required for vim to use fzf
Plug 'https://github.com/ntpeters/vim-better-whitespace'
Plug 'https://github.com/tpope/vim-commentary' " for using gc to comment stuff out
Plug 'https://github.com/jszakmeister/vim-togglecursor'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
    let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-clangd', 'coc-cmake', 'coc-css', 'coc-python']

" Sublime style selection. Highlight and then <C-n> for next, <C-x> to skip,
" <C-p> to go back. <A-n> to select all matches
Plug 'https://github.com/terryma/vim-multiple-cursors'
Plug 'https://github.com/zhimsel/vim-stay'

" syntax highlighting for various languages
Plug 'https://github.com/sheerun/vim-polyglot'
	let g:polyglot_disabled = ['elm', 'go']

Plug 'https://github.com/fatih/vim-go', { 'do': ':GoUpdateBinaries' }
	let g:go_fmt_command = "goimports"
    let go_echo_go_info = 0 " disable annoying popup when using auto-complete
	let g:go_highlight_operators = 1
	let g:go_highlight_functions = 1
	let g:go_highlight_function_calls = 1
	let g:go_highlight_types = 1
	let g:go_highlight_fields = 1
	let g:go_highlight_variable_declarations = 1
	let g:go_highlight_variable_assignments = 1
	nmap gi :GoImplements<cr>

Plug 'https://github.com/ElmCast/elm-vim'
	let g:elm_setup_keybindings = 0

Plug 'jez/vim-better-sml'
augroup vimbettersml
  au!
  " open the REPL terminal buffer
  au FileType sml nnoremap <silent> <buffer> <leader>is :SMLReplStart<CR>
  " close the REPL (mnemonic: k -> kill)
  au FileType sml nnoremap <silent> <buffer> <leader>ik :SMLReplStop<CR>
  " build the project (using CM if possible)
  au FileType sml nnoremap <silent> <buffer> <leader>ib :SMLReplBuild<CR>
  " for opening a structure, not a file
  au FileType sml nnoremap <silent> <buffer> <leader>io :SMLReplOpen<CR>
  " use the current file into the REPL (even if using CM)
  au FileType sml nnoremap <silent> <buffer> <leader>iu :SMLReplUse<CR>
  " clear the REPL screen
  au FileType sml nnoremap <silent> <buffer> <leader>ic :SMLReplClear<CR>
augroup END

call plug#end()

" Set the theme
set termguicolors " enable true colors support
colorscheme dracula
