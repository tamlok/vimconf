if has('autocmd')
    augroup coc_group
        autocmd!
        if executable('clangd')
            autocmd User CocNvimInit call coc#config('languageserver.clangd.enable', v:true)
        elseif executable('ccls')
            " CCLS will always make Vim fail to save files.
            " autocmd User CocNvimInit call coc#config('languageserver.ccls.enable', v:true)
        endif
    augroup END
endif

if has('autocmd')
    augroup coc2_group
      autocmd!
      " Update signature help on jump placeholder
      autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup END
endif

call AddKeyBinding('nnoremap [c :CocPrev<CR>', 'Previous item in Cos list')
call AddKeyBinding('nnoremap ]c :CocNext<CR>', 'Next item in Cos list')
call AddKeyBinding('nnoremap [d :call CocAction("diagnosticPrevious")<CR>',
                   \ 'Previous diagnostic information')
call AddKeyBinding('nnoremap ]d :call CocAction("diagnosticNext")<CR>',
                   \ 'Next diagnostic information')
" Do not use nnoremap
call AddKeyBinding('nmap <leader>xd <Plug>(coc-definition)', 'Goto definition')
call AddKeyBinding('nmap <leader>xt <Plug>(coc-type-definition)', 'Goto type definition')
call AddKeyBinding('nmap <leader>xi <Plug>(coc-implementation)', 'Goto implementation')
call AddKeyBinding('nmap <leader>xr <Plug>(coc-references)', 'Goto all references')

call AddKeyBinding('inoremap <silent><expr> <c-space> coc#refresh()', 'Trigger completion')

function! CocStatuslineInfo()
    if !exists('g:coc_enabled') || g:coc_enabled == 0
        return ''
    endif

    let status = coc#status()
    if status == ''
        return ''
    else
        return '[' . status . ']'
    endif
endfunction
