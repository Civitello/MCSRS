#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.

SendMode Event

;From multiplayer screen, navigate to direct connect, input an ip address from a list of ip addresses in the clipboard and connect. Changes ip address each time activacted.
~!1::
  If (ARR[CNT]!=Clipboard || !ARR.Count()){
    Clipboard:=RegExReplace(Clipboard,"`am)\n?\r?$")
    ARR:=StrSplit(Clipboard,"`n","`r")
    CNT:=0
  }
  CNT:=% (CNT=ARR.Count())?1:CNT+1
  Clipboard:=ARR[CNT]
  SetKeyDelay 70
  Send {Tab 3}{Enter}{Tab}^a^v{Enter}
  SetKeyDelay 0
Return

;Open F3 Pie
~!2::
Send, {RShift down}{F3 down}{F3 up}{RShift up}
Return

;Press F5 to change view
~!3::
Send, {F5 down}{F5 up}
Return

;Stop the server (triggering server reset) and return to multiplayer screen.
~!4::
  Send t
  Sleep 70
  Send /stop
  Sleep 70
  Send {Enter}
  Sleep 500
  Send {Tab}
  Sleep 70
  Send {Enter}
Return
