syntax on
" set guifont=Lucida_Sans_Typewriter_Regular:h10:cANSI
set guifont=Lucida_Console:h12:cANSI
set rop=type:directx,geom:1,taamode:1
set enc=utf-8
execute pathogen#infect()

set nocompatible
filetype plugin indent on
runtime macros/matchit.vim
set hidden
if has("autocmd")
  autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
endif

set expandtab
set history=200
set nolist
set shiftwidth=4
set tabstop=4
set wildmode=longest,list
set diffopt+=vertical

set numberwidth=3
set cpoptions+=n
" highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
set background=dark
colorscheme solarized
" colorscheme torte

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_haskell_ghc_mod_exec = 'ghc-mod.sh'

nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬
        
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction

function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction

cnoremap %% <C-R>=fnameescape(expand('%:h')).'\'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
set showbreak=…
nmap <silent> <leader>s :set spell!<CR>
set laststatus=2

