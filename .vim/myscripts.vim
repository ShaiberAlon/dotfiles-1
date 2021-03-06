" executes an execute command, then returns to previous cursor position
function! ReturnToOriginalPosition(string)
    execute "normal! mq" . a:string . "\<esc>`q"
endfunction


" Generalization of vi" that can select between delimiters the cursor is not yet between. 
" If a count is not specified 1 is assumed.
function! SmartInner(count, backwards, delimiter, inner_or_outer)
    " if number was not supplied, assume one
    :let number = a:count
    :if number == 0
    :   let number = 1
    :endif

    " which direction are we going to search? (determined by a:backwards)
    :if a:backwards
    :   let dir = "F"
    :else
    :   let dir = "f"
    :endif

    " since the left/right are the same for quotes, you have to search through more
    :if a:delimiter == "'"
    :   let number = 2 * number
    :endif
    :if a:delimiter == '"'
    :   let number = 2 * number
    :endif

    execute 'normal! ' . number . dir . a:delimiter . 'v' . a:inner_or_outer . a:delimiter
    endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smooth Scroll (from http://www.vim.org/scripts/script.php?script_id=1601, script version 1.0)
"
" Remamps 
"  <C-U>
"  <C-D>
"  <C-F>
"  <C-B>
"
" to allow smooth scrolling of the window. I find that quick changes of
" context don't allow my eyes to follow the action properly.
"
" The global variable g:scroll_factor changes the scroll speed.
"
"
" Written by Brad Phelan 2006
" http://xtargets.com
let g:scroll_factor = 5000
function! SmoothScroll(dir, windiv, factor)
   let wh=winheight(0)
   let i=0
   while i < wh / a:windiv
      let t1=reltime()
      let i = i + 1
      if a:dir=="d"
         "normal j
         execute "normal! \<c-e>j"
      else
         "normal k
         execute "normal! \<c-y>k"
      end
      redraw
      while 1
         let t2=reltime(t1,reltime())
         if t2[1] > g:scroll_factor * a:factor
            break
         endif
      endwhile
   endwhile
endfunction
map <S-j> :call SmoothScroll("d",2, 2)
map <S-k> :call SmoothScroll("u",2, 2)
map <S-d> :call SmoothScroll("d",1, 1)
map <S-u> :call SmoothScroll("u",1, 1)
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
