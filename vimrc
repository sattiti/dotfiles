function! s:LoadLocalSetting()
  "if has("mac") || has("unix")
  "  let l:path = $HOME."/.vimrc_local"
  "else
  "  let l:path = $HOME."/.vimrc_local"
  "endif
  let l:path = $HOME."/.vimrc_local"
  if filereadable(expand(l:path))
    execute "source ".l:path
  else
    execute "source".$VIM."/.vimrc_local"
  endif
  unlet l:path
endfunction
call s:LoadLocalSetting()
