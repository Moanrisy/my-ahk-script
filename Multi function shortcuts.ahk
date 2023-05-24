#Requires AutoHotkey v2.0

; Switch capslock and left ctrl
LCtrl::CapsLock
CapsLock::LCtrl

; Map alt+q to alt+f4
!q::
{
    send "!{F4}"
}

;This is the shortcut key for ALT+W
!w::
{
    ;WinSet, Style, -0xC00000, %WinTitle%
    ;WinSetStyle "^0xC00000", "A" ;Used for the caption  

    WinSetStyle "^0x40000", "A" ;Used for the sizebox
    WinSetStyle "^0x800000", "A" ;Used for the border
    WinMove 1350, 930, 600, 70, "A" ;Moves and resizes window
    WinSetAlwaysOnTop -1, "A" ;Set the window as always on top
}

;; alt + m
; !m::
; {
; }

;; Super + m
#m:: {
    currentWindow := WinExist("A")
    isMaximized := WinGetMinMax(currentWindow)
    
    if (isMaximized)
        WinRestore(currentWindow)
    else
        WinMaximize(currentWindow)
}

;; Focus on explorer window or launch it
#e::WinExist('ahk_class CabinetWClass') ? WinActivate() : Run('explorer')

;; ctrl + space
;; ^space::
;; {
;;     WinSetAlwaysOnTop -1, "A"
;; }