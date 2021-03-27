#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Gui Add, Button, gTestIt, Press Me!
Gui Show, w300, Press It!
Return

TestIt:
	If (GetKeyState("Shift", "P"))
		MsgBox You shifted!
	Else
		MsgBox Plain click
Return