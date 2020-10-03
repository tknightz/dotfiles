" Config git blame line
let g:blameLineVirtualTextHighlight = 'Comment'
let g:blameLineVirtualTextPrefix = '  >> '
let g:blameLineGitFormat = '  a.k.a %an,  : %s,  : %ar'

set t_ZH=[3m
set t_ZR=[23m

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
set smartindent
