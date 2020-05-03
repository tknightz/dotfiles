
" runtime! debian.vim
filetype off                  " required

call plug#begin('~/.vim/plugged')

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'ryanoasis/vim-devicons'

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

Plug 'tpope/vim-speeddating'
Plug 'mattn/emmet-vim'

Plug 'jceb/vim-orgmode'
Plug 'dhruvasagar/vim-table-mode'

Plug 'morhetz/gruvbox'
Plug 'arzg/vim-colors-xcode'
Plug 'dracula/vim'
" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf' 
Plug 'junegunn/fzf.vim'


" Initialize plugin system
call plug#end()

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.

" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  colo xcodedark
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif


" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)




" ------------------------- Mapping Ground ----------------------------------



" Ctrl + y Copying whole file into clipboard
nnoremap <C-y> gg"+yG
" Ctrl + y  Copying lines selected in visual mode
vnoremap <C-y> "+y
" Ctrl + p Pasting texts from clipboard to vim
nnoremap <C-p> "+gP
vnoremap <C-p> "+gP

" Ctrl + n to toggle NerdTree
map <C-n> :NERDTreeToggle<CR>

" Fuzzy Files config map
" f : FZF finds files at your current dir
nmap f :Files .<CR>
" Shift + f : FZF finds files at home dir
nmap <S-f> :Files ~/Documents/Code<CR> 

" Leader + r for rg, Leader + g for git
nmap <Leader>r :Rg<CR>
nmap <Leader>g :GFiles<CR>

" jk for escape
imap jk <ESC>

" Mapping with split
:nnoremap <Space>w <C-w>


"  --------------------------- Variables Ground ------------------------

" Config airline variables (powerline 100% vimscript)
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ' '
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_powerline_fonts = 1
let g:airline_theme='violet'

"Config fuzzy variables
let g:fzf_preview_highlighter = "highlight -O xterm256 --line-number --style rdark --force"
let g:fzf_preview_line_highlight = '\x1b[101m'
let g:fzf_preview_line_highlight = '\x1b[48;2;80;80;80m'
let g:fzf_preview_window = 'right:60%'

" Config table mode
let g:mapleader=','
let g:table_mode_corner_corner='+'
let g:table_mode_header_fillchar='='

" let $FZF_DEFAULT_COMMAND = 'rg --hidden --files ""'



" -------------------- Setting Ground ---------------------

" Set path for finding files
set rtp+=~/.fzf
:set path+=.,~,~/Documents/Code
set path+=**

" Setting tabs, highlight search some stuffs like that
set encoding=UTF-8
set background=dark
set tabstop=4
set shiftwidth=4
set expandtab
set number
:set hlsearch
set ignorecase		" Do case insensitive matching
set relativenumber
set t_Co=256



" -------------------- Sources Ground ---------------------
" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

