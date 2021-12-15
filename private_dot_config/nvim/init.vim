"--------------------------------------------------------------------------
" GENERAL SETTINGS
"--------------------------------------------------------------------------
nnoremap <SPACE> <Nop>
let mapleader = ","

syntax on

set cursorline
" sets for nvim
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
" end of sets for nvim
set nocompatible
set background=dark
set smartindent
set shiftwidth=4
set expandtab
set clipboard=unnamedplus
set t_Co=256
set splitbelow
set number
set encoding=utf-8
set tabstop=4
set scrolloff=30


"--------------------------------------------------------------------------
" CUSTOM MAPPING
"--------------------------------------------------------------------------
" Sourcing/Installing
nmap <leader>s :source ~/.config/nvim/init.vim<cr>
nmap <leader>p :PlugInstall<cr>
" Floaterm shortcuts
nmap <leader>t :FloatermNew<cr>
nmap <leader>fr :FloatermNew ranger<cr>
nmap <leader>fp :FloatermNew! python3<cr>
" Home & End keymaps
:map <S-h> <Home>
:map <S-l> <End>
:inoremap <C-a> =
" Tab Navigation
map <leader>h :tabprevious<cr>
map <leader>l :tabnext<cr>
" map <leader>n :tabnew<cr> note: clashed with opening nerdtree
" Pane Navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


"--------------------------------------------------------------------------
" PLUGINS
"--------------------------------------------------------------------------
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

call plug#begin(data_dir . '/plugins')

source ~/.config/nvim/plugins/palenight.vim
"source ~/.config/nvim/plugins/dracula.vim
source ~/.config/nvim/plugins/airline.vim
source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/indentline.vim
source ~/.config/nvim/plugins/polyglot.vim
source ~/.config/nvim/plugins/autopairs.vim
source ~/.config/nvim/plugins/highlightedyank.vim
source ~/.config/nvim/plugins/nerdcommenter.vim
source ~/.config/nvim/plugins/viminstantmarkdown.vim
source ~/.config/nvim/plugins/nerdtree.vim
source ~/.config/nvim/plugins/ctrlp.vim
source ~/.config/nvim/plugins/floaterm.vim

call plug#end()
doautocmd User PlugLoaded
