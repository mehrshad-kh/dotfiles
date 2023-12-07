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
set number
" set relativenumber

" Highlight matching braces.
set showmatch

" Open split-tabs to the right.
set splitright

" Enable mouse scrolling.
" set mouse=a

set tabstop=4 
set shiftwidth=4
set expandtab

autocmd Filetype proto setlocal tabstop=2 expandtab
autocmd Filetype c setlocal tabstop=4 shiftwidth=4 expandtab
autocmd Filetype cpp setlocal tabstop=4 shiftwidth=4 expandtab
autocmd Filetype make setlocal tabstop=4 shiftwidth=4 expandtab

" Modify default tab line in order to display tab numbers.
" 1 to show tab line only when more than one tab is present
set showtabline=1
" custom tab pages line
set tabline=%!MyTabLine()
" acclamation to avoid conflict
function! MyTabLine()
    " complete tabline goes here
    let s = '' 
    " loop through each tab page
    for i in range(tabpagenr('$'))
        let tab = i + 1
        " set highlight
        let s .= (tab == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
        " get buffer names and statuses
        let n = ''      " temp string for buffer names while we loop and check buftype
        let m = 0       " &modified counter
        let bc = len(tabpagebuflist(tab))     " counter to avoid last ' '
        " loop through each buffer in a tab
        for b in tabpagebuflist(tab)
            " buffer types: quickfix gets a [Q], help gets [H]{base fname}
            " others get 1dir/2dir/3dir/fname shortened to 1/2/3/fname
            if getbufvar( b, "&buftype" ) == 'help'
                let n .= '[H]' . fnamemodify( bufname(b), ':t:s/.txt$//'  )
            elseif getbufvar( b, "&buftype"  ) == 'quickfix'
                let n .= '[Q]'
            else
                let n .= pathshorten(bufname(b))
            endif
            " check and ++ tab's &modified count
            if getbufvar( b, "&modified" )
                let m += 1
            endif
            " no final ' ' added...formatting looks better done later
            " if bc > 1
                " let n .= ' '
            " endif
            let bc -= 1
        endfor

        if m > 0
            let s .= ' +' " Mine.
            " let s .= '[' . m . '+]'
        endif
        " set the tab page number (for mouse clicks)
        let s .= '%' . tab . 'T'
        let s .= ' '
        " set page number string
        let s .= tab . ' '
        " select the highlighting for the buffer names
        " my default highlighting only underlines the active tab
        " buffer names.
        let s .= (tab == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
        " add buffer names
        let s .= (n == '' ? '[New]' : n)
        " switch to no underlining and add final space to buffer list
        let s .= ' '
    endfor
    " after the last tab fill with TabLineFill and reset tab page nr
    let s .= '%#TabLineFill#%T'
    " right-align the label to close the current tab page
    if tabpagenr('$') > 1
        " let s .= '%=%#TabLineFill#%999Xclose'
        let s .= '%=%999XX' " Mine.
    endif
    return s
endfunction"

" If built by Homebrew, then
if has('patch2100')
    " Backspace over everything in insert mode.
    set backspace=indent,eol,start 
endif

" set tags=.tags;$HOME
"
" If on Mac, then
if has('macunix')
    " set tags+=/Library/Developer/CommandLineTools/usr/include/c++/v1/.tags
    " set tags+=/usr/local/Cellar/grpc/1.58.1/include/.tags
    " set tags+=$HOME/Qt/6.4.2/macos/lib/QtCore.framework/Versions/A/Headers/.tags
    " set tags+=$HOME/Qt/6.4.2/macos/lib/QtWidgets.framework/Versions/A/Headers/.tags
else
    " If on Linux, then
    if has('unix')
        " set tags+=/usr/include/c++/11/.tags
        " set tags+=/usr/local/include/pqxx/.tags
    endif
endif

" I use vim-plug as the plug-in manager.
" Automatic installation of vim-plug.
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install vim-plug if not found.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins.
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Use the Ruby implementation of Command-T as versions 6.x and higher require
" Lua and Neovim.
let g:CommandTPreferredImplementation='ruby'

call plug#begin()
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
" Heuristically set buffer options (e.g. shiftwidth and expandtab).
Plug 'tpope/vim-sleuth'
Plug 'wincent/command-t', {
    \   'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
    \ }
call plug#end()

nmap <F12> :NERDTreeToggle<CR>
map <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>
