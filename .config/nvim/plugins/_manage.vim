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

" Brief help
" :PlugInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PlugClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" :PlugUpdate     - update all plugins
" :PlugClean      - remove or comment line Plug 'name-of-plugin', then run :PlugClean to remove plugin

filetype off                  " required
call plug#begin('~/.vim/plugged')

" -------------- Theme and appearance ----------
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'tknightz/ikolor.vim'


" -------------- Productivity -----------------
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
Plug 'tpope/vim-speeddating'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'qpkorr/vim-bufkill'
Plug 'markonm/traces.vim'
Plug 'SirVer/ultisnips', { 'for': 'vue' }
Plug 'honza/vim-snippets', { 'for': 'vue'}
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'




" --------------- Project VSC -----------------
Plug 'tveskag/nvim-blame-line'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'simnalamburt/vim-mundo'
Plug 'tknightz/projectile.vim'


" --------------- HTML, CSS, JS-----------------
Plug 'mattn/emmet-vim', {'for': ['html', 'css','scss']}
Plug 'leafgarland/typescript-vim', {'for': 'typescript'}
Plug 'peitalin/vim-jsx-typescript', {'for': 'javascript'}
Plug 'posva/vim-vue'
" Plug 'turbio/bracey.vim', {'for': 'html'}


" ---------------- Python ----------------------
Plug 'Vimjas/vim-python-pep8-indent', {'for': 'python'}



" ---------------- Golang ----------------------
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }



" ---------------- SQL, DATABASE ----------------
Plug 'jsborjesson/vim-uppercase-sql', {'for': 'sql'}
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'



" ------------- Nvim nighty features ------------
" Plug 'nvim-lua/popup.nvim'
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'
" Plug 'onsails/lspkind-nvim'


" Initialize plugin system
call plug#end()
filetype plugin indent on    " required
