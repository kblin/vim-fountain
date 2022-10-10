" =============================
" Make line uppercase then <cr>
" =============================

nnoremap <s-cr> gUU<cr>

" ==========================
" Move between scene heading
" ==========================

function! s:NextSection(backwards)
    let pattern = '\v^(INT|EXT)[.]\s'

    if a:backwards
        let dir = '?'
    else
        let dir = '/'
    endif

    execute 'silent normal! ' . dir . pattern . "\r"
endfunction

noremap <script> <buffer> <silent> ]]
        \ :call <SID>NextSection(0)<cr>

noremap <script> <buffer> <silent> [[
        \ :call <SID>NextSection(1)<cr>
