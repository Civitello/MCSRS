SendMode Event
CNT:=0
~^c::ARR:=[],CNT:=0
!3::
  If !ARR.Count()
    ARR:=StrSplit(Clipboard,"`n")
  CNT:=% (CNT=ARR.Count())?1:CNT+1
  Clipboard:=ARR[CNT]
  Send t
  Sleep 70
  SetKeyDelay 0
  Send /stop
  Sleep 70
  Send {Enter}
  Sleep 400
  SetKeyDelay 70
  Send {Tab 3}{Enter}{Tab}^a^v{Enter}{Tab}{Enter}
  SetKeyDelay 10
Return
