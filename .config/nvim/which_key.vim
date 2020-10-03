set timeoutlen=500

let g:mapleader = "\<Space>"
let g:which_key_use_floating_win = 0
let g:git_root = system('git rev-parse --show-toplevel 2> /dev/null')[:-2]

nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>

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
      \ 'w' : ['<C-W>w'     , 'other-window']          ,
      \ 'd' : ['<C-W>c'     , 'delete-window']         ,
      \ '-' : ['<C-W>s'     , 'split-window-below']    ,
      \ '/' : ['<C-W>v'     , 'split-window-right']    ,
      \ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
      \ 'h' : ['<C-W>h'     , 'window-left']           ,
      \ 'j' : ['<C-W>j'     , 'window-below']          ,
      \ 'l' : ['<C-W>l'     , 'window-right']          ,
      \ 'k' : ['<C-W>k'     , 'window-up']             ,
      \ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
      \ 'J' : ['resize +5'  , 'expand-window-below']   ,
      \ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
      \ 'K' : ['resize -5'  , 'expand-window-up']      ,
      \ '=' : ['<C-W>='     , 'balance-window']        ,
      \ 's' : ['<C-W>x'     , 'swap window']    ,
      \ 'v' : ['<C-W>v'     , 'split-window-below']    ,
      \ 't' : {
        \ 'name'    : 'transform >>',
        \ 'h'       : [',th'       , 'swap-window-vertical' ],
        \ 'k'       : [',tk'       , 'swap-window-horizontal' ],
        \},
      \ 'i' : ['iWindows'    , 'fzf-window']            ,
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

let g:which_key_map.t.m = 'which_key_ignore'

let g:which_key_map.b = {
      \ 'name' : 'buffer >>' ,
      \ 'd' : [':BD'       , 'delete-buffer'],
      \ 'f' : ['bfirst'    , 'first-buffer'],
      \ 'h' : ['Startify'  , 'home-buffer'],
      \ 'l' : ['blast'     , 'last-buffer'],
      \ 'n' : ['bnext'     , 'next-buffer'],
      \ 'p' : ['bprevious' , 'previous-buffer'],
      \ '/' : ['Buffers'   , 'fzf-buffer'],
      \ }

let g:which_key_map.f = {
      \ 'name' : 'file >>' ,
      \ 'f' : [':call Current_File_Proj()'           , 'find files here'],
      \ 'F' : [':Files ~/Documents/Code'    , 'fzf-code-folder'],
      \ 's' : [':w'                         , 'save'],
      \ 'g' : [':GFiles?'                   , 'git files changes'],
      \ 'c' : [':%y+'                       , 'copy all'],
      \ 'p' : [':call CopyPath()'           , 'copy path file'],
      \ }

let g:which_key_map.i = {
      \ 'name' : 'issues >>' ,
      \ 'n' : [':ALENext .'                 , 'next']    ,
      \ 'p' : [':ALEPrevious .'             , 'previous']    ,
      \ 'f' : [':ALEFix'                    , 'fix']    ,
      \ 'i' : [':ALEImport'                 , 'import']    ,
      \ }

let g:which_key_map.c = {
      \ 'name' : 'cocnvim >>' ,
      \ 'd' : [':CocList diagnostics'        , 'diagnostics']       ,
      \ 'e' : [':CocList extensions'         , 'extensions']        ,
      \ 'c' : [':CocList commands'           , 'commands']          ,
      \ 'o' : [':CocList outline'            , 'outline']    ,
      \ 's' : [':CocList -I symbols'         , 'symbols']     ,
      \ 'j' : [':CocNext'                    , 'next']     ,
      \ 'k' : [':CocPrev'                    , 'prev']     ,
      \ 'p' : [':CocListResume'              , 'resume'] ,
      \ }

let g:which_key_map.g = {
    \ 'name' : 'git >>',
    \ 'd'       : [':Git diff'                                  , 'diff'],
    \ 's'       : [':Gstatus'                                   , 'status'],
    \ 'm'       : [':Git mergetool'                             , 'merge'],
    \ 'g'       : [':Ggrep'                                     , 'grep'],
    \ 'D'       : [':GDelete'                                   , 'delete'],
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
        \ 'n'       : [':GitGutterNextHunk'                         , 'next' ],
        \ 'p'       : [':GitGutterPrevHunk'                         , 'previous' ],
        \ 'P'       : [':GitGutterPreviewHunk'                       , 'previous' ],
        \ 'h'       : [':GitGutterLineHighlightsToggle'             , 'highlight'],
        \ 'l'       : [':GitGutterLineNrHighlightsToggle'             , 'linenumber'],
    \},
    \ 'l'       : [':Git log'                                   , 'log'],
    \ 'w'       : [':Gwrite'                                    , 'write-add'],
    \ 'p'       : [':Git --no-pager push'                       , 'push'],
    \ 'P'       : [':Git --no-pager fetch'                      , 'pull'],
    \ 'L'       : [':FloatermNew lazygit'                       , 'lazygit'],
    \}

let g:which_key_map.p = {
    \ 'name' : 'plugin >>',
    \ 'i'       : [':PlugInstall'       , 'install-plug'],
    \ 'u'       : [':PlugUpdate'       , 'update-plug'],
    \ 'c'       : [':PlugClean'       , 'clean-plug'],
    \ 's'       : [':PlugStatus'       , 'status-plug'],
    \ 'd'       : [':PlugDiff'       , 'diff-plug'],
    \}

let g:which_key_map.P = {
  \ 'name' : 'Project >>',
  \ 'a'  : [':silent exec ":call g:Add_New_Project()"' , 'add new project'],
  \ 'l'  : [':silent exec ":call g:List_Projects()"' , 'list projects'],
  \ 'r'  : [':silent exec ":call g:Remove_Project()"' , 'remove project'],
  \}

let g:which_key_map.e = {
    \ 'name'    : 'editor >>',
    \ 't'       : [':TableModeToggle'        , 'table-mode-toggle'],
    \ 'h'       : [':nohls'             , 'disable-highlight'],
    \ 'c'       : ['<C-y>'              , 'copy-whole-file'],
    \}

let g:which_key_map.r = [':Rg'      , 'grep-search']

let g:which_key_map.s = {
    \ 'name'    : 'setting >>',
    \ 'V'       : [':e ~/.vimrc'                                 , 'vimrc' ],
    \ 'i'       : [':e ~/.config/nvim/init.vim'                  , 'init.vim' ],
    \ 'w'       : [':e ~/.config/nvim/which_key.vim'             , 'which_key' ],
    \ 'c'       : [':e ~/.config/nvim/cocnvim_config.vim'        , 'cocnvim' ],
    \ 'v'       : [':e ~/.config/nvim/variables.vim'             , 'variables' ],
    \ 'm'       : [':e ~/.config/nvim/mapping.vim'               , 'mapping' ],
    \ 'f'       : [':e ~/.config/nvim/custom_func.vim'           , 'function' ],
    \ 'p'       : [':e ~/.config/nvim/projectile.vim'            , 'projectile' ],
    \}

let g:which_key_map.q = [':q'       , 'quit']

let g:which_key_map.n = ['<C-n>'      , 'nerdtree']

let g:which_key_map['?'] = [':help'        , 'help']

let g:which_key_map.T = [':FloatermNew zsh'    , 'terminal']

let g:which_key_map.C = [':Commands'    , 'commands']

let g:which_key_map.h = [':History'     , 'history-file']

let g:which_key_map.H = [':History:'    , 'history-command']

let g:which_key_map.S = [':Colors'   , 'scheme']

call which_key#register('<Space>', "g:which_key_map")
