" From the beginning of the file till `PLUG-INS`
" uses only basic Vim features. Hence, it has minimal
" impact on performance or space.

set enc=utf-8

" Set file encoding.
set fenc=utf-8

" Set terminal encoding.
set termencoding=utf-8

" Disable vi compatibility (emulation of old bugs).
set nocompatible

" Enable syntax highlighting.
syntax on

" Set color scheme based on platform.
if has('macunix')
  colorscheme slate
else
  if has('unix')
    colorscheme industry
  endif
endif

" Automatically indent lines.
set autoindent

set smartindent
set smarttab

" Set line numbers.
set number

" Open split tabs in below right.
set splitbelow
set splitright

" Used for filename completion.
set wildmode=longest,list,full
set wildmenu

set ruler

" Expand tab key to spaces.
set expandtab
set shiftwidth=2
set tabstop=2

" Backspace over everything in insert mode.
set backspace=indent,eol,start 

" Change directory to the parent directory of current file.
set autochdir

" Set up Persian.
" Run `:call Persian()` to use.
function! Persian()
  " Display bi-directional text correctly.
  set termbidi

  " set keymap=persian

  " Conceal U+200C (ZWNJ, aka 'nim fasele') with '|'.
  call matchadd('Conceal', '\%u200c', 10, -1, {'conceal':'|'})
  set conceallevel=2 concealcursor=nvi

  " Disable conceal for LaTeX files.
  let g:tex_conceal = ''

  " Write and reload the file for a proper view.
  write
  edit
endfunction

" Set up netrw, the built-in plug-in for
" viewing directory content.
function! InitNetrw()
  colorscheme desert
  set number
  nmap <buffer> <TAB> mf mx
endfunction

" Automatically call InitNetrw().
augroup init_netrw
  autocmd!
  autocmd filetype netrw call InitNetrw()
augroup END

" Delete trailing whitespace characters in TeX files on write.
autocmd BufWrite *.tex :%s/\s\+$//ge

" Do not expand tab in Makefiles.
autocmd FileType make setlocal noexpandtab

autocmd FileType javascript,python,tex setlocal shiftwidth=4 tabstop=4

" Comment autocommands.
autocmd FileType c,cpp,qml,verilog nnoremap <buffer> <localleader>c I// <Esc>
autocmd FileType cmake,python,ruby,tcl,zsh nnoremap <buffer> <localleader>c I# <Esc>
autocmd FileType sql,vhdl nnoremap <buffer> <localleader>c I-- <Esc>
autocmd FileType vim nnoremap <buffer> <localleader>c I" <Esc>
autocmd FileType tex nnoremap <buffer> <localleader>c I% <Esc>

" Uncomment autocommands.
autocmd FileType c,cpp,qml,sql,verilog,vhdl nnoremap <buffer> <localleader>u ^3x
autocmd FileType cmake,python,ruby,tex,vim,zsh nnoremap <buffer> <localleader>u ^2x

autocmd BufNewFile *.sh :set filetype=zsh
autocmd BufRead .shellrc :set filetype=bash
autocmd BufNewFile,BufRead .bashrc :set filetype=bash
autocmd BufNewFile,BufRead *.v :set filetype=verilog
autocmd BufNewFile,BufRead *.verilog :set filetype=verilog

" Use `:h` as an abbrevation for `:vert h`,
" hence opening help in a vertical split.
cabbrev h vert h

" Use `:help` as an abbrevation for `:vert help`,
" hence opening help in a vertical split.
cabbrev help vert help

" Set Ctrl+S to write changes to all files.
imap <C-s> <Esc>:wa<CR>
map <C-s> :wa<CR>

" PLUG-INS

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

" Let clangd fully control code completion
let g:ycm_clangd_uses_ycmd_caching = 0

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

map <leader>d :YcmCompleter GetDoc<CR>
map <leader>j :YcmCompleter GoToDefinition<CR>
map <leader>y :call plug#load('YouCompleteMe')<CR>
nmap <leader>h <plug>(YCMHover)
