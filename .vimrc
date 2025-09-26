"" Plugins
call plug#begin()
       " Appearance
        Plug 'vim-airline/vim-airline'
        Plug 'ryanoasis/vim-devicons'

       " Utilities
        Plug 'preservim/nerdtree'
        Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
        Plug 'thaerkh/vim-indentguides'
      	Plug 'tpope/vim-commentary'
      	Plug 'kien/ctrlp.vim'
        Plug 'mg979/vim-visual-multi', {'branch': 'master'}

        " Git
        Plug 'airblade/vim-gitgutter'
        Plug 'tpope/vim-fugitive'
        Plug 'rbong/vim-flog'

        " Completion / linters / formatters
        Plug 'plasticboy/vim-markdown'
        Plug 'ap/vim-css-color'
        Plug 'sheerun/vim-polyglot'
        Plug 'neoclide/coc.nvim', {'branch': 'release'}
        Plug 'dense-analysis/ale'

call plug#end()

"" Plugins Settings
"" NERDTree Settings
let NERDTreeShowHidden = 0

"" Airline Settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

"" Vim IndentGuides Settings
let g:indentguides_spacechar = '▏'
let g:indentguides_tabchar = '▏'

"" CoC Settings
"" Usar <TAB> para foco, usar setas e <ENTER> para selecionar.
"" CoC Extensions:  coc-tsserver, coc-css, coc-emmet
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

"" coc-git show info commit
"" autocmd CursorHold * silent! CocCommand git.showBlameDoc " Exibe
"" automáticamente quando o
"" cursor fica parado na linha
"nnoremap <leader>b :CocCommand git.showBlameDoc<CR>
"" End of CoC Settings

"" ALE Settings
let g:ale_enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_linters = {
   \ 'javascript': ['prettier'],
   \ 'css': ['prettier'],
   \ 'yaml': ['prettier'],
   \ 'json': ['prettier'],
   \ 'python': ['ruff', 'pylint']
 \}

let g:ale_open_list = 1
let g:ale_set_highlights = 1

"" Vim Markdown Settings
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_conceal = 0 
let g:vim_markdown_fenced_languages = ['tsx=typescriptreact'] 

"" General Settings
filetype plugin indent on
syntax on
set t_Co=256
set termguicolors
set background=dark
colorscheme sorbet
set number
set hidden
set incsearch
set hlsearch
set showmatch
set wildmenu
set confirm
set mouse=a
set virtualedit=onemore
set title
set nobackup
set nowritebackup
set clipboard=unnamedplus
set cursorline
set linebreak
set ignorecase
set smartcase
set completeopt=noinsert,menuone,noselect
set smartindent
set autoindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
set encoding=UTF-8
set autoread
set splitbelow
set splitright
set spell
set spelllang=pt_br,en

"" Keymaps
let mapleader = " "
nnoremap <C-b> :NERDTreeToggle<CR>
vnoremap <leader>/ :Commentary<CR>
nnoremap <leader>/ :Commentary<CR>
nnoremap q :q<CR> 
map <C-s> :w<CR>
inoremap <C-s>  <ESC>:w<CR>
nnoremap <C-t> :tabnew<CR>
nnoremap <S-Tab> gt
nnoremap <silent> <S-Up> :m -2<CR>
nnoremap <silent> <S-Down> :m +1<CR>
vnoremap <silent> <S-Up> :m '<-2<CR>gv=gv
vnoremap <silent> <S-Down> :m '>+1<CR>gv=gv
map <silent> <C-j> :term<CR>
map <C-Left> <C-w>h
map <C-Down> <C-w>j
map <C-Right> <C-w>l
map <C-Up> <C-w>k
nnoremap <silent> <leader>f :ALEFix<CR>

"" Commands
"" Set 4 spaces for Python files
au FileType python set shiftwidth=4 tabstop=4 softtabstop=4 expandtab

"" Format and organize imports
augroup python_autofix
  autocmd!
  autocmd BufWritePre *.py :call CocAction('runCommand', 'python.sortImports')
  autocmd BufWritePre *.py :call CocAction('runCommand', 'pyright.organizeimports')
  autocmd BufWritePre *.py :call CocAction('runCommand', 'python.runLinting')
augroup END
