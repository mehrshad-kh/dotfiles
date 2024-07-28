set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" Disable vi compatibility (emulation of old bugs).
set nocompatible

syntax on
if has('macunix')
  colorscheme slate
else
  if has('unix')
    colorscheme industry
  endif
endif
set autoindent
set smartindent
set smarttab
set number

" Open split tabs in below right.
set splitbelow
set splitright

" For bi-directional text.
" set termbidi

" Used for filename completion.
set wildmode=longest,list,full
set wildmenu

set ruler

set expandtab
set shiftwidth=2
set tabstop=2

autocmd FileType make setlocal noexpandtab

autocmd FileType bash,cpp,qml,ruby,vhdl,zsh setlocal shiftwidth=2 tabstop=2 
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4

" Comment autocommands.
autocmd FileType c,cpp,verilog nnoremap <buffer> <localleader>c I// <Esc>
autocmd FileType cmake,python,ruby,tcl,zsh nnoremap <buffer> <localleader>c I# <Esc>
autocmd FileType sql,vhdl nnoremap <buffer> <localleader>c I-- <Esc>
autocmd FileType vim nnoremap <buffer> <localleader>c I" <Esc>
autocmd FileType tex nnoremap <buffer> <localleader>c I% <Esc>

" Uncomment autocommands.
autocmd FileType c,cpp,sql,verilog,vhdl nnoremap <buffer> <localleader>u ^3x
autocmd FileType cmake,python,ruby,tex,vim,zsh nnoremap <buffer> <localleader>u ^2x

autocmd BufNewFile *.sh :set filetype=zsh
autocmd BufNewFile,BufRead .bashrc :set filetype=bash
autocmd BufNewFile,BufRead *.v :set filetype=verilog
autocmd BufNewFile,BufRead *.verilog :set filetype=verilog

" Backspace over everything in insert mode.
set backspace=indent,eol,start 

" I use vim-plug as the plug-in manager.
" Install vim-plug if not found.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Use the Ruby implementation of Command-T.
let g:CommandTPreferredImplementation = 'ruby'

" Disable showing documentation in a pop-up.
let g:ycm_auto_hover = ''

" Disable completion suggestions.
let g:ycm_auto_trigger = 0

" Use installed clangd, not YCM-bundled clangd which doesn't get updated.
let g:ycm_clangd_binary_path = exepath("clangd")

let g:ycm_enable_semantic_highlighting = 1
let g:ycm_filetype_whitelist = {'c': 1, 'cpp': 2, 'python': 3} 

" Turn off syntax checker UI.
let g:ycm_show_diagnostics_ui = 0

let g:ycm_goto_buffer_command = 'same-buffer'

" For vim-python/python-syntax.
let g:python_highlight_all = 1
let g:python_highlight_indent_errors = 0
let g:python_highlight_space_errors = 0

call plug#begin()
Plug 'ayu-theme/ayu-vim'
Plug 'vim-python/python-syntax'
Plug 'wincent/command-t', {
    \   'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
    \ }
Plug 'ycm-core/YouCompleteMe', {'do': './install.py --clangd-completer', 'on': []}
call plug#end()

" For ayu-theme/ayu-vim.
set termguicolors
let g:ayucolor="dark"
colorscheme ayu

imap <C-s> <Esc>:w<CR>
map <C-s> :wa<CR>
map <leader>d :YcmCompleter GetDoc<CR>
map <leader>j :YcmCompleter GoToDefinition<CR>
map <leader>y :call plug#load('YouCompleteMe')<CR>
nmap <leader>h <plug>(YCMHover)
