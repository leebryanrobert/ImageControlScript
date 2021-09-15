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

FindImage(filename, byref FoundX, byref FoundY)
{
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *5 images/%filename%
    return
}

;Scrolls all the way down and finds save button
FindSave(byref x, byref y)
{
	Send, {Click 780 245}
	Send, {WheelDown 10}
	Sleep 100
	FindImage("save.jpg", x, y)
	Sleep 100
	Send, {WheelUp 10}
	return
}

;Scrolls all the way down and clicks at x, y
ClickSave(x, y)
{
	Send, {WheelDown 10}
	Send, {Click %x% %y%}
	Send, {WheelUp 10}
}

SelectAll()
{
	FindSave(SaveX, SaveY)
	AddDay(2)				;Go back 2 days
	AddTime(3)				;Set time to 3am
	ClickSave(SaveX, SaveY)	;Click Save
	Send, {Click 940 245}	;Click Lighting
	ClickSave(SaveX, SaveY)	;Click Save
	AddTime(10)				;Set time to 1pm
	Send, {Click 715 245}	;Click Day
	ClickSave(SaveX, SaveY)	;Click Save
	Send, {Click 850 245}	;Click Initial
	ClickSave(SaveX, SaveY)	;Click Save
	return
}

;Start Script
+^z::
SelectAll()
return