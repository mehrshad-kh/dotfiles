" From the beginning of the file till `PLUG-INS`
" uses only basic Vim features. Hence, it has minimal
" impact on performance or space.

set encoding=utf-8
set fileencoding=utf-8
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

" Convert Unicode code points to legible characters.
" For example, convert `\u0628` to `ب`.
function! ConvertUnicode()
  %s/\\u\(\x\{4}\)/\=nr2char(str2nr(submatch(1),16))/g
endfunction

" Set up Persian.
" Run `:call Persian()` to use.
function! Persian()
  " Display bi-directional text correctly.
  set termbidi

  set keymap=persian

  " Conceal U+200C (ZWNJ, aka 'nim fasele') with '|'.
  call matchadd('Conceal', '\%u200c', 10, -1, {'conceal':'|'})
  set conceallevel=2 concealcursor=nvi

  " Disable conceal for LaTeX files.
  let g:tex_conceal = ''

  " Disable indentation.
  set indentexpr&

  " Save and reload the file.
  :w
  :e
endfunction

" Set up netrw, the built-in plug-in for
" viewing directory content.
function! InitNetrw()
  colorscheme desert

  " Set line numbers.
  set number

  " Hide the upper banner.
  let g:netrw_banner = 0

  " The following two lines disable display of
  " hidden files, i.e., those starting with a dot.
  "
  " In addition, one can cycle through different displays
  " with `a`.
  "
  " Source: https://vi.stackexchange.com/a/18678/44759
  let ghregex = '\(^\|\s\s\)\zs\.\S\+'
  let g:netrw_list_hide = ghregex
endfunction

" Automatically call InitNetrw().
augroup initializing_netrw
  autocmd!
  autocmd FileType netrw call InitNetrw()
augroup END

" Delete trailing whitespace characters in TeX files on write.
" autocmd BufWrite *.tex :%s/\s\+$//ge

" Do not expand tab in Makefiles.
autocmd FileType make setlocal noexpandtab

autocmd FileType asm,c,cpp,javascript,make,python,tex setlocal shiftwidth=4 tabstop=4

autocmd BufNewFile *.sh :set filetype=bash
autocmd BufRead .shellrc :set filetype=bash
autocmd BufNewFile,BufRead .bashrc :set filetype=bash
autocmd BufNewFile,BufRead *.v :set filetype=verilog
autocmd BufNewFile,BufRead *.verilog :set filetype=verilog

" PLUG-INS

" I use vim-plug as the plug-in manager.
" Install vim-plug if not found.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Use the Ruby implementation of Command-T.
" let g:CommandTPreferredImplementation = 'ruby'

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
" Plug 'wincent/command-t', {
    " \   'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
    " \ }
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
