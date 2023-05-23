#Persistent
SetTimer, CheckWindows, 1000
return

CheckWindows:
DetectHiddenWindows, On

; Check if CMD window with title "C:/Program Files/Git/WAIT" exists
IfWinNotExist, C:/Program Files/Git/WAIT
{
    ;; DetectHiddenWindows, Off
    ; MsgBox, CMD window doesn't exist!
    ; return ; or: exit
} else {

    ; Minimize CMD window with title "C:/Program Files/Git/WAIT"
    WinGet, cmdWindow, ID, C:/Program Files/Git/WAIT
    WinGet, cmdWindowState, MinMax, ahk_id %cmdWindow%
    if (cmdWindowState != -1)
    {
        WinMinimize, ahk_id %cmdWindow%
        Sleep, 300
    }
}

; Minimize "clock-in-task-fyne.exe" window
IfWinExist, ahk_exe clock-in-task-fyne.exe
{
    WinGet, clockWindow, ID, clock-in-task-fyne.exe
    WinGetClass, windowClass, ahk_id %clockWindow%
    ;; MsgBox % "Window Class: " windowClass
    if (windowClass = "CASCADIA_HOSTING_WINDOW_CLASS")
    {
        WinGet, clockWindowState, MinMax, ahk_id %clockWindow%
        if (clockWindowState != -1)
        {
            WinMinimize, ahk_id %clockWindow%
            Sleep, 300
        }
    }
}

; Minimize "emacs" cmd window
WinGet, cmdWindow, ID, emacs
WinGet, cmdWindowState, MinMax, ahk_id %cmdWindow%
if (cmdWindowState != -1)
{
    WinMinimize, ahk_id %cmdWindow%
    Sleep, 300
}

DetectHiddenWindows, Off
return
