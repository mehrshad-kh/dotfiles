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
" set relativenumber

" Open split tabs to the right.
set splitright

" For bi-directional text.
" set termbidi

" Enable mouse scrolling.
" set mouse=a
set ruler
" set rulerformat=%l,%v

set expandtab
set shiftwidth=4
set tabstop=4 

autocmd FileType make setlocal noexpandtab

autocmd FileType vhdl setlocal shiftwidth=2 tabstop=2 
" autocmd FileType vhdl setlocal shiftwidth=2

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

" " Modify default tab line in order to display tab numbers.
" " 1 to show tab line only when more than one tab is present
" set showtabline=1
" " custom tab pages line
" 
" set tabline=%!MyTabLine()
" " acclamation to avoid conflict
" function! MyTabLine()
"     " complete tabline goes here
"     let s = '' 
"     " loop through each tab page
"     for i in range(tabpagenr('$'))
"         let tab = i + 1
"         " set highlight
"         let s .= (tab == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
"         " get buffer names and statuses
"         let n = ''      " temp string for buffer names while we loop and check buftype
"         let m = 0       " &modified counter
"         let bc = len(tabpagebuflist(tab))     " counter to avoid last ' '
"         " loop through each buffer in a tab
"         for b in tabpagebuflist(tab)
"             " buffer types: quickfix gets a [Q], help gets [H]{base fname}
"             " others get 1dir/2dir/3dir/fname shortened to 1/2/3/fname
"             if getbufvar( b, "&buftype" ) == 'help'
"                 let n .= '[H]' . fnamemodify( bufname(b), ':t:s/.txt$//'  )
"             elseif getbufvar( b, "&buftype"  ) == 'quickfix'
"                 let n .= '[Q]'
"             else
"                 let n .= pathshorten(bufname(b))
"             endif
"             " check and ++ tab's &modified count
"             if getbufvar( b, "&modified" )
"                 let m += 1
"             endif
"             " no final ' ' added...formatting looks better done later
"             " if bc > 1
"                 " let n .= ' '
"             " endif
"             let bc -= 1
"         endfor
" 
"         if m > 0
"             let s .= ' +' " Mine.
"             " let s .= '[' . m . '+]'
"         endif
"         " set the tab page number (for mouse clicks)
"         let s .= '%' . tab . 'T'
"         let s .= ' '
"         " set page number string
"         let s .= tab . ' '
"         " select the highlighting for the buffer names
"         " my default highlighting only underlines the active tab
"         " buffer names.
"         let s .= (tab == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
"         " add buffer names
"         let s .= (n == '' ? '[New]' : n)
"         " switch to no underlining and add final space to buffer list
"         let s .= ' '
"     endfor
"     " after the last tab fill with TabLineFill and reset tab page nr
"     let s .= '%#TabLineFill#%T'
"     " right-align the label to close the current tab page
"     if tabpagenr('$') > 1
"         " let s .= '%=%#TabLineFill#%999Xclose'
"         let s .= '%=%999XX' " Mine.
"     endif
"     return s
" endfunction"

" If built by Homebrew, then
if has('patch2100')
endif
" Backspace over everything in insert mode.
set backspace=indent,eol,start 

" I use vim-plug as the plug-in manager.
" Install vim-plug if not found.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins.
" autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  " \| PlugInstall --sync | source $MYVIMRC
" \| endif

" Use the Ruby implementation of Command-T.
let g:CommandTPreferredImplementation = 'ruby'

" Disable showing documentation in a pop-up.
let g:ycm_auto_hover = ''

" Disable completion suggestions.
let g:ycm_auto_trigger = 0

" Let clangd fully control code completion.
" let g:ycm_clangd_uses_ycmd_caching = 0
" Use installed clangd, not YCM-bundled clangd which doesn't get updates.
let g:ycm_clangd_binary_path = exepath("clangd")

let g:ycm_enable_semantic_highlighting = 1
let g:ycm_filetype_whitelist = {'c': 1, 'cpp': 2, 'python': 3} 

" let g:ycm_server_python_interpreter='/usr/bin/python3'

" Turn off syntax checker UI.
let g:ycm_show_diagnostics_ui = 0

" For vim-python/python-syntax.
let g:python_highlight_all = 1
let g:python_highlight_indent_errors = 0
let g:python_highlight_space_errors = 0

" Dsiplay tabline from vim-airline.
" let g:airline#extensions#tabline#enabled = 1

" The following lines reduce start-up time.
" Use Vim9 script.
" let g:airline_experimental = 1
" Use a minimum set of extensions.
" let g:airline_extensions = []
" let g:airline_highlighting_cache = 1

call plug#begin()
Plug 'wincent/command-t', {
    \   'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
    \ }
Plug 'ycm-core/YouCompleteMe', {'do': './install.py --clangd-completer', 'on': []}
Plug 'vim-python/python-syntax'
Plug 'ayu-theme/ayu-vim'
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
