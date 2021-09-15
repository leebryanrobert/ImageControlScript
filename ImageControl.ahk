#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



;Increments day by i
AddDay(i)
{
	Send, {Click 780 245}
	Send, {Tab}
	Send, {Right %i%}
	Sleep 700
}

;Increments time of day by i
AddTime(i)
{
	Send, {Click 780 245}
	Send, {Tab 4}
	Send, {Right %i%}
	Sleep 700
}

SelectAll()
{
	AddDay(2)				;Go back 2 days
	AddTime(3)				;Set time to 3am
	Send, {Click 1830 720}	;Click Save
	Send, {Click 940 245}	;Click Lighting
	Send, {Click 1830 720}	;Click Save
	AddTime(10)				;Set time to 1pm
	Send, {Click 715 245}	;Click Day
	Send, {Click 1830 720}	;Click Save
	Send, {Click 850 245}	;Click Initial
	Send, {Click 1830 720}	;Click Save
	return
}

;Start Script
+^z::
SelectAll()
return