set background=dark
highlight clear
if version > 580
 hi clear
 if exists("syntax_on")
 syntax reset
 endif
endif

let colors_name = "hawk"

hi Normal ctermfg=144
hi ColorColumn ctermbg=235
hi LineNr ctermfg=234
hi CursorLineNr ctermfg=72 ctermbg=236 cterm=none
hi CursorLine cterm=none
hi Comment cterm=italic ctermfg=236
hi Special ctermfg=23
hi MatchParen ctermbg=none cterm=bold
hi Type cterm=italic ctermfg=142
hi Identifier ctermfg=65 cterm=italic
hi String ctermfg=64
hi Number ctermfg=130
hi Function cterm=italic ctermfg=136
hi Keyword ctermfg=95
hi link Conditional Keyword
hi link Operator Keyword
hi link Exception Keyword
hi clear Statement
hi link Statement Keyword
hi Include ctermfg=88
hi Structure cterm=italic ctermfg=23
hi pythonFunctionCall cterm=italic ctermfg=88
hi NonText ctermfg=30
hi Visual ctermbg=none cterm=reverse ctermfg=none
hi ModeMsg cterm=bold,reverse ctermfg=223
hi ErrorMsg cterm=reverse,bold ctermbg=none ctermfg=1
hi IncSearch ctermfg=231 ctermbg=125 cterm=none
hi Search ctermfg=none ctermbg=none cterm=reverse
hi StatusLine cterm=italic ctermfg=101 ctermbg=233
hi WildMenu ctermfg=233 ctermbg=101
hi Constant ctermfg=22 cterm=italic
hi TablineFill ctermfg=236
hi TabLine ctermfg=232 cterm=none ctermbg=242
hi Pmenu ctermfg=223 ctermbg=236
hi VertSplit ctermfg=233
hi PreProc ctermfg=131
hi StatusLineNC cterm=none ctermfg=236
hi Directory ctermfg=70
hi Title ctermfg=72
