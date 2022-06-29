"source configurations
"https://www.freecodecamp.org/news/vimrc-configuration-guide-customize-your-vim-editor/
"plugin source https://github.com/gerardbm/vimrc

syntax on " Turn syntax highlighting on.
syntax enable
set nocompatible " Disable compatibility with vi which can cause unexpected issues.
set hlsearch " Use highlighting when doing a search.  
set nohlsearch "disable highlighting after search
set autoindent
set incsearch " While searching though a file incrementally highlight matching characters as you type.
set number "set line number
set history=200 " Set the commands to save in history default number is 20.
set nrformats-=octal
set mouse=a
set cursorline "Highlight cursor line underneath the cursor horizontally 
set signcolumn=auto "add one more column to the left
"set cursorcolumn "Highlight cursor line underneath the cursor vartically
set smartindent
set noerrorbells
set smartcase
set wrap "wrap line
set autoread
"set list
set encoding=utf-8
set showmatch " Show matching words during a search.

"Colorscheme
":colorscheme morning 
":colorscheme evening 
":colorscheme darkblue



set shiftwidth=4 "number of spaces to use for indenting
set softtabstop=4 "number of tabs to use for indenting
set tabstop=4


filetype plugin on

"Search down into subfolders
"Provides tab-completion for all file-related tasks
set path+=**

"Display all matching files when tab complete
set wildmenu

"plugin syntastic
execute pathogen#infect()

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


"create the tags file (may need to install ctags first)
"command! MakeTags !ctags -R

autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

"a man page viewer in vim
runtime! ftplugin/man.vim

""""""""""""""""""""""""""""""""""""""""""
" => Vim-plug
"""""""""""""""""""""""""""""""""""""""""

"install plugins

call plug#begin()
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'https://github.com/tpope/vim-commentary'
"Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/pangloss/vim-javascript.git' "javascript plugins provide syntax highlighting and improved indentation
Plug 'python-mode/python-mode',{'for': 'python' , 'branch': 'develop'} "python mode on vim
Plug 'gruvbox-community/gruvbox' "theme gruvbox
Plug 'https://github.com/yegappan/mru' "open last recents files
Plug 'scrooloose/syntastic'

call plug#end()

colorscheme gruvbox "change color theme

" If Vim version is equal to or greater than 7.3 enable undofile.
" This allows you to undo changes to a file even after saving it.
if version >= 703
    set undodir=~/.vim/backup
    set undofile
    set undoreload=10000
endif

"let g:airline#extensions#tabline#enabled = 1

augroup project
  autocmd!
  autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END

"javascript plugins provide syntax highlighting and improved indentation
let g:javascript_plugin_jsdoc = 1 "Enables syntax highlight for JSDocs
let g:javascript_plugin_ngdoc = 1 "Enables some additional syntac HG for NGDocs
let g:javascript_plugin_flow = 1 "Enables syntax highlight for Flow
" STATUS LINE ------------------------------------------------------------ {{{

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
"set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
"set statusline+=%=


" Show the status on the second to last line.
"set laststatus=2

" }}}

" You can split a window into sections by typing `:split` or `:vsplit`.
" Display cursorline and cursorcolumn ONLY in active window.
augroup cursor_off
    autocmd!
    autocmd WinLeave * set nocursorline nocursorcolumn
    autocmd WinEnter * set cursorline 
augroup END
