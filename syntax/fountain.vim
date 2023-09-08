" Vim syntax file
" Language:	Fountain screenplay
" File: .fountain, .spmd, .txt
" Reference: http://fountain.io/
" Maintainer:	Carson Fire <carsonfire@gmail.com>
" Last Change:	February 20, 2012
" Version: 2.02	

if exists("b:current_syntax")
  finish
endif
syn sync minlines=200

syn match fountainAction "^\(\a\)*\s*.*$" contains=fountainBoneyard,fountainNotes
syn match fountainSection1 "^\s*# \(\_[^#]\)" fold transparent contains=ALL
syn region fountainTitlePage start="\%^\(.*\):" end="^$" contains=fountainBoneyard,fountainNotes
syn match fountainCharacter "\(^\s*@\(.*\)\)\|\(^\(\L\)*$\)" 
syn region fountainDialogue matchgroup=fountainCharacter start="\(^\s*@\(.*\)\)\|\(^\(\L\)*$\)" end="^\s*$" contains=fountainCharacter,fountainParenthetical,fountainBoneyard,fountainNotes,fountainBold,fountainUnderlined,fountainItalic,fountainBoldItalic
syn match fountainParenthetical "^\s*\((.*)\)$" contained contains=fountainBoneyard,fountainNotes
syn match fountainLyric "^\s*\~\(.*\)$" contained contains=fountainBoneyard,fountainNotes
syn match fountainTransition "\(^\(\L\)* TO:$\)\|\(^\(\L\)* IN:$\)\|\(^\(\L\)* CREDITS:$\)\|\(^\(\L\)* OUT:$\)" contains=fountainBoneyard,fountainNotes
syn match fountainTransition1 "\(^\(\L\)* SHOT:$\)\|\(^\(\L\)* FRAME:$\)\|\(^\(\L\)* WITH:$\)\|\(^\(\L\)* SCREEN:$\)" contains=fountainBoneyard,fountainNotes
syn match fountainTransition2 "\(^\(\L\)* CUT:$\)\|\(^\(\L\)* OVER:$\)" contains=fountainBoneyard,fountainNotes
syn match fountainTransition3 "\(^\DISSOLVE:$\)\|\(^\WIPE:$\)" contains=fountainBoneyard,fountainNotes
syn match fountainTransitionForced "^\s*>\(.*\)" contains=fountainBoneyard,fountainNotes
syn match fountainCentered "^\s*>\(.*\)<" contains=fountainBoneyard,fountainNotes
syn match fountainUnderlined "_[^_]*_" 
syn match fountainItalic "\*[^\*]*\*"
syn match fountainBold "\*\*[^\*]*\*\*"
syn match fountainBoldItalic "\*\*\*[^\*]*\*\*\*" 
syn match fountainPagebreak "^===[=]*$"
syn region fountainNotes start="\[\[" end="\]\]" contains=xLineContinue
syn region fountainHeader1 start="^\s*# " end="$" contains=fountainBoneyard,fountainNotes
syn region fountainHeader2 start="^\s*## " end="$" contains=fountainBoneyard,fountainNotes
syn region fountainHeader3 start="^\s*### " end="$" contains=fountainBoneyard,fountainNotes
syn region fountainHeader4 start="^\s*#### " end="$" contains=fountainBoneyard,fountainNotes
syn region fountainHeader5 start="^\s*##### " end="$" contains=fountainBoneyard,fountainNotes
syn region fountainHeader6 start="^\s*###### " end="$" contains=fountainBoneyard,fountainNotes
syn region fountainSynopses start="^\s*= " end="$" contains=fountainBoneyard,fountainNotes
syn region fountainSceneHeading start="^\s*\(\.[^\. ]\|INT\. \|EST\. \|EXT\. \|INT\.\/EXT\. \|INT\/EXT\. \|INT \|EXT \|INT\/EXT \|I\/E \)\c" end="$" contains=fountainSceneNumber,fountainBoneyard,fountainNotes 
syn region fountainAction matchgroup=fountainSceneHeading start="^\s*\(\.[^\. ]\|INT\. \|EST\. \|EXT\. \|INT\.\/EXT\. \|INT\/EXT\. \|INT \|EXT \|INT\/EXT \|I\/E \)\(.*\)$\n*\ze\a\c" end="\n\n" contains=fountainBoneyard,fountainNotes,fountainBold,fountainUnderlined,fountainItalic,fountainBoldItalic
syn region fountainBoneyard start="/\*" end="\*\/" contains=xLineContinue
syn match xLineContinue "\\$" contained
syn region fountainSceneNumber start="#" end="#" contained

hi def link fountainTitlePage		    PreProc
hi def link fountainSection1 			Underlined
hi def link fountainSceneHeading	    title
hi def link fountainAction              string
hi def link fountainCharacter			identifier 
hi def link fountainDialogue			statement
hi def link fountainParenthetical		conditional
hi def link fountainTransition			todo
hi def link fountainTransition1			todo
hi def link fountainTransition2			todo
hi def link fountainTransition3			todo
hi def link fountainLyric				normal
hi def link fountainTransitionForced	todo
hi def link fountainCentered			character
hi def fountainUnderlined					gui=underline
hi def fountainItalic						gui=italic cterm=italic	
hi def fountainBold							gui=bold cterm=bold
hi def fountainBoldItalic					gui=bold,italic cterm=bold,italic	
hi def link fountainPagebreak			conditional
hi def link fountainActionForced		normal
hi def link fountainNotes				comment
hi def link fountainBoneyard			nontext	
hi def link fountainHeader1				CursorLineNr	
hi def link fountainHeader2				CursorLineNr	
hi def link fountainHeader3				CursorLineNr	
hi def link fountainHeader4				CursorLineNr	
hi def link fountainHeader5				CursorLineNr	
hi def link fountainHeader6				CursorLineNr	
hi def link fountainSynopses			number
hi def link fountainSceneNumber			number	

function! FountainFolds()
  let thisline = getline(v:lnum)
  let laterline = getline(v:lnum + 2)
  if match(thisline, '^EXT') >= 0
    return ">1"
  elseif match(thisline, '^INT') >= 0
    return ">1"
  elseif match(thisline, '^Title:') >= 0
    return ">1"
  elseif match(thisline, '^\.[^.]') >= 0
    return ">1"
  elseif match(laterline, '^EXT') >= 0
    return "<1"
  elseif match(laterline, '^INT') >= 0
    return "<1"
  elseif match(laterline, '^Title:') >= 0
    return "<1"
  elseif match(laterline, '^\.[^.]') >= 0
    return "<1"
  else
    return "="
  endif
endfunction

setlocal foldmethod=expr
setlocal foldexpr=FountainFolds()

function! FountainFoldText()
  let foldsize = (v:foldend-v:foldstart)
  return getline(v:foldstart).' ('.foldsize.' lines)'
endfunction
setlocal foldtext=FountainFoldText()
let b:current_syntax = "fountain"
