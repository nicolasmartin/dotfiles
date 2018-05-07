let g:phpactorPhpBin = "/opt/rh/rh-php70/root/bin/php"

execute pathogen#infect()




se mouse=nv
se bg=dark

set antialias
set nocursorline
set nocompatible
set bs=2
set autowrite
set noswapfile
set noautowrite

autocmd! bufwritepost .vimrc source % " Automatically reload .vimrc when changing

inoremap <tab> <c-r>=InsertTabWrapper()<cr>
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction






" Include use statement
nmap <Leader>u :call phpactor#UseAdd()<CR>

" Invoke the context menu
nmap <Leader>mm :call phpactor#ContextMenu()<CR>

" Invoke the navigation menu
nmap <Leader>nn :call phpactor#Navigate()<CR>

" Goto definition of class or class member under the cursor
nmap <Leader>o :call phpactor#GotoDefinition()<CR>

" Transform the classes in the current file
nmap <Leader>tt :call phpactor#Transform()<CR>

" Generate a new class (replacing the current file)
nmap <Leader>cc :call phpactor#ClassNew()<CR>

" Extract method from selection
vmap <silent><Leader>em :<C-U>call phpactor#ExtractMethod()<CR>

autocmd FileType php setlocal omnifunc=phpactor#Complete

set t_Co=256


set encoding=UTF-8


let g:airline_powerline_fonts = 1

let g:WebDevIconsUnicodeDecorateFolderNodes = 1 



"for  CSV plugin'
filetype plugin on 



let g:ctrlp_working_path_mode = 'ra'
