
if has('gui_running')
  set langmenu=en_US.UTF-8  " Set the language of the menu(gvim)
  language en               " Set the language of the messages(ui)
endif

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

" Maximize vim window
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window (for an alternative on Windows, see simalt below).
  set lines=999 columns=999
endif

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
set number 		                         " Display nunmber lines
set relativenumber 		                 " Display  relative nunmber lines
set foldenable                           " Enable auto fold
set foldmethod=indent                    " Set fold method
set foldlevel=99                         " Set fold level
set autowrite                            " Set auto save 
set cursorline                           " Dipslay the current line boldly
"hi CursorLine cterm=NONE ctermbg=gray ctermfg=darkred gui=bold" cursor line highlight color 
hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white gui=bold" cursor line highlight color 
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=red " cursor column line highlight color 

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
set clipboard=unnamedplus                " Sync System clipboard with Vim, 'vim --version \| grep clipboard' and 'sudo apt install vim-gtk'
set guifont=Courier_New:h10:cANSI        " Set font 
set cmdheight=1                          " Set cmd height 
set termencoding=utf-8                   " Set terminate like console encoding 
set encoding=utf-8                       " Set vim inner like buffer,msg txt, menu txt  encoding 
set fileencodings=utf-8,cp936,ucs-bom    " Set file content encoding list and when opening a file, it will open according to the detected encoding sequence
set fileencoding=utf-8                   " Set the current file content encoding when saving a file 
set expandtab                            " Set Tab expand to space
set tabstop=4                            " Set tab widths = 4
set softtabstop=4                        " Set tab indent widths  = 4
set shiftwidth=4                         " Set swap row tab indent widths  = 4


"++++++++++++++++++++ key map config++++++++++++++++++++
" nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>

"++++++++++++++++++++ plugin in config++++++++++++++++++++ 
filetype off                  " required
set rtp+=$HOME/.vim/bundle/Vundle.vim     " set the runtime path to include Vundle and initialize
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


"********** How to add different plugin **********  
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'vim-scripts/a.vim'
Plugin 'preservim/nerdcommenter'
Plugin 'preservim/nerdtree'
Plugin 'altercation/solarized'
Plugin 'preservim/tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/fzf', {'do': {-> fzf#install()}}
Plugin 'junegunn/fzf.vim'
Plugin 'dense-analysis/ale'
Plugin 'rust-lang/rust.vim'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'tmhedberg/SimpylFold' " Fold plugin for python
Plugin 'nvie/vim-flake8'      " Syntax checking for python
Plugin 'Yggdroot/indentLine'  " Display thin vertical lines at each indentation
Plugin 'jiangmiao/auto-pairs' " Insert or delete brackets, parens,quotes in pair
Plugin 'SirVer/ultisnips'     " Track the engine.
Plugin 'honza/vim-snippets'   " Snippets are separated from the engine. Add this if you want them:

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" 
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
"
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
filetype plugin on " load file type plugin 
filetype on        " file type detect on

"++++++++++++++++++++ nerdtree config++++++++++++++++++++
" :help nerdtree OR ? 
autocmd vimenter * NERDTree " open NERDTree when vim start up
let NERDTreeIgnore=['\.pyc$', '\~$', '\.so$', '\.dll$', '\.vim$', '\.swp$'] "ignore files in NERDTree
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
" autocmd VimEnter * nested :TagbarOpen " open tagbar when vim start up
map <C-t> :TagbarToggle<CR>   
" ctrl-t to toggle tagbar
let g:tagbar_autofocus = 1 " If you set this option the cursor will move to the Tagbar window when it is
let g:rust_use_custom_ctags_defs = 1

"let g:tagbar_type_rust = {
"  \ 'ctagstype' : 'rust',
" 'ctagsbin' : '/path/to/your/universal/ctags',
"  \ 'kinds' : [
"      \ 'n:modules',
"      \ 's:structures:1',
"      \ 'i:interfaces',
"      \ 'c:implementations',
"      \ 'f:functions:1',
"      \ 'g:enumerations:1',
"      \ 't:type aliases:1:0',
"      \ 'v:constants:1:0',
"      \ 'M:macros:1',
"      \ 'm:fields:1:0',
"      \ 'e:enum variants:1:0',
"      \ 'P:methods:1',
"  \ ],
"  \ 'sro': '::',
"  \ 'kind2scope' : {
"      \ 'n': 'module',
"      \ 's': 'struct',
"      \ 'i': 'interface',
"      \ 'c': 'implementation',
"      \ 'f': 'function',
"      \ 'g': 'enum',
"      \ 't': 'typedef',
"      \ 'v': 'variable',
"      \ 'M': 'macro',
"      \ 'm': 'field',
"      \ 'e': 'enumerator',
"      \ 'P': 'method',
"  \ },
"\ }

"++++++++++++++++++++ airline config++++++++++++++++++++
map <C-a> :AirlineToggle<CR>   
" ctrl-a to toggle airline
let g:airline#extensions#tabline#enabled = 1 " enable enhanced tabline 
let g:airline#extensions#tabline#show_buffers = 1 " enable displaying buffers with a single tab. (c)


"++++++++++++++++++++ solarized config++++++++++++++++++++
syntax on
set t_Co=256
if has('gui_running')
	set background=dark                      " Set background color"
else
	set background=dark
endif

" COMMENT THIS WHEN SSH CONNECTION
colorscheme solarized 

"++++++++++++++++++++ cscope config++++++++++++++++++++
if has("cscope")
	set csprg=/usr/bin/cscope
	set csto=0
	set cst
	set nocsverb
	" add any database in current directory
	if filereadable("cscope.out")
		cs add cscope.out
		" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif
	set csverb
    set cscopequickfix=s-,c-,d-,i-,t-,e-
endif

" Using 'CTRL-@' then a search type makes the vim window
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" Using 'CTRL-spacebar' then a search type makes the vim window
" split horizontally, with search result displayed in
" the new window.
nmap <C-Space>s :scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>g :scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>c :scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>t :scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>e :scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-Space>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-Space>d :scs find d <C-R>=expand("<cword>")<CR><CR>

" Hitting CTRL-space *twice* before the search type does a vertical
" split instead of a horizontal one
nmap <C-Space><C-Space>s
	\:vert scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>g
	\:vert scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>c
	\:vert scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>t
	\:vert scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>e
	\:vert scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>i
	\:vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-Space><C-Space>d
	\:vert scs find d <C-R>=expand("<cword>")<CR><CR>


"++++++++++++++++++++ markdown config++++++++++++++++++++
" let g:vim_markdown_toc_autofit = 1
" let g:vim_markdown_conceal = 0
" set conceallevel=2

"++++++++++++++++++++ instant markdown config++++++++++++++++++++
" let g:instant_markdown_slow = 1
" let g:instant_markdown_autostart = 1
" let g:instant_markdown_open_to_the_world = 1
" let g:instant_markdown_allow_unsafe_content = 1
" let g:instant_markdown_allow_external_content = 1

"++++++++++++++++++++ rust.vim config++++++++++++++++++++
" let g:rustfmt_autosave = 1 

"++++++++++++++++++++ YCM For Rust config++++++++++++++++++++
"install ycm step: 
" 1. add Plugin "ycm-core/YouCompleteMe" and PluginInstall/Update
" 2. cd ~
"    sudo apt install build-essential cmake python3-dev libclang1
"    sudo apt install libclang-dev -y
" 3. clangd --version 
"    sudo apt-get install clangd-12(XXVERSION)
"    sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-12 100
" 4. cd ~/.vim/bundle/YouCompleteMe
"    sudo apt-get install python-dev python3-dev
" 5. cd ~ 
"    mkdir ycm_build
"    cd ycm_build
"    cmake -G "Unix Makefiles" . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
"    cmake --build . --target ycm_core --config Release
" 6: cd ~
"    sudo apt-get install python-setuptools
"    cd ~/.vim/bundle/YouCompleteMe
"    git submodule update --init --recursive (if .vim/bundle/YouCompleteMe/third_party/ycmd/third_party is empty 
"    or watchdog directory is empty, MAY reExecute more than 1 time)
"    cd   ~/.vim/bundle/YouCompleteMe/third_party/ycmd/third_party/watchdog_deps/watchdog
"    sudo update-alternatives --install /usr/bin/python python /usr/bin/python2.7 1
"    sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.8 2
"    update-alternatives --config python(pick python3)
"    python setup.py build --build-base=build/3 --build-lib=build/lib3
" 7. cd ~
"    sudo npm install -g --prefix third_party/tsserver typescript
" 8. rustup update
"    rustup toolchain install nightly
"    rustup default nightly
"    rustup component add rls
"    rustup component add rust-src
"    rustup component add rust-analysis
" 9. cd ~/.vim/bundle/YouCompleteMe
"    python3 ./install.py --clangd-completer --rust-completer --ts-completer
" 10. config .vim.rc about ycm as below
" clangd config
" Let clangd fully control code completion
 let g:ycm_clangd_uses_ycmd_caching = 0
 let g:ycm_clangd_binary_path = "/usr/bin/clangd"
 " ycm config
 let g:ycm_semantic_triggers={'c,cpp,python,rust,go,erlang,cs,javascript,typescript':['re!\w{2}']}
 let g:ycm_rust_src_path='$HOME/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'
 let g:ycm_complete_in_comments = 1
 let g:ycm_seed_identifiers_with_syntax = 1
 let g:ycm_collect_identifiers_from_tags_files = 1
" let g:ycm_goto_buffer_command='horizontal-split'
" let g:ycm_global_ycm_extra_conf='~/.vim/ycm_extra_conf.py'
set completeopt=menu,menuone " disable the function defininition preview window
let g:ycm_add_preview_to_completeopt=0
let g:ycm_key_invoke_completion='<C-x>'
map <F5> : YcmCompleter GoToDefinitionElseDeclaration<CR>
"++++++++++++++++++++ make config++++++++++++++++++++

" %: current complete file name including suffix file type
" %<: current file name not including suffix file type

" c/c++/shell/python file compile and run
map <F5> :call CompileAndRun() <CR>
func! CompileAndRun()
    exec "w"
    if &filetype =='c'
        exec "!gcc % -o %<"
        exec "slicent !clear"
        exec "! ./%<"
    elseif &filetype =='cpp'
        exec "!g++ % -o %<"
        exec "slicent !clear"
        exec "! ./%<"
    elseif &filetype =='sh'
        exec "slicent !clear"
        exec "! ./%"
    elseif &filetype =='python'
        exec "slicent !clear"
        exec "!python ./%"
    endif
endfunc

map <F10> :call RunGdb() <CR>
func! RunGdb()
    exec "w"
    if &filetype == 'c'
        exec "!gcc % -g -o %<"
        exec "slicent !clear"
        exec "!gdb ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -g -o %<"
        exec "slicent !clear"
        exec "!gdb ./%<"
    endif
endfunc

"++++++++++++++++++++ leader f config++++++++++++++++++++
let g:Lf_ShortcutF= '<c-p>'
let g:Lf_ShortcutB= '<c-b>'
let g:WorkingDirectoryMode = 'AF'
let g:Lf_RootMarkers = ['.git', '.svn', '.hg', '.project', '.root']
let g:Lf_PreviewInPopup = 1
let g:Lf_WindowHeight = 0.30
let g:Lf_StlColorscheme= 'powerline'

"++++++++++++++++++++ simpyl fold config++++++++++++++++++++
let g:SimpylFold_docstring_preview=1

"++++++++++++++++++++ flake config++++++++++++++++++++
let python_highlight_all=1

"++++++++++++++++++++ indent line config++++++++++++++++++++
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" let g:indentLine_color_term = 255 " change color 
map <F3> :IndentLinesToggle<cr> " F3 toggle indent line function

"++++++++++++++++++++ UltiSnips  config++++++++++++++++++++
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"++++++++++++++++++++ ALE  config++++++++++++++++++++
let g:ale_linters = {
            \ 'rust': ['analyzer'],
\}
let g:ale_fixers = {
            \ 'rust': ['rustfmt', 'trim_whitespace', 'remove_trailing_lines']
\}

" Optional, configure as-you-type completions
let g:ale_completion_enabled = 1"
let g:ale_python_flake8_options = '--max-line-length=88'

"++++++++++++++++++++ autopairs config++++++++++++++++++++
let g:AutoPairsFlyMode = 1
map <F2> :AutoPairsShortcutToggle<cr> " F2 toggle indent line function

"++++++++++++++++++++ autopairs config++++++++++++++++++++
"append and export MACRO in .zshrc or .bashrc: FZF using ripgrep 
"and support multi-files search
"
" if type rg &> /dev/null; then
"   export FZF_DEFAULT_COMMAND='rg --files'
"   export FZF_DEFAULT_OPTS='-m --height 50% --border'
" fi
" Remap shortkey
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>r :Rg<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>l :BLines<CR>
nnoremap <silent> <leader>t :Helptags<CR>
nnoremap <silent> <leader>h :History<CR>
nnoremap <silent> <leader>h: :History:<CR>
nnoremap <silent> <leader>h/ :History/<CR>
" Set grepprg as RipGrep 
if executable("rg")
    set grepprg=rg\ --vimgrep\ --smart-case\ --hidden\ --follow
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
"
" Exclude rg content search in file names and only search file contents
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

"
" Rg basic Search Usage:
" Search for foo in current working directory: :grep foo.
" Search for foo in files under src/: :grep foo src.
" Search for foo in current file directory: :grep foo %:h.
" Search for foo in current file directory’s parent directory: :grep foo %:h:h (and so on).
" Search for the exact word foo (not foobar): :grep -w foo (equivalent to :grep '\bfoo\b').
" Search for foo in files matching a glob: :grep foo -g '*.rs'
"
" Quickfix Replace Usage:
" :cdo s/foo/bar/gc. And then :cfdo update
"

" ********** Brief help **********
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" " see :h vundle for more details or wiki for FAQ
"
