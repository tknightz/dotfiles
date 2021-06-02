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
Plug 'tknightz/ikolor.vim'
" Plug 'itchyny/lightline.vim'
" Plug 'mengelbrecht/lightline-bufferline'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'


" -------------- Productivity -----------------
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" "Plug 'voldikss/vim-floaterm'
Plug 'liuchengxu/vim-which-key'
Plug 'haya14busa/is.vim'
Plug 'vimlab/split-term.vim'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-speeddating'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'qpkorr/vim-bufkill'
Plug 'markonm/traces.vim'
Plug 'SirVer/ultisnips', { 'for': 'vue' }
Plug 'honza/vim-snippets', { 'for': 'vue'}
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tknightz/executor.vim', {'for': ['python', 'javascript', 'go']}
Plug 'chrisbra/csv.vim', {'for': 'csv'}
Plug 'mechatroner/rainbow_csv', {'for': 'csv'}



" --------------- Project VSC -----------------
Plug 'tveskag/nvim-blame-line'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'simnalamburt/vim-mundo'
Plug 'tknightz/projectile.vim'


" --------------- HTML, CSS, JS-----------------
Plug 'othree/html5.vim', {'for': 'html'}
Plug 'mattn/emmet-vim', {'for': ['html', 'css','scss']}
Plug 'leafgarland/typescript-vim', {'for': 'typescript'}
Plug 'peitalin/vim-jsx-typescript', {'for': 'javascript'}
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug 'posva/vim-vue', {'for': 'vue'}
Plug 'gko/vim-coloresque', {'for': ['html', 'css', 'scss', 'vim']}
" Plug 'turbio/bracey.vim', {'for': 'html'}


" ---------------- Python ----------------------
Plug 'Vimjas/vim-python-pep8-indent', {'for': 'python'}
Plug 'vim-python/python-syntax', {'for': 'python'}



" ---------------- Golang ----------------------
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }



" ---------------- SQL, DATABASE ----------------
Plug 'tknightz/sqlupper.vim', {'for': ['sql', 'mysql']}
Plug 'tpope/vim-dadbod',
Plug 'kristijanhusak/vim-dadbod-ui', {'on': 'DBUIToggle'}
Plug 'tknightz/autobrackets.vim'



" Initialize plugin system
call plug#end()
filetype plugin indent on    " required
