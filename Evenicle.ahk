#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#If WinActive("ahk_exe Evenicle.EXE")

z::
#MaxThreadsPerHotkey 1
if KeepWinZRunning  ; This means an underlying thread is already running the loop below.
{
    KeepWinZRunning := false  ; Signal that thread is loop to stop.
    return  ; End this thread so that the one underneath will resume and see the change made by the line above.
}
; Otherwise:
	KeepWinZRunning := true
Loop
{
Send {a down}
Sleep 1000
Send {a up}
Send {d down}
Sleep 1000
Send {d up}
MouseClick, left
    ; But leave the rest below unchanged.
    if not KeepWinZRunning  ; The user signaled the loop to stop by pressing Win-Z again.
        break  ; Break out of this loop.
}
KeepWinZRunning := false  ; Reset in preparation for the next press of this hotkey.
return

p::pause