let g:git_root = system('git rev-parse --show-toplevel 2> /dev/null')[:-2]

nnoremap <Space>C :Commands<CR>
nnoremap <Space>E :Execute<CR>
nnoremap <Space>Fc :call g:Convert_Json()<CR>
nnoremap <Space>Fj :%!python -m json.tool<CR>
nnoremap <Space>H :History:<CR>
nnoremap <Space>Pa :call call("g:Add_Project", [])<CR>
nnoremap <Space>Pr :call call("g:Remove_Project", [])<CR>
nnoremap <Space>Pf :call call("g:Find_In_Project", [])<CR>
nnoremap <Space>Pl :call call("g:List_Projects", [])<CR>
nnoremap <Space>S :Colors<CR>
nnoremap <Space>T :FloatermNew zsh<CR>
nnoremap <Space>bp :bprevious<CR>
nnoremap <Space>bd :BD<CR>
nnoremap <Space>bf :bfirst<CR>
nnoremap <Space>bh :Startify<CR>
nnoremap <Space>bi :Buffers<CR>
nnoremap <Space>bl :blast<CR>
nnoremap <Space>bn :bnext<CR>
nnoremap <Space>b/ :Buffers<CR>
nnoremap <Space>cs :CocList -I symbols<CR>
nnoremap <Space>ck :CocPrev<CR>
nnoremap <Space>cc :CocList commands<CR>
nnoremap <Space>cd :CocList diagnostics<CR>
nnoremap <Space>cp :CocListResume<CR>
nnoremap <Space>cj :CocNext<CR>
nnoremap <Space>co :CocList outline<CR>
nnoremap <Space>ce :CocList extensions<CR>
nnoremap <Space>ep <C-o>
nnoremap <Space>ec <C-y>
nnoremap <Space>et :TableModeToggle<CR>
nnoremap <Space>eh :nohls<CR>
nnoremap <Space>el g;
nnoremap <Space>fcp :call CopyPath("project")<CR>
nnoremap <Space>fca :%y+
nnoremap <Space>fcd :call CopyPath("dir")<CR>
nnoremap <Space>fcf :call CopyPath("file")<CR>
nnoremap <Space>fp :Files .<CR>
nnoremap <Space>fr :call Insert_Relative_Path()<CR>
nnoremap <Space>fs :update<CR>
nnoremap <Space>ff :call Current_File_Proj()<CR>
nnoremap <Space>fw :call SearchForWord()<CR>
nnoremap <Space>fg :GFiles?<CR>
nnoremap <Space>gBc :call Git_Checkout_Branch()<CR>
nnoremap <Space>gBm :Git checkout master<CR>
nnoremap <Space>gBn :call Git_New_Branch()<CR>
nnoremap <Space>gD :GDelete<CR>
nnoremap <Space>gL :FloatermNew lazygit<CR>
nnoremap <Space>gP :Git --no-pager pull origin master<CR>
nnoremap <Space>gb :ToggleBlameLine<CR>
nnoremap <Space>gc :Git commit -a<CR>
nnoremap <Space>gd :Git diff<CR>
nnoremap <Space>gf :GFiles?<CR>
nnoremap <Space>gg :Ggrep<CR>
nnoremap <Space>ghp :GitGutterPrevHunk<CR>
nnoremap <Space>ghP :GitGutterPreviewHunk<CR>
nnoremap <Space>ghh :GitGutterLineHighlightsToggle<CR>
nnoremap <Space>ghl :GitGutterLineNrHighlightsToggle<CR>
nnoremap <Space>ghn :GitGutterNextHunk<CR>
nnoremap <Space>gl :Git log<CR>
nnoremap <Space>gm :Git mergetool<CR>
nnoremap <Space>gp :Git --no-pager push origin Head<CR>
nnoremap <Space>gr :Gread<CR>
nnoremap <Space>gs :Gstatus<CR>
nnoremap <Space>gw :Gwrite<CR>
nnoremap <Space>hf :History<CR>
nnoremap <Space>he :MundoToggle<CR>
nnoremap <Space>ip :ALEPrevious .<CR>
nnoremap <Space>if :ALEFix<CR>
nnoremap <Space>ii :ALEImport<CR>
nnoremap <Space>in :ALENext .<CR>
nnoremap <Space>n :NERDTreeToggle<CR>
nnoremap <Space>ps :PlugStatus<CR>
nnoremap <Space>pc :PlugClean<CR>
nnoremap <Space>pd :PlugDiff<CR>
nnoremap <Space>pi :PlugInstall<CR>
nnoremap <Space>pu :PlugUpdate<CR>
nnoremap <Space>q :QuitVim<CR>
nnoremap <Space>r :Rg<CR>
nnoremap <Space>sc :e ~/.config/nvim/plugins/_postload/_colors.vim<CR>
nnoremap <Space>sa :e ~/.config/nvim/autocmd/autocmd.vim<CR>
nnoremap <Space>sfg :e ~/.config/nvim/functions/_git.vim<CR>
nnoremap <Space>sfk :e ~/.config/nvim/functions/_kits.vim<CR>
nnoremap <Space>sfe :e ~/.config/nvim/functions/_editor.vim<CR>
nnoremap <Space>sC :e ~/.config/nvim/others/_cocnvim.vim<CR>
nnoremap <Space>sV :e ~/.vimrc<CR>
nnoremap <Space>sw :e ~/.config/nvim/others/_whichkey.vim<CR>
nnoremap <Space>si :e ~/.config/nvim/init.vim<CR>
nnoremap <Space>sv :e ~/.config/nvim/variables/variables.vim<CR>
nnoremap <Space>sp :e ~/.config/nvim/plugins/_manage.vim<CR>
nnoremap <Space>smw :e ~/.config/nvim/mappings/_windows.vim<CR>
nnoremap <Space>sme :e ~/.config/nvim/mappings/_editor.vim<CR>
nnoremap <Space>t1 1gt
nnoremap <Space>t2 2gt
nnoremap <Space>t3 3gt
nnoremap <Space>t4 4gt
nnoremap <Space>tx :tabclose<CR>
nnoremap <Space>tt :call tablemode#Toggle<CR>
nnoremap <Space>tn :tabnew<CR>
nnoremap <Space>wH <C-W>5<
nnoremap <Space>wJ resize +5
nnoremap <Space>wK resize -5
nnoremap <Space>wL <C-W>5>
nnoremap <Space>wd <C-W>c
nnoremap <Space>wh <C-W>h
nnoremap <Space>wi :Windows<CR>
nnoremap <Space>wj <C-W>j
nnoremap <Space>wk <C-W>k
nnoremap <Space>wl <C-W>l
nnoremap <Space>w- <C-W>s
nnoremap <Space>w/ <C-W>v
nnoremap <Space>w2 <C-W>v
nnoremap <Space>ws <C-W>x
nnoremap <Space>wth <C-W>t<C-w>H
nnoremap <Space>wtk <C-W>t<C-w>K
nnoremap <Space>wv <C-W>v
nnoremap <Space>ww <C-W>w
nnoremap <Space>w= <C-W>=
nnoremap <Space>? :help<CR>
