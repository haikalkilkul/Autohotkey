#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#If WinActive("ahk_exe Evenicle.EXE")

Joy2::
Send {x down}
KeyWait Joy2
Send {x up}
return

Joy3::
Send {z down}
KeyWait Joy3
Send {z up}
return

Joy4::
Send {a down}
KeyWait Joy4
Send {a up}
return

Joy1::
Send {s down}
KeyWait Joy1
Send {s up}
return

#MaxThreadsPerHotkey 3
Joy8::
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
	Send {z down}
	Send {z up}
	return
    ; But leave the rest below unchanged.
    if not KeepWinZRunning  ; The user signaled the loop to stop by pressing Win-Z again.
        break  ; Break out of this loop.
}
KeepWinZRunning := false  ; Reset in preparation for the next press of this hotkey.
return

esc::ExitApp