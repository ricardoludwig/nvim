set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" source ~/.vimrc

set number					" show line numbers
set relativenumber			" show relative number
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
" set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
" set wildmode=longest,list   " get bash-like tab completions
set autoindent              " indent a new line the same amount as the line just typed
filetype plugin indent on   " allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
set colorcolumn=80
highlight ColorColumn ctermbg=DarkGrey
set encoding=UTF-8
set autowrite

nnoremap <leader>s :w<CR>
nnoremap <leader>q :wqa<CR>
" replace ctrl + x and ctrl + o to ctrl + space
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>

let g:python3_host_prog = '/usr/bin/python3'
let g:rehash256 = 1
" let g:molokai_original = 1
" colorscheme molokai

" Place where is plugins ~/.local/share/nvim/plugged
call plug#begin()

" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/yim-gitgutter'
Plug 'AndrewRadev/splitjoin.vim'
" Não está ajustando para a tag auto complete com problema
Plug 'fatih/vim-go', { 'tag': 'v1.25' }
Plug 'fatih/molokai'
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

call plug#end()

"
" Vim-Go Integration
"

let g:go_list_type = "quickfix"		" force vim-go only uses quickfix list
let g:go_fmt_command = "goimports"	" automatically format and also rewrite import declarations
let g:go_test_timeout = '30s' " GoTest times out after 30s

" improve syntax highlighting, it impacts vim performance
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1


" let g:go_def_mode='gopls'
" let g:go_info_mode='gopls'

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()		
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <leader>tf  <Plug>(go-test)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" replace ctrl + x and ctrl + o to dot in Go files 
" au filetype go inoremap <buffer> . .<C-x><C-o>

" FZF Vim Integration 
" https://github.com/junegunn/fzf/blob/master/README-VIM.md
"

set rtp+=~/.fzf

nnoremap <silent> <C-p> :FZF<CR>

