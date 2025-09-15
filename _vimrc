if v:progname =~? "evim"
		finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
		set nobackup		" do not keep a backup file, use versions instead
else
		set backup		" keep a backup file (restore to previous version)
		if has('persistent_undo')
				set undofile	" keep an undo file (undo changes after closing)
		endif
endif

if has("gui_running")
		au GUIEnter * simalt ~x "Start maximised
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
		au!
		" For all text files set 'textwidth' to 78 characters.
		autocmd FileType text setlocal textwidth=78
augroup END

" Windows Terminal is capable of TrueColor.
set termguicolors 

" Set LUA path
execute 'set luadll=c:/Users/jpayne/AppData/Local/Programs/Lua/bin/lua54.dll'

" Set line numbering
set number relativenumber

"Set tab width
set tabstop=4
" Use system clipboard to permit copy/paste from any program
set clipboard=unnamed

" For Vim-Commentary
filetype plugin indent on

" Ctrl + s to save file, why not
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a

" Enter the math register
nnoremap <Leader>M a<C-r>=

" Map key chord `jk` to <Esc>.
let g:esc_j_lasttime = 0
let g:esc_k_lasttime = 0
function! JKescape(key)
		if a:key=='j' | let g:esc_j_lasttime = reltimefloat(reltime()) | endif
		if a:key=='k' | let g:esc_k_lasttime = reltimefloat(reltime()) | endif
		let l:timediff = abs(g:esc_j_lasttime - g:esc_k_lasttime)
		" return (l:timediff <= 0.05 && l:timediff >=0.001) ? "\b\e" : a:key
		return (l:timediff <= 0.05) ? "\b\e" : a:key
endfunction
inoremap <expr> j JKescape('j')
inoremap <expr> k JKescape('k')

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
		packadd! matchit
endif

" Add Vim-Plug
call plug#begin()
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'scrooloose/nerdtree' "File navigation tree
"Plug 'preservim/nerdcommenter'
Plug 'liuchengxu/vim-which-key' "Menu to show commands
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "Fuzzy finder
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround' "Insert bracket sets 
Plug 'tpope/vim-repeat' "Required for other things, it repeats
Plug 'tpope/vim-commentary' "Insert comment
Plug 'svermeulen/vim-easyclip' "Improved delete/yank. D no longer yanks, only deletes. M(ove) yanks and deletes.
Plug 'Raimondi/delimitMate'
Plug 'ryanoasis/vim-devicons' "Nice icons
Plug 'neoclide/coc.nvim', {'branch': 'release'} "Code completion
Plug 'machakann/vim-highlightedyank' "Show what is yanked
Plug 'auwsmit/mru' "MostRecentlyUsed
Plug 'romainl/vim-cool' "Fixes search highlighting
Plug 'itchyny/lightline.vim' "prettier statusbar
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } "Go dev environment
call plug#end()

colorscheme catppuccin_macchiato

" Map NERDTreeToggle to F6
nmap <F6> :NERDTreeToggle<CR>
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif
" Start NERDTree, unless a file or session is specified, eg. vim -S session_file.vim.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif
" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') | execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | wincmd p | endif
" Refresh the current folder if any changes
autocmd BufEnter NERD_tree_* | execute 'normal R'
au CursorHold * if exists("t:NerdTreeBufName") | call <SNR>15_refreshRoot() | endif
"Reload the window if directory is changed
augroup DIRCHANGE
		au!
		autocmd DirChanged global :NERDTreeCWD
augroup END 

"Which-Key
let g:which_key_vertical = 1
let g:which_key_display_names = {'SPC': '␣', '<SPC>': '␣' , ' ': '␣', '<CR>': '↵', '<TAB>': '⇆', '<C-I>': '⇆', '<C-H>': '⭠'}
let g:mapleader = "\<Space>"
let g:which_key_timeout = 100
nnoremap <silent> <leader> :silent <c-u> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>
let g:which_key_map = {}
let g:which_key_map.K = 'which_key_ignore'
						" let g:which_key_map['c'] = {
						\ 'name' : '+NERDCommenter',
						\}
let g:which_key_map['M'] = ['a<C-r>=', 'Math Register']
let g:which_key_map['c'] = ['gcc', 'Comment Line']
let g:which_key_map['f'] = {
						\ 'name' : '+Find',
						\ 'p' : ['/', 'Pattern Dn'],
						\ 'u' : ['?', 'Pattern Up'],
						\ 'f' : [':Files', 'Fuzzy Find Files'],
						\ 'w' : [':Files', 'Fuzzy Find Windows'],
						\}
let g:which_key_map['g'] = ['gg=G', "Auto Indent"]
let g:which_key_map['p'] = 'which_key_ignore'
let g:which_key_map['P'] = 'which_key_ignore' 
let g:which_key_map['m'] = ['mm', "Move/Cut Line"]
let g:which_key_map['l'] = {
						\ 'name' : '+Vim-Plug',
						\ 'i' : [':PlugInstall', 'Install'],
						\ 'u' : [':PlugUpdate', 'Update'],
						\ 'c' : [':PlugClean', 'Clean'],
						\ 's' : [':PlugStatus', 'Status'],
						\ 'r' : [':source $HOME/_vimrc', 'Source _vimrc'],
						\ }
let g:which_key_map['s'] = {
						\ 'name' : '+Vim-Surround',
						\ 'c' : ['cs', 'Change surround'],
						\ 'd' : ['ds', 'Delete surround'],
						\ 'w' : ['ysiw', 'Wrap word'],
						\ 'l' : ['yss', 'Wrap line'],
						\}
let g:which_key_map['t'] = {
						\ 'name' : '+Tabs',
						\ '0' : [':tablast', 'Last Tab'],
						\ '1' : ['1gt', '1st Tab'],
						\ '2' : ['2gt', '2nd Tab'],
						\ '3' : ['3gt', '3rd Tab'],
						\ '4' : ['4gt', '4th Tab'],
						\ '5' : ['5gt', '5th Tab'],
						\ '6' : ['6gt', '6th Tab'],
						\ '7' : ['7gt', '7th Tab'],
						\ '8' : ['8gt', '8th Tab'],
						\ '9' : ['9gt', '9th Tab'],
						\'x' : [':tabclose', 'Close Tab'],
						\ }
let g:which_key_map['w'] = {
						\ 'name' : '+Windows' ,
						\ 'w' : ['<C-W>w'     , 'other-window']          ,
						\ 'd' : ['<C-W>c'     , 'delete-window']         ,
						\ '-' : ['<C-W>s'     , 'split-window-below']    ,
						\ '|' : ['<C-W>v'     , 'split-window-right']    ,
						\ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
						\ 'h' : ['<C-W>h'     , 'window-left']           ,
						\ 'j' : ['<C-W>j'     , 'window-below']          ,
						\ 'l' : ['<C-W>l'     , 'window-right']          ,
						\ 'k' : ['<C-W>k'     , 'window-up']             ,
						\ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
						\ 'J' : [':resize +5'  , 'expand-window-below']   ,
						\ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
						\ 'K' : [':resize -5'  , 'expand-window-up']      ,
						\ '=' : ['<C-W>='     , 'balance-window']        ,
						\ 's' : ['<C-W>s'     , 'split-window-below']    ,
						\ 'v' : ['<C-W>v'     , 'split-window-below']    ,
						"\ '?' : ['Windows'    , 'fzf-window']            ,
						\ }
call which_key#register('<Space>', "g:which_key_map")  

" DelimitMate
" Disable for file type 'mail'
" au FileType mail let b:delimitMate_autoclose = 0

" coc
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm(): "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" MostRecentlyUsed
nmap <F7> :MRUToggle<CR>

" Lightline color config
set noshowmode
let g:lightline = {
						\ 'colorscheme': 'wombat',
						\ }
