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
" :PlugInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PlugClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" :PlugUpdate     - update all plugins
" :PlugClean      - remove or comment line Plug 'name-of-plugin', then run :PlugClean to remove plugin
"

if has("syntax")
  set termguicolors
  let g:ikolor_transparent = 1
  colo ikolor
  syntax on
endif


" -------------------- Sources Ground ---------------------

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
