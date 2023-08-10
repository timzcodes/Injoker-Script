
; ____________________________ Invoker Script ____________________________
;
; 						 Bence Markiel
;						   rpawr.com
;					 bence.markiel@rpawr.com
;						  04.04.2020
; ________________________________________________________________________

#NoEnv
#Persistent
#SingleInstance, Force
SendMode, Input
SetWorkingDir, %A_ScriptDir%
SetTitleMatchMode, 2
SetTitleMatchMode, Fast

; ========================================================================

global states:= ["qqq","www","eee"]
global i

; ========================================================================

Gui_Invoker()

; ========================================================================

^s::Invoker_Spell("Coldsnap")
^a::Invoker_Spell("GhostWalk")
^f::Invoker_Spell("IceWall")
^w::Invoker_Spell("EMP")
^q::Invoker_Spell("Tornado")
^2::Invoker_Spell("Alacrity")
^r::Invoker_Spell("DeafeningBlast")
^d::Invoker_Spell("SunStrike")
^1::Invoker_Spell("SpiritForge")
^e::Invoker_Spell("ChaosMeteor")

CapsLock::Invoker_ChangeState()

F12::ExitApp

; ========================================================================

Gui_Invoker(){
	
	Gui, +LastFound +AlwaysOnTop +ToolWindow -Caption
	Gui, Color, EEFFFF
	WinSet, TransColor, EEFFFF 225
	
	Width:= 64	
	GuiCommand:= ["w" Width " ys","w" Width],
	Path:= A_ScriptDir . "\img\"
	
	Gui, Add, Picture, % GuiCommand[2], % Path "Cold-Snap.png"
	Gui, Add, Picture, % GuiCommand[1], % Path "Tornado.png"
	Gui, Add, Picture, % GuiCommand[1], % Path "EMP.png"
	Gui, Add, Picture, % GuiCommand[1], % Path "Ice-Wall.png"
	Gui, Add, Picture, % GuiCommand[1], % Path "Ghost-Walk.png"
	Gui, Add, Picture, % GuiCommand[1], % Path "Alacrity.png"
	Gui, Add, Picture, % GuiCommand[1], % Path "Chaos-Meteor.png"
	Gui, Add, Picture, % GuiCommand[1], % Path "Deafening-Blast.png"
	Gui, Add, Picture, % GuiCommand[1], % Path "Sun-Strike.png"
	Gui, Add, Picture, % GuiCommand[1], % Path "Forge-Spirit.png"
	
	;Gui, Show, y143
	;hwnd_Gui:= WinExist()
	WinSet, ExStyle, ^0x20, ahk_id %hwnd_Gui%
	
	return
}

Invoker_Spell(spell){
	
	Spells:= [ ["ColdSnap", 		"qqq"]
		,     ["GhostWalk", 	"qqw"]
		,     ["IceWall", 		"qqe"]
		,     ["EMP", 			"www"]
		,     ["Tornado", 		"wwq"]	
		,     ["Alacrity", 		"wwe"]
		,     ["DeafeningBlast", "qwe"]
		,     ["SunStrike", 	"eee"]
		,     ["SpiritForge", 	"eeq"]
		,     ["ChaosMeteor", 	"eew"] ]
	
	loop % Spells.Length(){
		if InStr(Spells[A_Index][1],spell){
			SendInput(Spells[A_Index][2] "r" states[i]) 
			return
		}
	}
}

Invoker_ChangeState(){
	i++
	(i=4) ? (i:= 1) : i
	SendInput(states[i])
	return
}

SendInput(hotkeys){
	SendInput, %hotkeys%
	return
}

; ========================================================================