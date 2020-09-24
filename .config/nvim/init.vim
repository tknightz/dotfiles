
" runtime! debian.vim
filetype off                  " required

call plug#begin('~/.vim/plugged')

" On-demand loading

" Theme and appearance
Plug 'morhetz/gruvbox'
Plug 'arzg/vim-colors-xcode'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'kjssad/quantum.vim'
Plug 'pangloss/vim-javascript'

" Productivity
Plug 'jceb/vim-orgmode'
Plug 'dhruvasagar/vim-table-mode'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'liuchengxu/vim-which-key'
Plug 'voldikss/vim-floaterm'
Plug 'haya14busa/is.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'tpope/vim-speeddating'
Plug 'mattn/emmet-vim'
Plug 'qpkorr/vim-bufkill'
Plug 'gko/vim-coloresque'
Plug 'Vimjas/vim-python-pep8-indent'

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
  set termguicolors
  colo quantum
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
let g:mapleader = ','

" Vim-javascript
" let g:javascript_plugin_jsdoc = 1
" set conceallevel=1

" Ctrl + y Copying whole file into clipboard
nnoremap <C-y> gg"+yG
" Ctrl + y  Copying lines selected in visual mode
vnoremap <C-y> "+y
" Ctrl + p Pasting texts from clipboard to vim
nnoremap <C-p> "+gP
vnoremap <C-p> "+gP

" Ctrl + n to toggle NerdTree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Fuzzy Files config map
" f : FZF finds files at your current dir
" nmap <Space>f :Files ../<CR>
" Shift + f : FZF finds files at home dir
" nmap <Space>F :Files ~/Documents/Code<CR> 

" Leader + r for rg, Leader + g for git
" nmap <Leader>r :Rg<CR>

nmap <Leader>f <Plug>(coc-format-selected)

nmap <Leader>h :nohls<CR>
" jk for escape
" imap jk <ESC>

" Mapping with split
" :nnoremap <Space>w <C-w>


noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K



" :nnoremap <Space>tn :tabnew<CR>
" :nnoremap <Space>bd :bd<CR>
" :nnoremap <Space>1 1gt
" :nnoremap <Space>2 2gt
" :nnoremap <Space>3 3gt


"  --------------------------- Variables Ground ------------------------


let g:palenight_terminal_italics=1
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1


" Config airline variables (powerline 100% vimscript)
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#branch#enabled = 1
let g:airline_powerline_fonts = 1
" let g:airline_theme='violet'
let g:airline_theme='base16_snazzy'



"Config fuzzy variables
let g:fzf_preview_highlighter = "highlight -O xterm256 --line-number --style rdark --force"
let g:fzf_preview_line_highlight = '\x1b[101m'
let g:fzf_preview_line_highlight = '\x1b[48;2;80;80;80m'
let g:fzf_preview_window = 'right:50%'

let g:fzf_layout = { 'window': { 'width': 1, 'height': 0.5, 'yoffset': 1, 'border': 'horizontal' } }


"Config lazygit
command! -nargs=1 Prettier :silent CocCommand prettier.formatFile

" Config ale linter

let g:ale_linters = {
\ 'javascript': ['eslint', 'tsserver'],
\ 'python': ['pylint']
\}
let g:ale_fixers = {
\ 'javascript': ['eslint', 'prettier'],
\ 'python': ['autopep8']
\}
let g:ale_lint_on_enter = 1
let g:ale_lint_on_insert_leave = 1
let g:ale_python_flake8_options="--ignore=E501"
let g:ale_sign_error = ' ' 
let g:ale_sign_warning = ' '
let g:ale_echo_msg_error_str = ' ' 
let g:ale_echo_msg_warning_str = ' '
let g:ale_echo_msg_format = '%severity% : %s'

let g:ale_fix_on_save = 1
let g:ale_disable_lsp = 1


" Config table mode
let g:mapleader=','
let g:table_mode_corner_corner='+'
let g:table_mode_header_fillchar='='

" let $FZF_DEFAULT_COMMAND = 'rg --hidden -l "" | fzf'
" Config emmet
let g:user_emmet_mode='iv'
let g:user_emmet_install_global=0
autocmd FileType html,css EmmetInstall 
let g:user_emmet_leader_key=','

let g:user_emmet_expandabbr_key='<Tab>'
" autocmd FileType html,css imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" Confing vim markdown preview

let g:instant_markdown_autostart = 0
let g:instant_markdown_browser = "brave"

" -------------------- Setting Ground ---------------------

" Set path for finding files
set rtp+=~/.fzf
:set path+=.,~,~/Documents/Code
set path+=**

" Setting tabs, highlight search some stuffs like that
set encoding=UTF-8
set background=dark
set tabstop=2
set sw=2
set cmdheight=1
set expandtab
set number
set hlsearch
set ignorecase		" Do case insensitive matching
set relativenumber
set foldmethod=indent
set foldlevel=99
set t_Co=256
set shortmess=at
" set mouse=a

highlight Normal guibg=none ctermbg=NONE
highlight NonText guibg=none

set updatetime=300

set hidden
:set indentexpr=
set smartindent

function! TabCompletation()
    if(&ft=='html' || &ft=='css')
        return 1
    else
        return 0
    endif
endfunction


" imap <expr> <Tab> TabCompletation() ? emmet#expandAbbrIntelligent("\<tab>") : pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<Tab>" : coc#refresh()

imap <expr> <Tab> TabCompletation() ? emmet#expandAbbrIntelligent("\<tab>") : pumvisible() ? "\<C-n>" : "\<Tab>"

function! ToggleFold()
    try
        :norm zA 
    catch
        echo 'Cannot toggle fold!'
    endtry
endfunction

" nmap <Tab> :call ToggleFold()<CR>
nmap <silent> <Tab> :call ToggleFold()<CR>



if has("xclip")
    set clipboard=unnamedplus
endif

if filereadable($HOME . "/.config/nvim/float_term_config.vim")
    source $HOME/.config/nvim/float_term_config.vim
endif

if filereadable($HOME . "/.config/nvim/cocnvim_config.vim")
    source $HOME/.config/nvim/cocnvim_config.vim
endif

if filereadable($HOME . "/.config/nvim/which_key.vim")
    source $HOME/.config/nvim/which_key.vim
endif
" -------------------- Sources Ground ---------------------
" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

