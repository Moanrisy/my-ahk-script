WinGet, windows, list

titles := ""
Loop, %windows%
{
    id := windows%A_Index%
    WinGet, process, ProcessName, ahk_id %id%
    WinGetTitle, title, ahk_id %id%
    ;FileAppend, %process% %title%`n, *
    ; MsgBox %process% %title%`n, *
    titles = %titles% a %title% p %process% `n
}

MsgBox %titles%`

;ExitApp