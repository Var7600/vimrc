"source configurations
"https://www.freecodecamp.org/news/vimrc-configuration-guide-customize-your-vim-editor/
"plugin source https://github.com/gerardbm/vimrc


"source vimrc after modification
augroup vimrc
	au!
	au bufwritepost ~/.vimrc source ~/.vimrc
augroup END

syntax on " Turn syntax highlighting on.
filetype on "vim filetype detection
syntax enable
"leader key
let mapleader=","

"check spelling
nmap <silent> <leader>s :set spell!<CR> 
set spelllang=en_us,fr
"french Guillemets
"imap <leader>g <<>>

"clipboard
set clipboard=unamedplus

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
"set cursorcolumn "Highlight cursor line underneath the cursor vertically
set colorcolumn=80
set smartindent
set noerrorbells
set smartcase
set wrap "wrap line
set autoread
set hidden "when using buffer save current changes
"set list
set encoding=utf-8
set showmatch " Show matching words during a search.
set foldmethod=indent " adding folding
set foldlevel=99 "commad za/zm
set timeoutlen=4000 "change timeout keymapping f 1s to 4s(4000 ms)
set autowrite " Automatically save 
"easier moving of block of code
vnoremap < <gv "better indentation
vnoremap > >gv "better indentation

"move lines with ctrl + j/k
nnoremap <C-j> :m -2<CR>
nnoremap <C-k> :m +1<CR>
"buffer
"open buffer
nmap <C-e> :enew<CR>
"move to next buffer
nmap <C-n> :bnext<CR>
"move to previous buffer
nmap <C-b> :bprevious<CR>
"close the current buffer
nmap <C-x> :bd<CR>
"show all open buffers and their status
nmap <C-l> :ls<CR>

"Makefile shorcuts
nnoremap <leader>m :!make<CR>
nnoremap <leader>M :!make all<CR><CR>
nnoremap <leader>mt :!make test<CR>


"Ctags to look in cwd
set tags=./tags,tags


set shiftwidth=2 "number of spaces to use for indenting
set softtabstop=2 "number of tabs to use for indenting
set tabstop=2

"collapse/expand code
set foldmethod=indent


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


"create the tags file (may need to install ctags first)
command! MakeTags !ctags -R

autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

"a man page viewer in vim
runtime! ftplugin/man.vim

"""""""""""""""""""""""""""""""""""""""""
" => CScope config
"""""""""""""""""""""""""""""""""""""""""
" use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
set cscopetag

" check cscope for definition of a symbol before checking ctags: set to 1
" if you want the reverse search order.
set csto=1

" add any cscope database in current directory
if filereadable("cscope.out")
		cs add cscope.out
" else add the database pointed to by environment variable
elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
endif

" show msg when any other cscope db added
set cscopeverbose


    """"""""""""" My cscope/vim key mappings
    " https://cscope.sourceforge.net/cscope_maps.vim : Jason Duell
    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
    "
    " Below are three sets of the maps: one set that just jumps to your
    " search result, one that splits the existing vim window horizontally and
    " diplays your search result in the new window, and one that does the same
    " thing, but does a vertical split instead (vim 6 only).
    "
    " I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
    " unlikely that you need their default mappings (CTRL-\'s default use is
    " as part of CTRL-\ CTRL-N typemap, which basically just does the same
    " thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
    " If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
    " of these maps to use other keys.  One likely candidate is 'CTRL-_'
    " (which also maps to CTRL-/, which is easier to type).  By default it is
    " used to switch between Hebrew and English keyboard mode.
    "
    " All of the maps involving the <cfile> macro use '^<cfile>$': this is so
    " that searches over '#include <time.h>" return only references to
    " 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
    " files that contain 'time.h' as part of their name).


    " To do the first type of search, hit 'CTRL-\', followed by one of the
    " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
    " search will be displayed in the current window.  You can use CTRL-T to
    " go back to where you were before the search.
    "

nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

""""""""""""""""""""""""""""""""""""""""""
" => Vim-plug
"""""""""""""""""""""""""""""""""""""""""

"install plugins

call plug#begin()
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/pangloss/vim-javascript.git' "javascript plugins provide syntax highlighting and improved indentation
Plug 'python-mode/python-mode',{'for': 'python' , 'branch': 'develop'} "python mode on vim
Plug 'gruvbox-community/gruvbox' "theme gruvbox
Plug 'https://github.com/yegappan/mru' "open last recents files
Plug 'scrooloose/syntastic'
" A Vim Plugin for Lively Previewing LaTeX PDF Output
Plug 'xuhdev/vim-latex-live-preview'
Plug 'https://github.com/voldikss/vim-floaterm'
Plug 'https://github.com/godlygeek/tabular' "Tabular align pattern
Plug 'junegunn/fzf',{ 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/taglist.vim'
Plug 'preservim/tagbar' "browse the tags file
Plug 'jiangmiao/auto-pairs' "auto close
Plug 'https://github.com/Var7600/vim-commands'
call plug#end()

"Colorscheme

"colorscheme morning 
"colorscheme evening 
"colorscheme darkblue
"colorscheme desert
colorscheme gruvbox "change color theme

"Syntastic config
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"

"tagar 
nmap <F8> :TagbarToggle<CR>

" Show tags
noremap t :TlistToggle

" Reveal in taglist
nmap t :TlistHighlightTag

"taglist config
let Tlist_Show_One_File = 1  
let Tlist_Exit_OnlyWindow = 1  
let Tlist_Use_SingleClick = 1  
let Tlist_GainFocus_On_ToggleOpen = 1  
let Tlist_Close_On_Select = 0  
let Tlist_WinWidth = 30  
let Tlist_Auto_Highlight_Tag = 1

"floaterm mapping
"let g:floaterm_keymap_new= '<>'
let g:floaterm_keymap_toggle= '<C-t>'
let g:floaterm_width=0.8
let g:floaterm_autoclose=2

"fzf mapping
nnoremap <C-f> :Files<Cr>


"syntastic plugin error navigation
nnoremap <silent> <leader>n :lprevious<CR>
nnoremap <silent> <leader>m :lnext<CR>


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
set statusline=%{FugitiveStatusline()}

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
