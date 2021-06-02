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

let g:mapleader="\<Space>"

let g:which_key_centered = 0
let g:which_key_use_floating_win = 0
let g:git_root = system('git rev-parse --show-toplevel 2> /dev/null')[:-2]

" nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>

" Map leader to which_key
" nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
" vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Hide status line
" autocmd! FileType which_key
" autocmd  FileType which_key set laststatus=0 noshowmode noruler
"   \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

let g:which_key_map = {}

let g:which_key_map.w = {
      \ 'name' : 'windows >>' ,
      \ 'w' : ['<C-W>w'     , 'other-window'          ],
      \ 'd' : ['<C-W>c'     , 'delete-window'         ],
      \ '-' : ['<C-W>s'     , 'split-window-below'    ],
      \ '/' : ['<C-W>v'     , 'split-window-right'    ],
      \ '2' : ['<C-W>v'     , 'layout-double-columns' ],
      \ 'h' : ['<C-W>h'     , 'window-left'           ],
      \ 'j' : ['<C-W>j'     , 'window-below'          ],
      \ 'l' : ['<C-W>l'     , 'window-right'          ],
      \ 'k' : ['<C-W>k'     , 'window-up'             ],
      \ 'H' : ['<C-W>5<'    , 'expand-window-left'    ],
      \ 'J' : ['resize +5'  , 'expand-window-below'   ],
      \ 'L' : ['<C-W>5>'    , 'expand-window-right'   ],
      \ 'K' : ['resize -5'  , 'expand-window-up'      ],
      \ '=' : ['<C-W>='     , 'balance-window'        ],
      \ 's' : ['<C-W>x'     , 'swap window'           ],
      \ 'v' : ['<C-W>v'     , 'split-window-below'    ],
      \ 't' : {
        \ 'name'    : 'transform >>',
        \ 'h'       : ['<C-W>tH'       , 'swap-window-vertical' ],
        \ 'k'       : ['<C-W>tK'       , 'swap-window-horizontal' ],
        \},
      \ 'i' : [':Windows'    , 'fzf-window'],
      \ }

let g:which_key_map.t = {
    \ 'name' : 'tab >>',
    \ 'n' : [':tabnew'                          , 'Create a new tab'],
    \ '1' : ['1gt'                              , 'Go to tab 1'],
    \ '2' : ['2gt'                              , 'Go to tab 2'],
    \ '3' : ['3gt'                              , 'Go to tab 3'],
    \ '4' : ['4gt'                              , 'Go to tab 4'],
    \ 'x' : [':tabclose'                        , 'Close tab.'],
    \ 't' : [':call tablemode#Toggle'           , 'TableModeToggle'],
    \ }

let g:which_key_map.d = {
    \ 'name' : 'database >>',
    \ 'a' : [':DBUIAddConnection'                       , 'Add new connection'],
    \ 't' : [':DBUIToggle'                              , 'Toggle DBUI'],
    \ 'f' : [':DBUIFindBuffer'                          , 'Find buffer'],
    \ 'r' : [':DBUIRenameBuffer'                        , 'Rename buffer'],
    \ 'l' : [':DBUILastQueryInfo'                       , 'Last query info'],
    \ 'h' : [':DBUIHideNotifications'                   , 'Hide notifications'],
    \ }

let g:which_key_map.t.m = 'which_key_ignore'

let g:which_key_map['!'] = { 'name': 'which_key_ignore' }

let g:which_key_map.F = {
      \ 'name' : 'format >>',
      \ 'j'    : [':%!python -m json.tool'         , 'Json'],
      \ 'c'    : [':call g:Convert_Json()'         , 'Convert Json'],
      \}

let g:which_key_map.b = {
      \ 'name' : 'buffer >>' ,
      \ 'd' : [':BD'        , 'delete-buffer'],
      \ 'f' : [':bfirst'    , 'first-buffer'],
      \ 'h' : [':Startify'  , 'home-buffer'],
      \ 'l' : [':blast'     , 'last-buffer'],
      \ 'n' : [':bnext'     , 'next-buffer'],
      \ 'p' : [':bprevious' , 'previous-buffer'],
      \ '/' : [':Buffers'   , 'fzf-buffer'],
      \ 'i' : [':Buffers'   , 'IBuffer'],
      \ }

let g:which_key_map.f = {
      \ 'name' : 'file >>' ,
      \ 'f' : [':call call("g:Current_File_Proj", [])'         , 'find files here'],
      \ 'w' : [':call SearchForWord()'                         , 'find word'],
      \ 's' : [':update'                                       , 'save'],
      \ 'g' : [':GFiles?'                                      , 'git files changes'],
      \ 'c' : {
            \ 'name': 'copy >>',
            \ 'a'   : [':%y+'                      ,'all'],
            \ 'd'   : [':call CopyPath("dir")'     ,'directory path'],
            \ 'f'   : [':call CopyPath("file")'    ,'file path'],
            \ 'p'   : [':call CopyPath("project")' ,'project path'],
      \},
      \ 'p' : [':Files .'                            , 'project fzf'],
      \ 'r' : [':call Insert_Relative_Path()'        , 'relative path importer'],
      \ }

let g:which_key_map.i = {
      \ 'name' : 'issues >>' ,
      \ 'n' : [':ALENext .'                 , 'next'],
      \ 'p' : [':ALEPrevious .'             , 'previous'],
      \ 'f' : [':ALEFix'                    , 'fix'],
      \ 'i' : [':ALEImport'                 , 'import'],
      \ }

let g:which_key_map.c = {
      \ 'name' : 'cocnvim >>' ,
      \ 'd' : [':CocList diagnostics'        , 'diagnostics'],
      \ 'e' : [':CocList extensions'         , 'extensions'],
      \ 'c' : [':CocList commands'           , 'commands'],
      \ 'o' : [':CocList outline'            , 'outline'],
      \ 's' : [':CocList -I symbols'         , 'symbols'],
      \ 'j' : [':CocNext'                    , 'next'],
      \ 'k' : [':CocPrev'                    , 'prev'],
      \ 'p' : [':CocListResume'              , 'resume'],
      \ }

let g:which_key_map.g = {
    \ 'name' : 'git >>',
    \ 'd'       : [':Git diff'                                  , 'diff'],
    \ 's'       : [':Gstatus'                                   , 'status'],
    \ 'm'       : [':Git mergetool'                             , 'merge'],
    \ 'g'       : [':Ggrep'                                     , 'grep'],
    \ 'D'       : [':GDelete'                                   , 'delete'],
    \ 'f'       : [':GFiles?'                                   , 'git files changes'],
    \ 'r'       : [':Gread'                                     , 'read'],
    \ 'c'       : [':Git commit -a'                             , 'commit'],
    \ 'b'       : [':ToggleBlameLine'                           , 'blame'],
    \ 'B' : {
        \ 'name' : 'branch >>',
        \ 'c'       : [':call Git_Checkout_Branch()'       , 'checkout?' ],
        \ 'm'       : [':Git checkout master'              , 'master' ],
        \ 'n'       : [':call Git_New_Branch()'            , 'new' ],
    \},
    \ 'h' : {
        \ 'name' : 'hunk >>',
        \ 'n'       : [':GitGutterNextHunk'                    , 'next' ],
        \ 'p'       : [':GitGutterPrevHunk'                    , 'previous' ],
        \ 'P'       : [':GitGutterPreviewHunk'                 , 'previous' ],
        \ 'h'       : [':GitGutterLineHighlightsToggle'        , 'highlight'],
        \ 'l'       : [':GitGutterLineNrHighlightsToggle'      , 'linenumber'],
    \},
    \ 'l'       : [':Git log'                             , 'log'],
    \ 'w'       : [':Gwrite'                              , 'write-add'],
    \ 'p'       : [':Git --no-pager push origin Head'     , 'push'],
    \ 'P'       : [':Git --no-pager pull origin master'   , 'pull'],
    \ 'L'       : [':FloatermNew lazygit'                 , 'lazygit'],
    \}

let g:which_key_map.p = {
    \ 'name'    : 'plugin >>',
    \ 'i'       : [':PlugInstall'       , 'install-plug'],
    \ 'u'       : [':PlugUpdate'        , 'update-plug'],
    \ 'c'       : [':PlugClean'         , 'clean-plug'],
    \ 's'       : [':PlugStatus'        , 'status-plug'],
    \ 'd'       : [':PlugDiff'          , 'diff-plug'],
    \}

let g:which_key_map.P = {
  \ 'name' : 'Project >>',
  \ 'a'  : {
      \ 'name'  : 'add >>',
      \ 'n'     : [':call call("g:Add_Project", [])'    , 'add new project'],
      \ 'c'     : [':call call("g:Add_Current_Project", [])'   , 'add current project']
  \},
  \ 'l'  : [':call call("g:List_Projects", [])'        , 'list projects'],
  \ 'r'  : [':call call("g:Remove_Project", [])'       , 'remove project'],
  \ 'f'  : [':call call("g:Find_In_Project", [])'      , 'find files in project'],
  \}

let g:which_key_map.e = {
    \ 'name'    : 'editor >>',
    \ 't'       : [':TableModeToggle'   , 'table-mode-toggle'],
    \ 'h'       : [':nohls'             , 'disable-highlight'],
    \ 'c'       : ['<C-y>'              , 'copy-whole-file'],
    \ 'p'       : ['<C-o>'              , 'previous position'],
    \ 'l'       : ['g;'                 , 'last changes'],
    \}

let g:which_key_map.E = [':Execute'  , 'Executor']

let g:which_key_map.r = [':Rg'      , 'grep-search']

let g:which_key_map.s = {
    \ 'name'    : 'setting >>',
    \ 'V'       : [':e ~/.vimrc'                                        , 'vimrc' ],
    \ 'i'       : [':e ~/.config/nvim/init.vim'                         , 'init.vim' ],
    \ 'a'       : [':e ~/.config/nvim/autocmd/autocmd.vim'              , 'autocmd.vim' ],
    \ 'w'       : [':e ~/.config/nvim/others/_whichkey.vim'             , 'which_key' ],
    \ 'C'       : [':e ~/.config/nvim/others/_cocnvim.vim'              , 'cocnvim' ],
    \ 'c'       : [':e ~/.config/nvim/plugins/_postload/_colors.vim'    , 'colors' ],
    \ 'v'       : [':e ~/.config/nvim/variables/variables.vim'          , 'variables' ],
    \ 'p'       : [':e ~/.config/nvim/plugins/_manage.vim'              , 'plugins' ],
    \ 'f' : {
        \ 'name' : 'functions >>',
        \ 'g'       : [':e ~/.config/nvim/functions/_git.vim'           , 'git' ],
        \ 'e'       : [':e ~/.config/nvim/functions/_editor.vim'        , 'editor' ],
        \ 'k'       : [':e ~/.config/nvim/functions/_kits.vim'          , 'kits' ],
    \},
    \ 'm' : {
        \ 'name' : 'mappings >>',
        \ 'w'       : [':e ~/.config/nvim/mappings/_windows.vim'       , 'windows' ],
        \ 'e'       : [':e ~/.config/nvim/mappings/_editor.vim'        , 'editor' ],
    \},
    \}

let g:which_key_map.h = {
  \ 'name'      : 'history >>',
  \ 'f'         : [':History'          , 'file'],
  \ 'e'         : [':MundoToggle'      , 'edit'],
  \}

let g:which_key_map.q = [':QuitVim'  , 'quit']

let g:which_key_map.n = [':NERDTreeToggle'     , 'nerdtree']

let g:which_key_map['?'] = [':help'            , 'help']

let g:which_key_map.T = [':FloatermNew zsh'    , 'terminal']

let g:which_key_map.C = [':Commands'           , 'commands']


let g:which_key_map.H = [':History:'           , 'history-command']

let g:which_key_map.S = [':Colors'             , 'scheme']

call which_key#register('<Space>', "g:which_key_map")


" autocmd! User vim-which-key call which_key#register('<Space>', 'g:which_key_map')
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
set timeoutlen=1000
