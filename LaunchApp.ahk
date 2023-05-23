RAlt & c::
{ 
    ; Add your desired command or actions here
    ; MsgBox Init.

    If ProcessExist("chrome.exe")
    {
        WinActivate, ahk_exe chrome.exe
        WinWaitActive, ahk_exe chrome.exe
        ; SendInput, {Ctrl Down}t{Ctrl Up}
    }
    else
    {
        Run, "C:\Program Files\Google\Chrome\Application\chrome.exe"
        WinWait, ahk_exe chrome.exe
        WinActivate, ahk_exe chrome.exe
        WinWaitActive, ahk_exe chrome.exe
        ; SendInput, {Ctrl Down}l{Ctrl Up}
        ; Sleep, 50
        ; SendInput, {Ctrl Down}t{Ctrl Up}
    }

    return
}

ProcessExist(name)
{
    Process, Exist, %name%
    return ErrorLevel
}

RAlt & d::
{ 
    If ProcessExist("chrome.exe")
    {
        WinActivate, ahk_exe chrome.exe
        WinWaitActive, ahk_exe chrome.exe
        SendInput, +!d
    }
}