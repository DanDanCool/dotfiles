"nord port

set background=dark
highlight clear

if exists("syntax_on")
	syntax reset
endif

let g:colors_name = "nord"

let s:NordColors = {}

if get(g:, "TransparentBackground", 0) > 0
	let s:NordColors.Normal	= {"fg": "white", "guifg": "#D8DEE9"}
	let s:NordColors.VertSplit = {"cterm": "NONE", "fg": "38", "bg": "NONE",
				\	"gui": "NONE", "guifg": "#232526", "guibg": "NONE"}
else
	let s:NordColors.Normal	= {"fg": "white", "bg": "black", "guifg": "#E5E9F0", "guibg": "#2E3440"}
	let s:NordColors.VertSplit = {"fg": "38", "bg": "38", "guifg": "#1B141B", "guibg": "#FFFFFF"}
endif

"syntax"
let s:NordColors.Comment		= {"fg":  "71", "guifg": "#4C566A"}

let s:NordColors.Constant		= {"fg": "white", "guifg": "#71468c"}
let s:NordColors.String			= {"fg": "197", "guifg": "#A3BE8C"}
let s:NordColors.Character		= {"fg": "197", "guifg": "#A3BE8C"}
let s:NordColors.Number			= {"fg": "197", "guifg": "#71468c"}
let s:NordColors.Boolean		= {"fg": "white", "guifg": "#71468c"}
let s:NordColors.Float			= {"fg": "197", "guifg": "#71468c"}

let s:NordColors.Identifier		= {"fg": "153", "guifg": "#D8DEE9"}
let s:NordColors.Function		= {"fg":  "62", "guifg": "#5E81AC"}

let s:NordColors.Statement		= {"fg": "98", "guifg": "#81A1C1"}
let s:NordColors.Conditional	= {"fg": "98", "guifg": "#81A1C1"}
let s:NordColors.Repeat			= {"fg": "98", "guifg": "#81A1C1"}
let s:NordColors.Label			= {"fg": "98", "guifg": "#81A1C1"}
let s:NordColors.Operator		= {"fg": "white", "guifg": "#5E81AC"}
let s:NordColors.Delimiter		= {"fg": "white", "guifg": "#D8DEE9"}
let s:NordColors.Exception		= {"fg": "98", "guifg": "#88C0D0"}

let s:NordColors.PreProc		= {"fg":  "92", "guifg": "#4C566A"}
let s:NordColors.Include		= {"fg": "245", "guifg": "#4C566A"}

let s:NordColors.Type			= {"fg": "98", "guifg": "#88C0D0"}
let s:NordColors.Structure		= {"fg": "98", "guifg": "#88C0D0"}

""let s:NordColors.Special		= {"fg": "", "bg": "", "guifg": "#", "guibg": "#"}
""let s:NordColors.Underlined	= {"fg": "", "bg": "", "guifg": "#", "guibg": "#"}
""let s:NordColors.Ignore		= {"fg": "", "bg": "", "guifg": "#", "guibg": "#"}
""let s:NordColors.Error			= {"fg": "", "bg": "", "guifg": "#", "guibg": "#"}
let s:NordColors.Todo			= {"fg": "white", "bg": "28", "guifg": "#D8DEE9", "guibg": "#434C5E"}

"Misc"
let s:NordColors.Folded			= {"fg": "white", "bg": "54", "guifg": "#D8DEE9", "guibg": "#3B4252"}
let s:NordColors.Visual			= {"bg": "242", "guibg": "#3B4252"}
let s:NordColors.Search			= {"fg": "black", "bg": "198", "guifg": "#D8DEE9", "guibg": "#EBCB8B"}
let s:NordColors.LineNr			= {"fg":  "38", "guifg": "#3B4252"}
let s:NordColors.Pmenu			= {"fg": "white", "bg": "92", "guifg": "#E5E9F0", "guibg": "#434C5E"}
let s:NordColors.PmenuSel		= {"fg": "white", "bg": "62", "guifg": "#E5E9F0", "guibg": "#4C566A"}

let s:NordColors.StatusLine		= {"fg": "233", "guifg": "#3B4252", "guibg": "#3B4252"}
let s:NordColors.StatusLineNC	= {"fg": "233", "guifg": "#3B4252", "guibg": "#3B4252"}
let s:NordColors.EndOfBuffer	= {"fg":  "38", "guifg": "#3B4252"}

"NerdTree
let s:NordColors.NERDTreeHelp		= {"fg": "white", "guifg": "#3B4252"}
let s:NordColors.NERDTreeUp			= {"fg": "white", "guifg": "#3B4252"}
let s:NordColors.NERDTreeCWD		= {"fg": "white", "guifg": "#3B4252"}
let s:NordColors.NERDTreeDir		= {"fg": "white", "guifg": "#5E81AC"}
let s:NordColors.NERDTreeDirSlash	= {"fg": "white", "guifg": "#5E81AC"}
let s:NordColors.NERDTreeOpenable	= {"fg": "white", "guifg": "#8FBCBB"}
let s:NordColors.NERDTreeClosable	= {"fg": "white", "guifg": "#8FBCBB"}

"treesitter"
let s:NordColors.TSNamespace	= {"fg": "white", "guifg": "#8FBCBB"}
let s:NordColors.TSType			= {"fg": "white", "guifg": "#88C0D0"}
let s:NordColors.TSText			= {"fg": "white", "guifg": "#E5E9F0"}

func s:HighlightFn(group)
	let l:colors = get(s:NordColors, a:group)

	let l:highlightCmd = 'hi ' . a:group . ' '

	if has_key(l:colors, "fg")
		let l:highlightCmd .= 'guifg=' . get(l:colors, "guifg") . ' '
		let l:highlightCmd .= 'ctermfg=' . get(l:colors, "fg") . ' '
	endif

	if has_key(l:colors, "bg")
		let l:highlightCmd .= 'guibg=' . get(l:colors, "guibg") . ' '
		let l:highlightCmd .= 'ctermbg=' . get(l:colors, "bg") . ' '
	endif

	if has_key(l:colors, "cterm")
		let l:highlightCmd .= 'gui=' . get(l:colors, "gui") . ' '
		let l:highlightCmd .= 'cterm=' . get(l:colors, "cterm") . ' '
	endif

	if has_key(l:colors, "guisp")
		let l:highlightCmd .= 'guisp=' . get(l:colors, "guisp") . ' '
	endif

	execute l:highlightCmd
endfunc

for k in keys(s:NordColors)
	call s:HighlightFn(k)
endfor

unlet s:NordColors