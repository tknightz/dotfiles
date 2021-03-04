"     .___________. __  ___                                 
"     |           ||  |/  /                                 
"     `---|  |----`|  '  /                                  
"         |  |     |    <                                   
"         |  |     |  .  \                                  
"         |__|     |__|\__\                                 
"       ______   ______   .__   __.  _______  __    _______ 
"      /      | /  __  \  |  \ |  | |   ____||  |  /  _____|
"     |  ,----'|  |  |  | |   \|  | |  |__   |  | |  |  __  
"     |  |     |  |  |  | |  . `  | |   __|  |  | |  | |_ | 
"     |  `----.|  `--'  | |  |\   | |  |     |  | |  |__| | 
"      \______| \______/  |__| \__| |__|     |__|  \______| 
"                                                           
"     
"     This is my personal configurations for vim, nvim.
"     You can customize it to solve your problems.


filetype off                  " required
let g:polyglot_disabled = ['vue', 'coffee-script']

call plug#begin('~/.vim/plugged')

" On-demand loading

" Theme and appearance
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'gko/vim-coloresque', {'for': ['html', 'css', 'javascript']}
Plug 'sheerun/vim-polyglot'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'pacokwon/onedarkpaco.vim'
" Plug 'joshdick/onedark.vim'

" Productivity
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'voldikss/vim-floaterm'
Plug 'haya14busa/is.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'tpope/vim-speeddating'
Plug 'qpkorr/vim-bufkill'
Plug 'Vimjas/vim-python-pep8-indent', {'for': 'python'}
Plug 'markonm/traces.vim'
Plug 'junegunn/vim-easy-align'
Plug 'pechorin/any-jump.vim', {'on': 'AnyJump'}
Plug 'jsborjesson/vim-uppercase-sql', {'for': 'sql'}
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }

Plug 'SirVer/ultisnips', { 'for': 'vue' }
Plug 'honza/vim-snippets', { 'for': 'vue'}
" Plug 'preservim/tagbar'
" Plug 'liuchengxu/vista.vim'
" Plug 'xolox/vim-notes'
" Plug 'xolox/vim-misc'


" Plugin for project manager
Plug 'tveskag/nvim-blame-line'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'simnalamburt/vim-mundo'
Plug 'tknightz/projectile.vim'
Plug 'tknightz/ikolor.vim'

" Plugin for web-mode
Plug 'mattn/emmet-vim', {'for': ['html', 'css','scss']}
Plug 'leafgarland/typescript-vim', {'for': 'typescript'}
Plug 'peitalin/vim-jsx-typescript', {'for': 'javascript'}
Plug 'turbio/bracey.vim', {'for': 'html'}
Plug 'posva/vim-vue'

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
  " let ayucolor="mirage"
  " colo ayu
  " colo palenight
  " let g:material_terminal_italics = 1
  " let g:material_theme_style = 'darker'
  " let g:tokyonight_style = 'night'
  " let g:tokyonight_enable_italic = 1
  " colo tokyonight
  let g:ikolor_transparent = 1
  colo ikolor
  " colo onedarkpaco
  " colo material
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


" Source file config

if has("xclip")
    set clipboard=unnamedplus
endif

if filereadable($HOME . "/.config/nvim/variables.vim")
    source $HOME/.config/nvim/variables.vim
endif

if filereadable($HOME . "/.config/nvim/custom_func.vim")
    source $HOME/.config/nvim/custom_func.vim
endif

if filereadable($HOME . "/.config/nvim/mapping.vim")
    source $HOME/.config/nvim/mapping.vim
endif

if filereadable($HOME . "/.config/nvim/projectile.vim")
    source $HOME/.config/nvim/projectile.vim
endif

if filereadable($HOME . "/.config/nvim/floaterm.vim")
    source $HOME/.config/nvim/floaterm.vim
endif

if filereadable($HOME . "/.config/nvim/cocnvim_config.vim")
    source $HOME/.config/nvim/cocnvim_config.vim
endif

if filereadable($HOME . "/.config/nvim/which_key.vim")
    source $HOME/.config/nvim/which_key.vim
endif

if filereadable($HOME . "/.config/nvim/override_map.vim")
    source $HOME/.config/nvim/override_map.vim
endif

" -------------------- Sources Ground ---------------------
" Source a global configuration file if available
" if filereadable("/etc/vim/vimrc.local")
"   source /etc/vim/vimrc.local
" endif
" if filereadable($HOME . "/.config/nvim/mycolo.vim")
"     source $HOME/.config/nvim/mycolo.vim
" endif
