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

; Set window width and height for VLC play this.mp4
If WinExist("Play this.mp4 - VLC media player")
{
    WinGet, vlc_hwnd, ID, Play this.mp4 - VLC media player

    ; Check if a secondary monitor exists
    SysGet, MonitorCount, MonitorCount
    if (MonitorCount > 1)
    {
        ; Move the window to the seondary monitor
        WinMove, ahk_id %vlc_hwnd%, , 1970, 0, 800, 600
    } else {
        WinMove, ahk_id %vlc_hwnd%, , 0, 0, 1400, 1100
    }
}

; Set default behaviour for clock in task app
If WinExist("Clock in Task")
{
    WinGet, cit_hwnd, ID, Clock in Task

    ; Check if the window exists
    if (cit_hwnd && !IsProcessedWindow(cit_hwnd))
    {
        ; Apply the desired commands to the window
        WinSet, Style, ^0x40000, ahk_id %cit_hwnd% ; Used for the sizebox
        WinSet, Style, ^0x800000, ahk_id %cit_hwnd% ; Used for the border
        WinMove, ahk_id %cit_hwnd%, , 1350, 930, 600, 70 ; Moves and resizes window
        WinSet, AlwaysOnTop, On, ahk_id %cit_hwnd% ; Set the window as not always on top

        ; Mark the window as processed
        MarkWindowAsProcessed(cit_hwnd)
    }
}

IsProcessedWindow(hwnd) {
    ; Check if the window's unique identifier (HWND) is stored in a file
    FileRead, processedWindows, processed_windows.txt
    
    ; Return true if the window's HWND is found in the file, false otherwise
    return RegExMatch(processedWindows, "\b" hwnd "\b")
}

MarkWindowAsProcessed(hwnd) {
    ; Append the window's HWND to the file
    FileAppend, %hwnd%`n, processed_windows.txt
}

DetectHiddenWindows, Off
return
