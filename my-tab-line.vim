" 1 to show tab line only when more than one tab is present
set showtabline=1
" custom tab pages line
set tabline=%!MyTabLine()
" acclamation to avoid conflict
function! MyTabLine()
    " complete tabline goes here
    let s = '' 
    " loop through each tab page
    for i in range(tabpagenr('$'))
        let tab = i + 1
        " set highlight
        let s .= (tab == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
        " set the tab page number (for mouse clicks)
        let s .= '%' . tab . 'T'
        let s .= ' '
        " set page number string
        let s .= tab . ' '
        " get buffer names and statuses
        let n = ''      " temp string for buffer names while we loop and check buftype
        let m = 0       " &modified counter
        let bc = len(tabpagebuflist(tab))     " counter to avoid last ' '
        " loop through each buffer in a tab
        for b in tabpagebuflist(tab)
            " buffer types: quickfix gets a [Q], help gets [H]{base fname}
            " others get 1dir/2dir/3dir/fname shortened to 1/2/3/fname
            if getbufvar( b, "&buftype"  ) == 'help'
                let n .= '[H]' . fnamemodify( bufname(b), ':t:s/.txt$//'  )
            elseif getbufvar( b, "&buftype"  ) == 'quickfix'
                let n .= '[Q]'
            else
                let n .= pathshorten(bufname(b))
            endif
            " check and ++ tab's &modified count
            if getbufvar( b, "&modified"  )
                let m += 1
            endif
            " no final ' ' added...formatting looks better done later
            if bc > 1
                let n .= ' '
            endif
            let bc -= 1
        endfor
        " add modified label [n+] where n pages in tab are modified
        if m > 0
            let s .= '+ ' " Mine.
            " let s .= '[' . m . '+]'
        endif
        " select the highlighting for the buffer names
        " my default highlighting only underlines the active tab
        " buffer names.
        let s .= (tab == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
        " add buffer names
        let s .= (n == '' ? '[New]' : n)
        " switch to no underlining and add final space to buffer list
        let s .= ' '
    endfor
    " after the last tab fill with TabLineFill and reset tab page nr
    let s .= '%#TabLineFill#%T'
    " right-align the label to close the current tab page
    if tabpagenr('$') > 1
        let s .= '%=%#TabLineFill#%999Xclose'
        " let s .= '%=%999XX' " Mine.
    endif
    return s
endfunction"
