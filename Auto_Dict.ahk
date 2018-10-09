;Reload;

~LButton & r::
reload ;
return

;+--------------------------------------------------------------------------------------------
~^C::  ;ctrl+c
clipboard =  ; Start off empty to allow ClipWait to detect when the text has arrived.
Send ^c
ClipWait  ; Wait for the clipboard to contain text.

Run C:\Auto_Dict.exe,,Min

MMyVar := "Now acquiring infos from Yahoo Dictionary..."
Tooltip ,%MMyVar%,,,

Loop
{
	NNewVar:=clipboard
	if (NNewVar != MMyVar)
		{
			break
		}
	MMyVar:=NNewVar
}




MyVar :=clipboard
StringLen, Length, MyVar
;MsgBox %Length%
;MsgBox %clipboard%
;MsgBox %MyVar%

sleep, 3500

;Display Message 

Tooltip ,%clipboard%,,,
CoordMode, Mouse, Screen   
MouseGetPos, xpos, ypos,,,1  

;Keep running until cursor moves

Loop
{
	NewVar:=clipboard
	if (NewVar != MyVar)
		{
			Tooltip ,%clipboard%,,,
		}
	IfWinNotExist, C:\Auto_Dict.exe
		{
			ToolTip
			break
		}
	MyVar:=NewVar
}
;Close Tooltip
return


