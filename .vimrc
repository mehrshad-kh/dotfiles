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

set mouse=a

set tabstop=4 
set shiftwidth=4
set expandtab

autocmd Filetype proto setlocal tabstop=2 expandtab
autocmd Filetype c setlocal tabstop=8 shiftwidth=8 noexpandtab
autocmd Filetype cpp setlocal tabstop=8 shiftwidth=8 noexpandtab
autocmd Filetype make setlocal tabstop=8 shiftwidth=8 noexpandtab

" Modify default tab line to display tab number.
source ~/my-tab-line.vim

" set tags=.tags;$HOME
if has('macunix')
    set tags+=/usr/local/Cellar/grpc/1.58.1/include/.tags
    set tags+=/Library/Developer/CommandLineTools/usr/include/c++/v1/.tags
    " set tags+=$HOME/Qt/6.4.2/macos/lib/QtCore.framework/Versions/A/Headers/.tags
    " set tags+=$HOME/Qt/6.4.2/macos/lib/QtWidgets.framework/Versions/A/Headers/.tags
else
    if has('unix')
        " set tags+=/usr/include/c++/11/.tags
        " set tags+=/usr/local/include/pqxx/.tags
    endif
endif

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

call plug#begin()
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
" Heuristically set buffer options (e.g. shiftwidth and expandtab).
Plug 'tpope/vim-sleuth'
call plug#end()

nmap <F12> :NERDTreeToggle<CR>

