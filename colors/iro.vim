" [iro.vim]
" ~ colourful colours for colourful people ~
" Nathan Corbyn
" https://github.com/doctorn/iro

if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name='iro'

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif

if !exists('g:iro_bold')
  let g:iro_bold=1
endif
if !exists('g:iro_italic')
  if has('gui_running') || $TERM_ITALICS == 'true'
    let g:iro_italic=1
  else
    let g:iro_italic=0
  endif
endif
if !exists('g:iro_undercurl')
  let g:iro_undercurl=1
endif
if !exists('g:iro_underline')
  let g:iro_underline=1
endif
if !exists('g:iro_inverse')
  let g:iro_inverse=1
endif

if !exists('g:iro_guisp_fallback') || index(['fg', 'bg'], g:iro_guisp_fallback) == -1
  let g:iro_guisp_fallback='NONE'
endif

if !exists('g:iro_improved_strings')
  let g:iro_improved_strings=0
endif

if !exists('g:iro_improved_warnings')
  let g:iro_improved_warnings=0
endif

if !exists('g:iro_termcolors')
  let g:iro_termcolors=256
endif

if !exists('g:iro_invert_indent_guides')
  let g:iro_invert_indent_guides=0
endif

if exists('g:iro_contrast')
  echo 'g:iro_contrast is deprecated; use g:iro_contrast_light and g:iro_contrast_dark instead'
endif

if !exists('g:iro_contrast_dark')
  let g:iro_contrast_dark='medium'
endif

if !exists('g:iro_contrast_light')
  let g:iro_contrast_light='medium'
endif

let s:is_dark=(&background == 'dark')

let s:iro = {}

let s:iro.dark0_hard  = ['#373a41', 59]
let s:iro.dark0       = ['#373a41', 59]
let s:iro.dark0_soft  = ['#373a41', 59]
let s:iro.dark1       = ['#41454d', 59]
let s:iro.dark2       = ['#4c515a', 59]
let s:iro.dark3       = ['#575c67', 59]
let s:iro.dark4       = ['#626874', 60]
let s:iro.dark4_256   = ['#6d7381', 66]

"TODO fix names
let s:iro.gray_245    = ['#6d7381', 66]
let s:iro.gray_244    = ['#777e8d', 102]

let s:iro.light0_hard = ['#f2f3f4', 231]
let s:iro.light0      = ['#f2f3f4', 231]
let s:iro.light0_soft = ['#f2f3f4', 231]
let s:iro.light1      = ['#d9dbdf', 188]
let s:iro.light2      = ['#c1c4cb', 152]
let s:iro.light3      = ['#a8acb6', 145]
let s:iro.light4      = ['#8f9fa1', 109]
let s:iro.light4_256  = ['#777e8d', 102]

let s:iro.bright_red      = ['#db5343', 167]
let s:iro.bright_green    = ['#84c940', 113]
let s:iro.bright_yellow   = ['#fcc01a', 214]
let s:iro.bright_blue     = ['#31a9f3', 75]
let s:iro.bright_purple   = ['#f95882', 204]
let s:iro.bright_aqua     = ['#42d5f3', 81]
let s:iro.bright_orange   = ['#fe8b2d', 208]

let s:iro.neutral_red    = ['#d84231', 167]
let s:iro.neutral_green  = ['#78c42d', 112]
let s:iro.neutral_yellow = ['#fcba04', 214]
let s:iro.neutral_blue   = ['#1da1f2', 39]
let s:iro.neutral_purple = ['#f94a76', 204]
let s:iro.neutral_aqua   = ['#30d1f2', 81]
let s:iro.neutral_orange = ['#fe8019', 208]

let s:iro.faded_red      = ['#db5343', 167]
let s:iro.faded_green    = ['#84c940', 113]
let s:iro.faded_yellow   = ['#fcc01a', 214]
let s:iro.faded_blue     = ['#31a9f3', 75]
let s:iro.faded_purple   = ['#f95882', 204]
let s:iro.faded_aqua     = ['#42d5f3', 81]
let s:iro.faded_orange   = ['#fe8b2d', 208]

let s:bold = 'bold,'
if g:iro_bold == 0
  let s:bold = ''
endif

let s:italic = 'italic,'
if g:iro_italic == 0
  let s:italic = ''
endif

let s:underline = 'underline,'
if g:iro_underline == 0
  let s:underline = ''
endif

let s:undercurl = 'undercurl,'
if g:iro_undercurl == 0
  let s:undercurl = ''
endif

let s:inverse = 'inverse,'
if g:iro_inverse == 0
  let s:inverse = ''
endif

let s:vim_bg = ['bg', 'bg']
let s:vim_fg = ['fg', 'fg']
let s:none = ['NONE', 'NONE']

" determine relative colors
if s:is_dark
  let s:bg0  = s:iro.dark0
  if g:iro_contrast_dark == 'soft'
    let s:bg0  = s:iro.dark0_soft
  elseif g:iro_contrast_dark == 'hard'
    let s:bg0  = s:iro.dark0_hard
  endif

  let s:bg1  = s:iro.dark1
  let s:bg2  = s:iro.dark2
  let s:bg3  = s:iro.dark3
  let s:bg4  = s:iro.dark4

  let s:gray = s:iro.gray_245

  let s:fg0 = s:iro.light0
  let s:fg1 = s:iro.light1
  let s:fg2 = s:iro.light2
  let s:fg3 = s:iro.light3
  let s:fg4 = s:iro.light4

  let s:fg4_256 = s:iro.light4_256

  let s:red    = s:iro.bright_red
  let s:green  = s:iro.bright_green
  let s:yellow = s:iro.bright_yellow
  let s:blue   = s:iro.bright_blue
  let s:purple = s:iro.bright_purple
  let s:aqua   = s:iro.bright_aqua
  let s:orange = s:iro.bright_orange
else
  let s:bg0  = s:iro.light0
  if g:iro_contrast_light == 'soft'
    let s:bg0  = s:iro.light0_soft
  elseif g:iro_contrast_light == 'hard'
    let s:bg0  = s:iro.light0_hard
  endif

  let s:bg1  = s:iro.light1
  let s:bg2  = s:iro.light2
  let s:bg3  = s:iro.light3
  let s:bg4  = s:iro.light4

  let s:gray = s:iro.gray_244

  let s:fg0 = s:iro.dark0
  let s:fg1 = s:iro.dark1
  let s:fg2 = s:iro.dark2
  let s:fg3 = s:iro.dark3
  let s:fg4 = s:iro.dark4

  let s:fg4_256 = s:iro.dark4_256

  let s:red    = s:iro.faded_red
  let s:green  = s:iro.faded_green
  let s:yellow = s:iro.faded_yellow
  let s:blue   = s:iro.faded_blue
  let s:purple = s:iro.faded_purple
  let s:aqua   = s:iro.faded_aqua
  let s:orange = s:iro.faded_orange
endif

" reset to 16 colors fallback
if g:iro_termcolors == 16
  let s:bg0[1]    = 0
  let s:fg4[1]    = 7
  let s:gray[1]   = 8
  let s:red[1]    = 9
  let s:green[1]  = 10
  let s:yellow[1] = 11
  let s:blue[1]   = 12
  let s:purple[1] = 13
  let s:aqua[1]   = 14
  let s:fg1[1]    = 15
endif

" save current relative colors back to palette dictionary
let s:iro.bg0 = s:bg0
let s:iro.bg1 = s:bg1
let s:iro.bg2 = s:bg2
let s:iro.bg3 = s:bg3
let s:iro.bg4 = s:bg4

let s:iro.gray = s:gray

let s:iro.fg0 = s:fg0
let s:iro.fg1 = s:fg1
let s:iro.fg2 = s:fg2
let s:iro.fg3 = s:fg3
let s:iro.fg4 = s:fg4

let s:iro.fg4_256 = s:fg4_256

let s:iro.red    = s:red
let s:iro.green  = s:green
let s:iro.yellow = s:yellow
let s:iro.blue   = s:blue
let s:iro.purple = s:purple
let s:iro.aqua   = s:aqua
let s:iro.orange = s:orange

if has('nvim')
  let g:terminal_color_0 = s:bg0[0]
  let g:terminal_color_8 = s:gray[0]

  let g:terminal_color_1 = s:gb.neutral_red[0]
  let g:terminal_color_9 = s:red[0]

  let g:terminal_color_2 = s:gb.neutral_green[0]
  let g:terminal_color_10 = s:green[0]

  let g:terminal_color_3 = s:gb.neutral_yellow[0]
  let g:terminal_color_11 = s:yellow[0]

  let g:terminal_color_4 = s:gb.neutral_blue[0]
  let g:terminal_color_12 = s:blue[0]

  let g:terminal_color_5 = s:gb.neutral_purple[0]
  let g:terminal_color_13 = s:purple[0]

  let g:terminal_color_6 = s:gb.neutral_aqua[0]
  let g:terminal_color_14 = s:aqua[0]

  let g:terminal_color_7 = s:fg4[0]
  let g:terminal_color_15 = s:fg1[0]
endif

let s:hls_cursor = s:orange
if exists('g:iro_hls_cursor')
  let s:hls_cursor = get(s:iro, g:iro_hls_cursor)
endif

let s:number_column = s:none
if exists('g:iro_number_column')
  let s:number_column = get(s:gb, g:iro_number_column)
endif

let s:sign_column = s:bg1

if exists('g:gitgutter_override_sign_column_highlight') &&
      \ g:gitgutter_override_sign_column_highlight == 1
  let s:sign_column = s:number_column
else
  let g:gitgutter_override_sign_column_highlight = 0

  if exists('g:iro_sign_column')
    let s:sign_column = get(s:gb, g:iro_sign_column)
  endif
endif

let s:color_column = s:bg1
if exists('g:iro_color_column')
  let s:color_column = get(s:gb, g:iro_color_column)
endif

let s:vert_split = s:bg0
if exists('g:iro_vert_split')
  let s:vert_split = get(s:gb, g:iro_vert_split)
endif

let s:invert_signs = ''
if exists('g:iro_invert_signs')
  if g:iro_invert_signs == 1
    let s:invert_signs = s:inverse
  endif
endif

let s:invert_selection = s:inverse
if exists('g:iro_invert_selection')
  if g:iro_invert_selection == 0
    let s:invert_selection = ''
  endif
endif

let s:invert_tabline = ''
if exists('g:iro_invert_tabline')
  if g:iro_invert_tabline == 1
    let s:invert_tabline = s:inverse
  endif
endif

let s:italicize_comments = s:italic
if exists('g:iro_italicize_comments')
  if g:iro_italicize_comments == 0
    let s:italicize_comments = ''
  endif
endif

let s:italicize_strings = ''
if exists('g:iro_italicize_strings')
  if g:iro_italicize_strings == 1
    let s:italicize_strings = s:italic
  endif
endif

function! s:HL(group, fg, ...)
  let fg = a:fg
  if a:0 >= 1
    let bg = a:1
  else
    let bg = s:none
  endif
  if a:0 >= 2 && strlen(a:2)
    let emstr = a:2
  else
    let emstr = 'NONE,'
  endif
  if a:0 >= 3
    if g:iro_guisp_fallback != 'NONE'
      let fg = a:3
    endif
    if g:iro_guisp_fallback == 'bg'
      let emstr .= 'inverse,'
    endif
  endif

  let histring = [ 'hi', a:group,
        \ 'guifg=' . fg[0], 'ctermfg=' . fg[1],
        \ 'guibg=' . bg[0], 'ctermbg=' . bg[1],
        \ 'gui=' . emstr[:-2], 'cterm=' . emstr[:-2]
        \ ]

  if a:0 >= 3
    call add(histring, 'guisp=' . a:3[0])
  endif

  execute join(histring, ' ')
endfunction

" memoize common hi groups
call s:HL('IroFg0', s:fg0)
call s:HL('IroFg1', s:fg1)
call s:HL('IroFg2', s:fg2)
call s:HL('IroFg3', s:fg3)
call s:HL('IroFg4', s:fg4)
call s:HL('IroGray', s:gray)
call s:HL('IroBg0', s:bg0)
call s:HL('IroBg1', s:bg1)
call s:HL('IroBg2', s:bg2)
call s:HL('IroBg3', s:bg3)
call s:HL('IroBg4', s:bg4)

call s:HL('IroRed', s:red)
call s:HL('IroRedBold', s:red, s:none, s:bold)
call s:HL('IroGreen', s:green)
call s:HL('IroGreenBold', s:green, s:none, s:bold)
call s:HL('IroYellow', s:yellow)
call s:HL('IroYellowBold', s:yellow, s:none, s:bold)
call s:HL('IroBlue', s:blue)
call s:HL('IroBlueBold', s:blue, s:none, s:bold)
call s:HL('IroPurple', s:purple)
call s:HL('IroPurpleBold', s:purple, s:none, s:bold)
call s:HL('IroAqua', s:aqua)
call s:HL('IroAquaBold', s:aqua, s:none, s:bold)
call s:HL('IroOrange', s:orange)
call s:HL('IroOrangeBold', s:orange, s:none, s:bold)

call s:HL('IroRedSign', s:red, s:sign_column, s:invert_signs)
call s:HL('IroGreenSign', s:green, s:sign_column, s:invert_signs)
call s:HL('IroYellowSign', s:yellow, s:sign_column, s:invert_signs)
call s:HL('IroBlueSign', s:blue, s:sign_column, s:invert_signs)
call s:HL('IroPurpleSign', s:purple, s:sign_column, s:invert_signs)
call s:HL('IroAquaSign', s:aqua, s:sign_column, s:invert_signs)

call s:HL('Normal', s:fg1, s:bg0)

if s:is_dark
  set background=dark
else
  set background=light
endif

if version >= 700
  call s:HL('CursorLine',   s:none, s:bg1)
  hi! link CursorColumn CursorLine

  call s:HL('TabLineFill', s:bg4, s:bg1, s:invert_tabline)
  call s:HL('TabLineSel', s:green, s:bg1, s:invert_tabline)
  hi! link TabLine TabLineFill

  call s:HL('MatchParen', s:none, s:bg3, s:bold)
endif

if version >= 703
  call s:HL('ColorColumn',  s:none, s:color_column)
  call s:HL('Conceal', s:blue, s:none)
  call s:HL('CursorLineNr', s:yellow, s:bg1)
endif

hi! link NonText IroBg2
hi! link SpecialKey IroBg2

call s:HL('Visual',    s:none,  s:bg3, s:invert_selection)
hi! link VisualNOS Visual

call s:HL('Search',    s:yellow, s:bg0, s:inverse)
call s:HL('IncSearch', s:hls_cursor, s:bg0, s:inverse)

call s:HL('Underlined', s:blue, s:none, s:underline)

call s:HL('StatusLine',   s:bg2, s:fg1, s:inverse)
call s:HL('StatusLineNC', s:bg1, s:fg4, s:inverse)

call s:HL('VertSplit', s:bg3, s:vert_split)

call s:HL('WildMenu', s:blue, s:bg2, s:bold)

hi! link Directory IroGreenBold

hi! link Title IroGreenBold

call s:HL('ErrorMsg',   s:bg0, s:red, s:bold)
hi! link MoreMsg IroYellowBold
hi! link ModeMsg IroYellowBold
hi! link Question IroOrangeBold
hi! link WarningMsg IroRedBold

call s:HL('LineNr', s:bg4, s:number_column)
call s:HL('SignColumn', s:none, s:sign_column)

call s:HL('Folded', s:gray, s:bg1, s:italic)
call s:HL('FoldColumn', s:gray, s:bg1)

call s:HL('Cursor', s:none, s:none, s:inverse)
hi! link vCursor Cursor
hi! link iCursor Cursor
hi! link lCursor Cursor

if g:iro_improved_strings == 0
  hi! link Special IroOrange
else
  call s:HL('Special', s:orange, s:bg1, s:italicize_strings)
endif

call s:HL('Comment', s:gray, s:none, s:italicize_comments)
call s:HL('Todo', s:vim_fg, s:vim_bg, s:bold . s:italic)
call s:HL('Error', s:red, s:vim_bg, s:bold . s:inverse)

hi! link Statement IroRed
hi! link Conditional IroRed
hi! link Repeat IroRed
hi! link Label IroRed
hi! link Exception IroRed
hi! link Operator Normal
hi! link Keyword IroRed

hi! link Identifier IroBlue
hi! link Function IroGreenBold

hi! link PreProc IroAqua
hi! link Include IroAqua
hi! link Define IroAqua
hi! link Macro IroAqua
hi! link PreCondit IroAqua

hi! link Constant IroPurple
hi! link Character IroPurple
if g:iro_improved_strings == 0
  call s:HL('String',  s:green, s:none, s:italicize_strings)
else
  call s:HL('String',  s:fg1, s:bg1, s:italicize_strings)
endif

hi! link Boolean IroPurple
hi! link Number IroPurple
hi! link Float IroPurple

hi! link Type IroYellow
hi! link StorageClass IroOrange
hi! link Structure IroAqua
hi! link Typedef IroYellow

if version >= 700
  " Popup menu: normal item
  call s:HL('Pmenu', s:fg1, s:bg2)
  " Popup menu: selected item
  call s:HL('PmenuSel', s:bg2, s:blue, s:bold)
  " Popup menu: scrollbar
  call s:HL('PmenuSbar', s:none, s:bg2)
  " Popup menu: scrollbar thumb
  call s:HL('PmenuThumb', s:none, s:bg4)
endif

call s:HL('DiffDelete', s:red, s:bg0, s:inverse)
call s:HL('DiffAdd',    s:green, s:bg0, s:inverse)

call s:HL('DiffChange', s:aqua, s:bg0, s:inverse)
call s:HL('DiffText',   s:yellow, s:bg0, s:inverse)

if has("spell")
  " Not capitalised word, or compile warnings
  if g:iro_improved_warnings == 0
    call s:HL('SpellCap',   s:none, s:none, s:undercurl, s:red)
  else
    call s:HL('SpellCap',   s:green, s:none, s:bold . s:italic)
  endif
  " Not recognized word
  call s:HL('SpellBad',   s:none, s:none, s:undercurl, s:blue)
  " Wrong spelling for selected region
  call s:HL('SpellLocal', s:none, s:none, s:undercurl, s:aqua)
  " Rare word
  call s:HL('SpellRare',  s:none, s:none, s:undercurl, s:purple)
endif

hi! link EasyMotionTarget Search
hi! link EasyMotionShade Comment

hi! link Sneak Search
hi! link SneakLabel Search

if !exists('g:indent_guides_auto_colors')
  let g:indent_guides_auto_colors = 0
endif

if g:indent_guides_auto_colors == 0
  if g:iro_invert_indent_guides == 0
    call s:HL('IndentGuidesOdd', s:vim_bg, s:bg2)
    call s:HL('IndentGuidesEven', s:vim_bg, s:bg1)
  else
    call s:HL('IndentGuidesOdd', s:vim_bg, s:bg2, s:inverse)
    call s:HL('IndentGuidesEven', s:vim_bg, s:bg3, s:inverse)
  endif
endif

if !exists('g:indentLine_color_term')
  let g:indentLine_color_term = s:bg2[1]
endif
if !exists('g:indentLine_color_gui')
  let g:indentLine_color_gui = s:bg2[0]
endif

hi! link GitGutterAdd IroGreenSign
hi! link GitGutterChange IroAquaSign
hi! link GitGutterDelete IroRedSign
hi! link GitGutterChangeDelete IroAquaSign

hi! link gitcommitSelectedFile IroGreen
hi! link gitcommitDiscardedFile IroRed

" }}}
" Signify: {{{

hi! link SignifySignAdd IroGreenSign
hi! link SignifySignChange IroAquaSign
hi! link SignifySignDelete IroRedSign

call s:HL('SyntasticError', s:none, s:none, s:undercurl, s:red)
call s:HL('SyntasticWarning', s:none, s:none, s:undercurl, s:yellow)

hi! link SyntasticErrorSign IroRedSign
hi! link SyntasticWarningSign IroYellowSign

hi! link SignatureMarkText   IroBlueSign
hi! link SignatureMarkerText IroPurpleSign

hi! link ShowMarksHLl IroBlueSign
hi! link ShowMarksHLu IroBlueSign
hi! link ShowMarksHLo IroBlueSign
hi! link ShowMarksHLm IroBlueSign

hi! link CtrlPMatch IroYellow
hi! link CtrlPNoEntries IroRed
hi! link CtrlPPrtBase IroBg2
hi! link CtrlPPrtCursor IroBlue
hi! link CtrlPLinePre IroBg2

call s:HL('CtrlPMode1', s:blue, s:bg2, s:bold)
call s:HL('CtrlPMode2', s:bg0, s:blue, s:bold)
call s:HL('CtrlPStats', s:fg4, s:bg2, s:bold)

hi! link StartifyBracket IroFg3
hi! link StartifyFile IroFg1
hi! link StartifyNumber IroBlue
hi! link StartifyPath IroGray
hi! link StartifySlash IroGray
hi! link StartifySection IroYellow
hi! link StartifySpecial IroBg2
hi! link StartifyHeader IroOrange
hi! link StartifyFooter IroBg2

let g:vimshell_escape_colors = [
  \ s:bg4[0], s:red[0], s:green[0], s:yellow[0],
  \ s:blue[0], s:purple[0], s:aqua[0], s:fg4[0],
  \ s:bg0[0], s:red[0], s:green[0], s:orange[0],
  \ s:blue[0], s:purple[0], s:aqua[0], s:fg0[0]
  \ ]

" }}}
" BufTabLine: {{{

call s:HL('BufTabLineCurrent', s:bg0, s:fg4)
call s:HL('BufTabLineActive', s:fg4, s:bg2)
call s:HL('BufTabLineHidden', s:bg4, s:bg1)
call s:HL('BufTabLineFill', s:bg0, s:bg0)

call s:HL('ALEError', s:none, s:none, s:undercurl, s:red)
call s:HL('ALEWarning', s:none, s:none, s:undercurl, s:yellow)
call s:HL('ALEInfo', s:none, s:none, s:undercurl, s:blue)

hi! link ALEErrorSign IroRedSign
hi! link ALEWarningSign IroYellowSign
hi! link ALEInfoSign IroBlueSign

hi! link DirvishPathTail IroAqua
hi! link DirvishArg IroYellow

hi! link netrwDir IroAqua
hi! link netrwClassify IroAqua
hi! link netrwLink IroGray
hi! link netrwSymLink IroFg1
hi! link netrwExe IroYellow
hi! link netrwComment IroGray
hi! link netrwList IroBlue
hi! link netrwHelpCmd IroAqua
hi! link netrwCmdSep IroFg3
hi! link netrwVersion IroGreen

hi! link NERDTreeDir IroAqua
hi! link NERDTreeDirSlash IroAqua

hi! link NERDTreeOpenable IroOrange
hi! link NERDTreeClosable IroOrange

hi! link NERDTreeFile IroFg1
hi! link NERDTreeExecFile IroYellow

hi! link NERDTreeUp IroGray
hi! link NERDTreeCWD IroGreen
hi! link NERDTreeHelp IroFg1

hi! link NERDTreeToggleOn IroGreen
hi! link NERDTreeToggleOff IroRed

call s:HL('multiple_cursors_cursor', s:none, s:none, s:inverse)
call s:HL('multiple_cursors_visual', s:none, s:bg2)

hi! link diffAdded IroGreen
hi! link diffRemoved IroRed
hi! link diffChanged IroAqua

hi! link diffFile IroOrange
hi! link diffNewFile IroYellow

hi! link diffLine IroBlue

hi! link htmlTag IroBlue
hi! link htmlEndTag IroBlue

hi! link htmlTagName IroAquaBold
hi! link htmlArg IroAqua

hi! link htmlScriptTag IroPurple
hi! link htmlTagN IroFg1
hi! link htmlSpecialTagName IroAquaBold

call s:HL('htmlLink', s:fg4, s:none, s:underline)

hi! link htmlSpecialChar IroOrange

call s:HL('htmlBold', s:vim_fg, s:vim_bg, s:bold)
call s:HL('htmlBoldUnderline', s:vim_fg, s:vim_bg, s:bold . s:underline)
call s:HL('htmlBoldItalic', s:vim_fg, s:vim_bg, s:bold . s:italic)
call s:HL('htmlBoldUnderlineItalic', s:vim_fg, s:vim_bg, s:bold . s:underline . s:italic)

call s:HL('htmlUnderline', s:vim_fg, s:vim_bg, s:underline)
call s:HL('htmlUnderlineItalic', s:vim_fg, s:vim_bg, s:underline . s:italic)
call s:HL('htmlItalic', s:vim_fg, s:vim_bg, s:italic)

hi! link xmlTag IroBlue
hi! link xmlEndTag IroBlue
hi! link xmlTagName IroBlue
hi! link xmlEqual IroBlue
hi! link docbkKeyword IroAquaBold

hi! link xmlDocTypeDecl IroGray
hi! link xmlDocTypeKeyword IroPurple
hi! link xmlCdataStart IroGray
hi! link xmlCdataCdata IroPurple
hi! link dtdFunction IroGray
hi! link dtdTagName IroPurple

hi! link xmlAttrib IroAqua
hi! link xmlProcessingDelim IroGray
hi! link dtdParamEntityPunct IroGray
hi! link dtdParamEntityDPunct IroGray
hi! link xmlAttribPunct IroGray

hi! link xmlEntity IroOrange
hi! link xmlEntityPunct IroOrange

call s:HL('vimCommentTitle', s:fg4_256, s:none, s:bold . s:italicize_comments)

hi! link vimNotation IroOrange
hi! link vimBracket IroOrange
hi! link vimMapModKey IroOrange
hi! link vimFuncSID IroFg3
hi! link vimSetSep IroFg3
hi! link vimSep IroFg3
hi! link vimContinue IroFg3

hi! link clojureKeyword IroBlue
hi! link clojureCond IroOrange
hi! link clojureSpecial IroOrange
hi! link clojureDefine IroOrange

hi! link clojureFunc IroYellow
hi! link clojureRepeat IroYellow
hi! link clojureCharacter IroAqua
hi! link clojureStringEscape IroAqua
hi! link clojureException IroRed

hi! link clojureRegexp IroAqua
hi! link clojureRegexpEscape IroAqua
call s:HL('clojureRegexpCharClass', s:fg3, s:none, s:bold)
hi! link clojureRegexpMod clojureRegexpCharClass
hi! link clojureRegexpQuantifier clojureRegexpCharClass

hi! link clojureParen IroFg3
hi! link clojureAnonArg IroYellow
hi! link clojureVariable IroBlue
hi! link clojureMacro IroOrange

hi! link clojureMeta IroYellow
hi! link clojureDeref IroYellow
hi! link clojureQuote IroYellow
hi! link clojureUnquote IroYellow

hi! link cOperator IroPurple
hi! link cStructure IroOrange

hi! link pythonBuiltin IroOrange
hi! link pythonBuiltinObj IroOrange
hi! link pythonBuiltinFunc IroOrange
hi! link pythonFunction IroAqua
hi! link pythonDecorator IroRed
hi! link pythonInclude IroBlue
hi! link pythonImport IroBlue
hi! link pythonRun IroBlue
hi! link pythonCoding IroBlue
hi! link pythonOperator IroRed
hi! link pythonException IroRed
hi! link pythonExceptions IroPurple
hi! link pythonBoolean IroPurple
hi! link pythonDot IroFg3
hi! link pythonConditional IroRed
hi! link pythonRepeat IroRed
hi! link pythonDottedName IroGreenBold

hi! link cssBraces IroBlue
hi! link cssFunctionName IroYellow
hi! link cssIdentifier IroOrange
hi! link cssClassName IroGreen
hi! link cssColor IroBlue
hi! link cssSelectorOp IroBlue
hi! link cssSelectorOp2 IroBlue
hi! link cssImportant IroGreen
hi! link cssVendor IroFg1

hi! link cssTextProp IroAqua
hi! link cssAnimationProp IroAqua
hi! link cssUIProp IroYellow
hi! link cssTransformProp IroAqua
hi! link cssTransitionProp IroAqua
hi! link cssPrintProp IroAqua
hi! link cssPositioningProp IroYellow
hi! link cssBoxProp IroAqua
hi! link cssFontDescriptorProp IroAqua
hi! link cssFlexibleBoxProp IroAqua
hi! link cssBorderOutlineProp IroAqua
hi! link cssBackgroundProp IroAqua
hi! link cssMarginProp IroAqua
hi! link cssListProp IroAqua
hi! link cssTableProp IroAqua
hi! link cssFontProp IroAqua
hi! link cssPaddingProp IroAqua
hi! link cssDimensionProp IroAqua
hi! link cssRenderProp IroAqua
hi! link cssColorProp IroAqua
hi! link cssGeneratedContentProp IroAqua

hi! link javaScriptBraces IroFg1
hi! link javaScriptFunction IroAqua
hi! link javaScriptIdentifier IroRed
hi! link javaScriptMember IroBlue
hi! link javaScriptNumber IroPurple
hi! link javaScriptNull IroPurple
hi! link javaScriptParens IroFg3

hi! link javascriptImport IroAqua
hi! link javascriptExport IroAqua
hi! link javascriptClassKeyword IroAqua
hi! link javascriptClassExtends IroAqua
hi! link javascriptDefault IroAqua

hi! link javascriptClassName IroYellow
hi! link javascriptClassSuperName IroYellow
hi! link javascriptGlobal IroYellow

hi! link javascriptEndColons IroFg1
hi! link javascriptFuncArg IroFg1
hi! link javascriptGlobalMethod IroFg1
hi! link javascriptNodeGlobal IroFg1
hi! link javascriptBOMWindowProp IroFg1
hi! link javascriptArrayMethod IroFg1
hi! link javascriptArrayStaticMethod IroFg1
hi! link javascriptCacheMethod IroFg1
hi! link javascriptDateMethod IroFg1
hi! link javascriptMathStaticMethod IroFg1

hi! link javascriptURLUtilsProp IroFg1
hi! link javascriptBOMNavigatorProp IroFg1
hi! link javascriptDOMDocMethod IroFg1
hi! link javascriptDOMDocProp IroFg1
hi! link javascriptBOMLocationMethod IroFg1
hi! link javascriptBOMWindowMethod IroFg1
hi! link javascriptStringMethod IroFg1

hi! link javascriptVariable IroOrange
hi! link javascriptIdentifier IroOrange
hi! link javascriptClassSuper IroOrange

hi! link javascriptFuncKeyword IroAqua
hi! link javascriptAsyncFunc IroAqua
hi! link javascriptClassStatic IroOrange

hi! link javascriptOperator IroRed
hi! link javascriptForOperator IroRed
hi! link javascriptYield IroRed
hi! link javascriptExceptions IroRed
hi! link javascriptMessage IroRed

hi! link javascriptTemplateSB IroAqua
hi! link javascriptTemplateSubstitution IroFg1

hi! link javascriptLabel IroFg1
hi! link javascriptObjectLabel IroFg1
hi! link javascriptPropertyName IroFg1

hi! link javascriptLogicSymbols IroFg1
hi! link javascriptArrowFunc IroYellow

hi! link javascriptDocParamName IroFg4
hi! link javascriptDocTags IroFg4
hi! link javascriptDocNotation IroFg4
hi! link javascriptDocParamType IroFg4
hi! link javascriptDocNamedParamType IroFg4

hi! link javascriptBrackets IroFg1
hi! link javascriptDOMElemAttrs IroFg1
hi! link javascriptDOMEventMethod IroFg1
hi! link javascriptDOMNodeMethod IroFg1
hi! link javascriptDOMStorageMethod IroFg1
hi! link javascriptHeadersMethod IroFg1

hi! link javascriptAsyncFuncKeyword IroRed
hi! link javascriptAwaitFuncKeyword IroRed

hi! link jsClassKeyword IroAqua
hi! link jsExtendsKeyword IroAqua
hi! link jsExportDefault IroAqua
hi! link jsTemplateBraces IroAqua
hi! link jsGlobalNodeObjects IroFg1
hi! link jsGlobalObjects IroFg1
hi! link jsFunction IroAqua
hi! link jsFuncParens IroFg3
hi! link jsParens IroFg3
hi! link jsNull IroPurple
hi! link jsUndefined IroPurple
hi! link jsClassDefinition IroYellow

hi! link typeScriptReserved IroAqua
hi! link typeScriptLabel IroAqua
hi! link typeScriptFuncKeyword IroAqua
hi! link typeScriptIdentifier IroOrange
hi! link typeScriptBraces IroFg1
hi! link typeScriptEndColons IroFg1
hi! link typeScriptDOMObjects IroFg1
hi! link typeScriptAjaxMethods IroFg1
hi! link typeScriptLogicSymbols IroFg1
hi! link typeScriptDocSeeTag Comment
hi! link typeScriptDocParam Comment
hi! link typeScriptDocTags vimCommentTitle
hi! link typeScriptGlobalObjects IroFg1
hi! link typeScriptParens IroFg3
hi! link typeScriptOpSymbols IroFg3
hi! link typeScriptHtmlElemProperties IroFg1
hi! link typeScriptNull IroPurple
hi! link typeScriptInterpolationDelimiter IroAqua

hi! link purescriptModuleKeyword IroAqua
hi! link purescriptModuleName IroFg1
hi! link purescriptWhere IroAqua
hi! link purescriptDelimiter IroFg4
hi! link purescriptType IroFg1
hi! link purescriptImportKeyword IroAqua
hi! link purescriptHidingKeyword IroAqua
hi! link purescriptAsKeyword IroAqua
hi! link purescriptStructure IroAqua
hi! link purescriptOperator IroBlue

hi! link purescriptTypeVar IroFg1
hi! link purescriptConstructor IroFg1
hi! link purescriptFunction IroFg1
hi! link purescriptConditional IroOrange
hi! link purescriptBacktick IroOrange

hi! link coffeeExtendedOp IroFg3
hi! link coffeeSpecialOp IroFg3
hi! link coffeeCurly IroOrange
hi! link coffeeParen IroFg3
hi! link coffeeBracket IroOrange

hi! link rubyStringDelimiter IroGreen
hi! link rubyInterpolationDelimiter IroAqua

hi! link objcTypeModifier IroRed
hi! link objcDirective IroBlue

hi! link goDirective IroAqua
hi! link goConstants IroPurple
hi! link goDeclaration IroRed
hi! link goDeclType IroBlue
hi! link goBuiltins IroOrange

hi! link luaIn IroRed
hi! link luaFunction IroAqua
hi! link luaTable IroOrange

hi! link moonSpecialOp IroFg3
hi! link moonExtendedOp IroFg3
hi! link moonFunction IroFg3
hi! link moonObject IroYellow

hi! link javaAnnotation IroBlue
hi! link javaDocTags IroAqua
hi! link javaCommentTitle vimCommentTitle
hi! link javaParen IroFg3
hi! link javaParen1 IroFg3
hi! link javaParen2 IroFg3
hi! link javaParen3 IroFg3
hi! link javaParen4 IroFg3
hi! link javaParen5 IroFg3
hi! link javaOperator IroOrange

hi! link javaVarArg IroGreen

hi! link elixirDocString Comment

hi! link elixirStringDelimiter IroGreen
hi! link elixirInterpolationDelimiter IroAqua

hi! link elixirModuleDeclaration IroYellow

hi! link scalaNameDefinition IroFg1
hi! link scalaCaseFollowing IroFg1
hi! link scalaCapitalWord IroFg1
hi! link scalaTypeExtension IroFg1

hi! link scalaKeyword IroRed
hi! link scalaKeywordModifier IroRed

hi! link scalaSpecial IroAqua
hi! link scalaOperator IroFg1

hi! link scalaTypeDeclaration IroYellow
hi! link scalaTypeTypePostDeclaration IroYellow

hi! link scalaInstanceDeclaration IroFg1
hi! link scalaInterpolation IroAqua

call s:HL('markdownItalic', s:fg3, s:none, s:italic)

hi! link markdownH1 IroGreenBold
hi! link markdownH2 IroGreenBold
hi! link markdownH3 IroYellowBold
hi! link markdownH4 IroYellowBold
hi! link markdownH5 IroYellow
hi! link markdownH6 IroYellow

hi! link markdownCode IroAqua
hi! link markdownCodeBlock IroAqua
hi! link markdownCodeDelimiter IroAqua

hi! link markdownBlockquote IroGray
hi! link markdownListMarker IroGray
hi! link markdownOrderedListMarker IroGray
hi! link markdownRule IroGray
hi! link markdownHeadingRule IroGray

hi! link markdownUrlDelimiter IroFg3
hi! link markdownLinkDelimiter IroFg3
hi! link markdownLinkTextDelimiter IroFg3

hi! link markdownHeadingDelimiter IroOrange
hi! link markdownUrl IroPurple
hi! link markdownUrlTitleDelimiter IroGreen

call s:HL('markdownLinkText', s:gray, s:none, s:underline)
hi! link markdownIdDeclaration markdownLinkText

hi! link haskellType IroFg1
hi! link haskellIdentifier IroFg1
hi! link haskellSeparator IroFg1
hi! link haskellDelimiter IroFg4
hi! link haskellOperators IroBlue
"
hi! link haskellBacktick IroOrange
hi! link haskellStatement IroOrange
hi! link haskellConditional IroOrange

hi! link haskellLet IroAqua
hi! link haskellDefault IroAqua
hi! link haskellWhere IroAqua
hi! link haskellBottom IroAqua
hi! link haskellBlockKeywords IroAqua
hi! link haskellImportKeywords IroAqua
hi! link haskellDeclKeyword IroAqua
hi! link haskellDeriving IroAqua
hi! link haskellAssocType IroAqua

hi! link haskellNumber IroPurple
hi! link haskellPragma IroPurple

hi! link haskellString IroGreen
hi! link haskellChar IroGreen

hi! link jsonKeyword IroGreen
hi! link jsonQuote IroGreen
hi! link jsonBraces IroFg1
hi! link jsonString IroFg1

function! IroHlsShowCursor()
  call s:HL('Cursor', s:bg0, s:hls_cursor)
endfunction

function! IroHlsHideCursor()
  call s:HL('Cursor', s:none, s:none, s:inverse)
endfunction
