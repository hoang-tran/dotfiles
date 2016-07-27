let mapleader = ","

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" My plugins
Plugin 'dockyard/vim-easydir'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'kien/ctrlp.vim'
Plugin 'avakhov/vim-yaml'
Plugin 'tpope/vim-cucumber'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'flazz/vim-colorschemes'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-unimpaired'
Plugin 'jiangmiao/auto-pairs'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'airblade/vim-gitgutter'
Plugin 'slim-template/vim-slim'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'Yggdroot/indentLine'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-dispatch'
Plugin 'benmills/vimux'
Plugin 'jgdavey/vim-turbux'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'OmniSharp/omnisharp-vim'
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
Plugin 'keith/swift.vim'
Plugin 'gfontenot/vim-xcode'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on

" color scheme
syntax on
colorscheme Tomorrow-Night-Eighties


" Config UI for MacVim
set guifont=Source\ Code\ Pro\ Light:h16

set hlsearch
set incsearch
set number
set ic
set smartcase
set t_ut=
set backspace=2
set wildmenu
set wildignore=*.o,*~,*.pyc
set nocursorline
set nocursorcolumn
set relativenumber
syntax sync minlines=256
" Tab
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set laststatus=2  " Always display the status line
" CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim

" easytags
let g:easytags_languages = {'swift': {}}

" share clipboard
set clipboard=unnamed
set autowrite
set autoread
set noesckeys
set ttimeout
set ttimeoutlen=1
" Don't wait so long for the next keypress (particularly in ambigious Leader
" situations.
set timeoutlen=500
" Set the tag file search order
set tags=./tags;
" Undo
if has('persistent_undo')      "check if your vim version supports it
  set undofile                 "turn on the feature
  set undodir=$HOME/.vim/undo  "directory where the undo files will be stored
endif

" Remove trailing whitespace on save for all files.
au BufWritePre *.* :%s/\s\+$//e

" personal keymappings
nmap 0 ^
nnoremap <leader>er :tabe ~/.vimrc<CR>
nnoremap <leader>et :tabe ~/.tmux.conf<CR>
nnoremap <leader>nn :NERDTreeToggle<CR>
nnoremap <leader>rr :source ~/.vimrc<CR>
nnoremap <leader>pp :PluginInstall<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :q!<CR>
nnoremap <leader>s :w<CR>
vnoremap <Space> =
nnoremap <Space> ==
nnoremap <leader>sa :sav %:h/
nnoremap <leader>fa :Ag ''<left>
nnoremap <leader>re :%s//ge<left><left><left>
nnoremap <leader>ag :arg *.
nnoremap <leader>aa :arg *.*<CR>
nnoremap <leader>ra :argdo %s//ge \| update<left><left><left><left><left><left><left><left><left><left><left><left>
nmap Y y$
imap jk <Esc>
" git mapping
nnoremap <leader>g :Gstatus<CR>

" markdown settings
let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_frontmatter = 1

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
" Pane navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Silver search
let g:ag_working_path_mode="r"
" Use Silver Searcher instead of grep
set grepprg=ag

" Make CtrlP use ag for listing the files. Way faster and no useless files.
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0

" matchit
runtime macros/matchit.vim

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =
" indentLine on by default
let g:indentLine_enabled = 1
" vimux config
let g:VimuxOrientation = "h"
let g:VimuxHeight = "40"
let g:turbux_runner  = 'vimux'
let g:turbux_command_rspec  = 'zeus rspec'
let g:no_turbux_mappings = 1
map <leader>t <Plug>SendTestToTmux
map <leader>T <Plug>SendFocusedTestToTmux
map <leader>vo :VimuxRunCommand('cd .')<CR>
map <leader>vc :VimuxCloseRunner<CR>
" snippets
let g:UltiSnipsExpandTrigger="<c-space>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
nnoremap <leader>sn :UltiSnipsEdit<cr>
" airline
let g:airline_section_b = ''
let g:airline_section_y = ''
let g:airline_detect_modified=1
" xcode
let g:xcode_runner_command = "VimuxRunCommand('{cmd}')"
let g:xcode_xcpretty_flags = '-s --color'
map <leader>ar :Xrun<CR>
map <leader>ab :Xbuild<CR>
map <leader>ac :Xclean<CR>
map <leader>ao :Xopen %<CR>
map <leader>at :Xtest<CR>
