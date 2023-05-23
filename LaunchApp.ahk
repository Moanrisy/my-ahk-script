RAlt & c::
{ 
    ; Add your desired command or actions here
    ; MsgBox Init.

    If !ProcessExist("chrome.exe")
    {
        Run, "C:\Program Files\Google\Chrome\Application\chrome.exe"
        WinWait, ahk_exe chrome.exe
        WinActivate, ahk_exe chrome.exe
        WinWaitActive, ahk_exe chrome.exe

        return
    }

    WinActivate, ahk_exe chrome.exe
    WinWaitActive, ahk_exe chrome.exe
    SendInput, +!d

    return
}

ProcessExist(name)
{
    Process, Exist, %name%
    return ErrorLevel
}