" [iro.vim]
" ~ colourful colours for colourful people ~
" Nathan Corbyn
" https://github.com/doctorn/iro

function! iro#invert_signs_toggle()
  if g:iro_invert_signs == 0
    let g:iro_invert_signs=1
  else
    let g:iro_invert_signs=0
  endif

  colorscheme iro
endfunction

function! iro#hls_show()
  set hlsearch
  call IroHlsShowCursor()
endfunction

function! iro#hls_hide()
  set nohlsearch
  call IroHlsHideCursor()
endfunction

function! iro#hls_toggle()
  if &hlsearch
    call iro#hls_hide()
  else
    call iro#hls_show()
  endif
endfunction
