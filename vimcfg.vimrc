

"++++++++++++++++++++ no set option config++++++++++++++++++++

" Set default cursor focus on the last position when open the same file again
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Allow vim to load corresponding plugin and indent config according to the corresponding file type like c,c++,python and so on
if has("autocmd")
  filetype plugin indent on
endif

" Set the current line color to light highlight
" autocmd InsertEnter * se cul
" autocmd InsertLeave * se nocul

"++++++++++++++++++++ set option config++++++++++++++++++++
set nocompatible                         " Set no compatible with vi (older version) so we can use extend function of
set showcmd		                 " Show (partial) command in status line.
set showmatch		                 " Show matching brackets.
set ignorecase		                 " Do case insensitive matching
set smartcase		                 " Do smart case matching
set incsearch		                 " Incremental search
set hlsearch 		                 " High light  search
set autowrite		                 " Automatically save before commands like :next and :make
set hidden		                 " Hide buffers when they are abandoned
set number 		                                                                                  " Display nunmber lines
set foldenable                           " Enable auto fold
set autowrite                            " Set auto save 
set cursorline                           " Dipslay the current line boldly
set confirm                              " Pop up confirm msg when processing unsaved files and read-only files
set autoindent                           " Set auto indent , when copying block text from outside to vim, this shoud be close in case indent problem
set smartindent                          " Set c-stlyel auto indent, when copying block text from outside to vim, this shoud be close in case indent problem
set cindent                              " Set auto indent, when copying block text from outside to vim, this shoud be close in case indent problem
set noexpandtab                          " Set no tab replaced by space
set smarttab                             " Using tab at beginning of a row and paragraph
set showmatch                            " Hightlight display matched brackets
set ruler                                " Display cursor's line number in staus bar
set nobackup                             " Not back up file when overlapping files  
set noswapfile                             " Not swap file when overlapping files  


"++++++++++++++++++++ set value config++++++++++++++++++++
set mouse=a                              " Enable mouse all
set guifont=Courier_New:h10:cANSI        " Set font 
set cmdheight=1                          " Set cmd height 
set termencoding=utf-8                   " Set terminate like console encoding 
set encoding=utf-8                       " Set vim inner like buffer,msg txt, menu txt  encoding 
set fileencodings=utf-8,cp936,ucs-bom    " Set file content encoding list and when opening a file, it will open according to the detected encoding sequence
set fileencoding=utf-8                   " Set the current file content encoding when saving a file 
set tabstop=4                            " Set tab widths = 4
set softtabstop=4                        " Set tab indent widths  = 4
set shiftwidth=4                         " Set swap row tab indent widths  = 4


"++++++++++++++++++++ key map config++++++++++++++++++++
" nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>


"++++++++++++++++++++ plugin in config++++++++++++++++++++ 
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim     " set the runtime path to include Vundle and initialize
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
" Plugin 'bundle/Vundle.vim'

" my own plugin here:
" Plugin 'file:///home/tly/.vim/bundle/Vundle.vim'
Plugin 'file:///home/tly/vim-plugins-resp/YouCompleteMe'
Plugin 'file:///home/tly/vim-plugins-resp/a.vim'
Plugin 'file:///home/tly/vim-plugins-resp/nerdcommenter'
Plugin 'file:///home/tly/vim-plugins-resp/vim-airline'
Plugin 'file:///home/tly/vim-plugins-resp/ctrlp.vim'
Plugin 'file:///home/tly/vim-plugins-resp/tagbar'
Plugin 'file:///home/tly/vim-plugins-resp/solarized'
Plugin 'file:///home/tly/vim-plugins-resp/vim-surround'
Plugin 'file:///home/tly/vim-plugins-resp/nerdtree'
Plugin 'file:///home/tly/vim-plugins-resp/vim-fugitive'
Plugin 'file:///home/tly/vim-plugins-resp/vim-markdown'
" LOCAL_PLUGINS_PUT_HERE
" LOCAL_PLUGINS_PUT_HERE
" LOCAL_PLUGINS_PUT_HERE
" LOCAL_PLUGINS_PUT_HERE
" LOCAL_PLUGINS_PUT_HERE
" LOCAL_PLUGINS_PUT_HERE
" LOCAL_PLUGINS_PUT_HERE
" LOCAL_PLUGINS_PUT_HERE
" LOCAL_PLUGINS_PUT_HERE
" LOCAL_PLUGINS_PUT_HERE
" LOCAL_PLUGINS_PUT_HERE
" LOCAL_PLUGINS_PUT_HERE
" LOCAL_PLUGINS_PUT_HERE
" LOCAL_PLUGINS_PUT_HERE
" LOCAL_PLUGINS_PUT_HERE
" LOCAL_PLUGINS_PUT_HERE
" LOCAL_PLUGINS_PUT_HERE
" LOCAL_PLUGINS_PUT_HERE
" LOCAL_PLUGINS_PUT_HERE
" LOCAL_PLUGINS_PUT_HERE





"********** How to add different plugin **********  
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"
" To ignore plugin indent changes, instead use:
"filetype plugin on


"++++++++++++++++++++ ctrlp config++++++++++++++++++++
" :help ctrlp OR ?
" default key map is <C-p>, cmd is :CtrlP
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:15,results:15'
let g:ctrlp_working_path_mode = 'ra' " When starting up, CtrlP sets its local working directory according to this
let g:ctrlp_show_hidden = 0  " Set this to 1 if you want CtrlP to scan for dotfiles and dotdirs: >
set wildignore+=*/.git/*,*/.hg/*,*/.svn/* " use Vim's |'wildignore'| to exclude files and directories from the
let g:ctrlp_mruf_exclude = '/tmp/.*\|/temp/.*' " Files you don't want CtrlP to remember. Use regexp to specify the patterns: 


"++++++++++++++++++++ nerdtree config++++++++++++++++++++
" :help nerdtree OR ? 
autocmd vimenter * NERDTree " open NERDTree when vim start up
map <C-n> :NERDTreeToggle<CR>   
" ctrl-n to toggle NERDTree


"++++++++++++++++++++ nerdcommenter config++++++++++++++++++++
" :help nerdcommenter AND :help <LEADER> to see the leader is '\'
let g:NERDSpaceDelims = 1   " add space after comment delimiters by default
let g:NERDDefaultAlign = 'left'  " align line-wise comment delimiters flush left
let g:NERDAltDelims_java = 1 " use the alternative delimiters for a specific filetype by default 
let g:NERDCommentEmptyLines = 1 " If this option is turned on, then empty lines will be commented as well. Useful when commenting regions of code



"++++++++++++++++++++ tagbar config++++++++++++++++++++
" :help tagbar OR ?
autocmd VimEnter * nested :TagbarOpen " open tagbar when vim start up
map <C-t> :TagbarToggle<CR>   
" ctrl-t to toggle tagbar
let g:tagbar_autofocus = 1 " If you set this option the cursor will move to the Tagbar window when it is



"++++++++++++++++++++ airline config++++++++++++++++++++
map <C-a> :AirlineToggle<CR>   
" ctrl-a to toggle airline
let g:airline#extensions#tabline#enabled = 1 " enable enhanced tabline 
let g:airline#extensions#tabline#show_buffers = 1 " enable displaying buffers with a single tab. (c)


"++++++++++++++++++++ solarized config++++++++++++++++++++
syntax on
set t_Co=256
if has('gui_running')
	set background=light                      " Set background color"
else
	set background=dark
colorscheme solarized

"********** Brief help **********
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" " see :h vundle for more details or wiki for FAQ
"
