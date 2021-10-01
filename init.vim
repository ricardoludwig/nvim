set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
set number                 							" show line numbers
set relativenumber											" show relative number
highlight ColorColumn ctermbg=DarkGrey
set colorcolumn=140

let g:go_list_type = "quickfix"					" force vim-go only uses quickfix list
let g:go_fmt_command = "goimports"			" automatically format and also rewrite import declarations

function! s:build_go_files()						" run :GoBuild or :GoTestCompile based on the go file
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

let g:netrw_browse_split = 3		" 1- open files in a new horizontal split
                                " 2- open files in a new vertical split
                                " 3- open files in a new tab
                                " 4- open in previous window

" Custom shortcut commands
nnoremap <leader>s :w<CR>
" Custom go shortcut commands
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

"source ~/.vimrc
