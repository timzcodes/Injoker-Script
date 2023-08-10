
; ____________________________ Invoker Script ____________________________
;
; 						 Bence Markiel
;						   rpawr.com
;				hi	 bence.markiel@rpawr.com
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

global states:= ["ppp","kkk","lll"]
global i

; ========================================================================

Gui_Invoker()

; ========================================================================

!s::Invoker_Spell("Coldsnap")
z::Invoker_Spell("GhostWalk")
!f::Invoker_Spell("IceWall")
w::Invoker_Spell("EMP")
q::Invoker_Spell("Tornado")
c::Invoker_Spell("Alacrity")
r::Invoker_Spell("DeafeningBlast")
t::Invoker_Spell("SunStrike")
x::Invoker_Spell("SpiritForge")
e::Invoker_Spell("ChaosMeteor")
!q::Invoker_Spell("q")
!w::Invoker_Spell("we")
!e::Invoker_Spell("ee")



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
	
	Spells:= [ ["ColdSnap", 		"ppp"]
		,     ["GhostWalk", 	"ppk"]
		,     ["IceWall", 		"ppl"]
		,     ["EMP", 			"kkk"]
		,     ["Tornado", 		"kkp"]	
		,     ["Alacrity", 		"kkl"]
		,     ["DeafeningBlast", "pkl"]
		,     ["SunStrike", 	"lll"]
		,     ["SpiritForge", 	"llp"]
		,     ["q", 	"ppp"]
		,     ["we", 	"kkk"]
		,     ["ee", 	"lll"]
		,     ["ChaosMeteor", 	"llk"] ]
	
	loop % Spells.Length(){
		if InStr(Spells[A_Index][1],spell){
			if (spell == "GhostWalk") {
				SendInput(Spells[A_Index][2])
				send "["
				sleep, 300
				Send "d"
				return
			}		
			if (spell == "q" || spell == "we" || spell == "ee") {
				SendInput(Spells[A_Index][2])
				return
			}
			SendInput(Spells[A_Index][2] "[" states[i])
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

^!z::Suspend
; ========================================================================