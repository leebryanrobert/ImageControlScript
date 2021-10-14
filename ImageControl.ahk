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
}

;Increments time of day by i and scrolls back to top of page
AddTime(i)
{
	Send, {Click 780 245}
	Send, {Tab 4}
	Send, {Right %i%}
	Send, {WheelUp 10}
	Sleep 100
}

FindImage(filename, byref FoundX, byref FoundY)
{
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *5 images/%filename%
    return
}

;Saves and scrolls back to top of page
Save()
{
	Send, {Click 780 320}
	Send, {Tab 5}
	Send, {Enter}
	Send, {WheelUp 10}
	Sleep 100
}

SelectAll()
{
	AddDay(2)				;Go back 2 days
	while getkeystate("z","p")
		Sleep 10
	AddTime(3)				;Set time to 3am
	Save()					;Save
	Send, {Click 940 245}	;Click Lighting
	Save()					;Save
	AddTime(10)				;Set time to 1pm
	Send, {Click 715 245}	;Click Day
	Save()					;Save
	Send, {Click 850 245}	;Click Initial
	Save()					;Save
	Send, {Click 1030 245}	;Click Intent
	return
}

SelectDayNight()
{
	AddDay(2)				;Go back 2 days
	while getkeystate("x","p")
		Sleep 10
	AddTime(3)				;Set time to 3am
	Save()					;Save
	AddTime(10)				;Set time to 1pm
	Send, {Click 715 245}	;Click Day
	Save()					;Save
	Send, {Click 1030 245}	;Click Intent
	return
}

SelectDayNightLighting()
{
	AddDay(2)				;Go back 2 days
	while getkeystate("i","p")
		Sleep 10
	AddTime(3)				;Set time to 3am
	Save()					;Save
	Send, {Click 940 245}	;Click Lighting
	Save()					;Save
	AddTime(10)				;Set time to 1pm
	Send, {Click 715 245}	;Click Day
	Save()					;Save
	Send, {Click 1030 245}	;Click Intent
	return
}

;Start Script
z::
SelectAll()
return

x::
SelectDayNight()
return

i::
SelectDayNightLighting()
return