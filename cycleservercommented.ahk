SendMode Event

!3::
  If (ARR[CNT]!=Clipboard || !ARR.Count()){
; ^^ Check if CB = last content (Line 13) OR if array is empty...
    Clipboard:=RegExReplace(Clipboard,"`am)\n?\r?$")
;   ^^ Remove any empty lines from CB
    ARR:=StrSplit(Clipboard,"`n","`r"),CNT:=0
;   ^^ Populate our array with the lines from the CB
  }
  CNT:=% (CNT=ARR.Count())?1:CNT+1
; ^^ Counter to loop from 1 to max array items (see below)
  Clipboard:=ARR[CNT]
; ^^ CB = line to send (See Line 4 - CB has updated if different!)
  Send t
  Sleep 70
  Send /stop
  Sleep 70
  Send {Enter}
  Sleep 400
  SetKeyDelay 70
  Send {Tab 3}{Enter}{Tab}^a^v{Enter}{Tab}{Enter}
  SetKeyDelay 0
Return


/* The counter is the following, shrunk using a ternary operator:
  If (CNT=ARR.Count())   ;If CNT has reached the last line
    CNT:=1               ;  Start again from the beginning
  Else                   ;Otherwise
    CNT:=CNT+1           ;  Move to the next line
*/
