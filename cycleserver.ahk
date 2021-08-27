SendMode Event

!3::
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

!2::
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
