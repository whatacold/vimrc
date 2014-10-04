"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Important: 
"       This requries that you install https://github.com/amix/vimrc !
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" => Load pathogen paths
""""""""""""""""""""""""""""""
call pathogen#infect('~/.vim_runtime/sources_forked')
call pathogen#infect('~/.vim_runtime/sources_non_forked')
call pathogen#helptags()


""""""""""""""""""""""""""""""
" => TagList settings {{{
""""""""""""""""""""""""""""""
nnoremap <leader>tl :TlistToggle<CR>

let Tlist_Auto_Open=1                "start Taglist with startup of vim
let Tlist_Exit_OnlyWindow=1          " quit when TagList is the last open window
let Tlist_GainFocus_On_ToggleOpen=0  " put focus on the TagList window when it opens
"let Tlist_Process_File_Always=1     " process files in the background, even when the TagList window isn't open
"let Tlist_Show_One_File=1           " only show tags from the current buffer, not all open buffers
let Tlist_WinWidth=32                " set the width
let Tlist_Inc_Winwidth=1             " increase window by 1 when growing

" shorten the time it takes to highlight the current tag (default is 4 secs)
" note that this setting influences Vim's behaviour when saving swap files,
" but we have already turned off swap files (earlier)
"set updatetime=1000

" the default ctags in /usr/bin on the Mac is GNU ctags, so change it to the
" exuberant ctags version in /usr/local/bin
"let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'

let Tlist_Display_Prototype=0        " show function/method prototypes in the list
let Tlist_Display_Tag_Scope=0        " don't show scope info
let Tlist_Use_Right_Window=0         " show TagList window on the right
" }}}

""""""""""""""""""""""""""""""
" => cscope plugin {{{
""""""""""""""""""""""""""""""
" Use the setting in "Suggested usage" of the cscope manual
if has("cscope")
    set csprg=cscope
    set csto=0
    set cst "cscopetag, replace all instance of the :tag command with :cstag
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
        " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb
endif
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" Using 'Shift-spacebar' then a search type makes the vim window
" split horizontally, with search result displayed in
" the new window.

nmap <S-Space>s :scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <S-Space>g :scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <S-Space>c :scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <S-Space>t :scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <S-Space>e :scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <S-Space>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <S-Space>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <S-Space>d :scs find d <C-R>=expand("<cword>")<CR><CR>

" Hitting Shift-space *twice* before the search type does a vertical
" split instead of a horizontal one

nmap <S-Space><S-Space>s
            \:vert scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <S-Space><S-Space>g
            \:vert scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <S-Space><S-Space>c
            \:vert scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <S-Space><S-Space>t
            \:vert scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <S-Space><S-Space>e
            \:vert scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <S-Space><S-Space>i
            \:vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <S-Space><S-Space>d
            \:vert scs find d <C-R>=expand("<cword>")<CR><CR>
" }}}

""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>be :BufExplorer<cr>


""""""""""""""""""""""""""""""
" => MRU plugin
""""""""""""""""""""""""""""""
let MRU_Max_Entries = 400
map <leader>mr :MRU<CR>


""""""""""""""""""""""""""""""
" => YankRing
""""""""""""""""""""""""""""""
if has("win16") || has("win32")
    " Don't do anything
else
    let g:yankring_history_dir = '~/.vim_runtime/temp_dirs/'
endif


""""""""""""""""""""""""""""""
" => CTRL-P
""""""""""""""""""""""""""""""
" FIXME: use <c-f> and <c-b> for paging 
let g:ctrlp_working_path_mode = 0

let g:ctrlp_map = '<c-c>'
"map <c-b> :CtrlPBuffer<cr>

let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'


""""""""""""""""""""""""""""""
" => Peepopen
""""""""""""""""""""""""""""""
map <leader>po :PeepOpen<cr>


""""""""""""""""""""""""""""""
" => UltiSnips
""""""""""""""""""""""""""""""
" 't' for ulti, make sure these two chars could be type by left hand
let g:UltiSnipsExpandTrigger         =     "ts"
let g:UltiSnipsListSnippets          =     "tl"
let g:UltiSnipsJumpForwardTrigger    =     "tf"
let g:UltiSnipsJumpBackwardTrigger   =     "tb"


""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"au VimEnter *  NERDTree
" TODO how to not gain focus when opened, and auto quit like taglist?
let g:NERDTreeWinPos = "right"
map <leader>nt :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark 
map <leader>nf :NERDTreeFind<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => surround.vim config
" Annotate strings with gettext http://amix.dk/blog/post/19678
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => mark.vim config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> <leader>hh <Plug>MarkSet
vmap <silent> <leader>hh <Plug>MarkSet
nmap <silent> <leader>hc <Plug>MarkClear
vmap <silent> <leader>hc <Plug>MarkClear
nmap <silent> <leader>hr <Plug>MarkRegex
vmap <silent> <leader>hr <Plug>MarkRegex

