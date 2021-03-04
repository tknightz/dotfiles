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



" Config for vim-go
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_calls = 1
let g:go_addtags_transform = "camelcase"
let g:go_auto_type_info = 1
let g:go_fmt_command = "goimports"



" Config git blame line
let g:blameLineVirtualTextHighlight = 'Comment'
let g:blameLineVirtualTextPrefix = '  >> '
let g:blameLineGitFormat = '  a.k.a %an,  : %s,  : %ar'


" Config git guiter
highlight GitGutterAdd    guifg=#40ff73 gui=bold ctermfg=2
highlight GitGutterChange guifg=#d3ff0f gui=bold ctermfg=226
highlight GitGutterDelete guifg=#d90000 gui=bold ctermfg=1


" Config utilsnipet
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<c-p>"
let g:UltiSnipsJumpBackwardTrigger="<c-n>"




" Config cursor and font italic for tmux
set t_ZH=[3m
set t_ZR=[23m
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"


" Config airline variables (powerline 100% vimscript)
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#keymap#enabled = 0
let g:airline_symbols.dirty='  '
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_powerline_fonts = 1
let g:airline_theme='base16_snazzy'

let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#displayed_head_limit = 10

" let g:airline_section_c = '%{expand("%:t")}'
let g:airline_section_y = ''
let g:airline_section_c = ' '

"Config fuzzy variables
let g:fzf_preview_highlighter = "highlight -O xterm256 --line-number --style rdark --force"
" let g:fzf_preview_line_highlight = '\x1b[101m'
let g:fzf_preview_line_highlight = '\x1b[48;2;80;80;80m'
let g:fzf_preview_window = 'right:50%'
let g:fzf_colors = {
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Label'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Operator'],
  \ 'info':    ['fg', 'Comment'],
  \ 'border':  ['fg', 'Folded'],
  \ 'prompt':  ['fg', 'Function'],
  \ 'pointer': ['fg', 'Statement'],
  \ 'marker':  ['fg', 'Conditional'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" let g:table_mode_header_fillchar='='
" let $FZF_DEFAULT_COMMAND = 'rg --hidden -l "" | fzf'



"Config lazygit
command! -nargs=1 Prettier :silent CocCommand prettier.formatFile

" Config ale linter
let g:ale_linters = {
\ 'javascript': ['eslint', 'tsserver'],
\ 'python': ['flake8']
\}
let g:ale_fixers = {
\ 'javascript': ['eslint', 'prettier'],
\ 'python': ['black']
\}
let g:ale_completion_autoimport = 1
let g:ale_lint_on_insert_leave = 1
let g:ale_python_flake8_options="--ignore=E501"
let g:ale_sign_error = ' ' 
let g:ale_sign_warning = ' '
let g:ale_echo_msg_error_str = ' ' 
let g:ale_echo_msg_warning_str = ' '
let g:ale_echo_msg_format = '%severity% : %s'
let g:ale_disable_lsp = 1


" Config table mode
let g:table_mode_corner_corner='+'

" Config emmet
let g:user_emmet_mode='iv'
let g:user_emmet_install_global=0
autocmd FileType html,css EmmetInstall 
let g:user_emmet_leader_key=','

let g:user_emmet_expandabbr_key='<Tab>'
autocmd FileType html,css imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")


" Confing vim markdown preview
let g:instant_markdown_autostart = 0
let g:instant_markdown_browser = "brave"
let g:instant_markdown_port = 6969

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
" set colorcolumn=80
" set hlsearch
set ignorecase		" Do case insensitive matching
set relativenumber
set foldmethod=indent
set foldlevel=99
set t_Co=256
" set smartcase
" set mouse=a

set cursorline
set updatetime=300
set hidden
set undofile
set undodir=~/.vim/undo
set completefunc=emoji#complete
set formatoptions=tcrq
set signcolumn=yes
" set smartindent

" For better Vietnamese typing
if exists('$TMUX')
    " tmux will only forward escape sequences to the terminal if surrounded by a DCS sequence
    let &t_SI .= "\<Esc>Ptmux;\<Esc>\<Esc>[5 q\<Esc>\\"
    let &t_SR .= "\<Esc>Ptmux;\<Esc>\<Esc>[4 q\<Esc>\\"
    let &t_EI .= "\<Esc>Ptmux;\<Esc>\<Esc>[2 q\<Esc>\\"
    autocmd VimLeave * silent !echo -ne "\033Ptmux;\033\033[0 q\033\\"
else
    let &t_SI = "\<Esc>[5 q"
    let &t_SR = "\<Esc>[4 q"
    let &t_EI = "\<Esc>[1 q"

    autocmd VimLeave * silent !echo -ne "\033[0 q"
endi

" auto jump to last edited position.
autocmd BufReadPost * silent! normal! g`"zv 
