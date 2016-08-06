set oLocator = CreateObject("WbemScripting.SWbemLocator")
set oServices = oLocator.ConnectServer(".","root\wmi")
set oResults = oServices.ExecQuery("select * from batteryfullchargedcapacity")
for each oResult in oResults
   iFull = oResult.FullChargedCapacity
next

while (1)
  set oResults = oServices.ExecQuery("select * from batterystatus")
  for each oResult in oResults
    iRemaining = oResult.RemainingCapacity
    bCharging = oResult.Charging
  next
  iPercent = ((iRemaining / iFull) * 100) mod 100
  if not bCharging and (iPercent<10) Then
	Set objShell = CreateObject("Wscript.Shell")
	strCommand = "powershell -c (New-Object Media.SoundPlayer 'C:\Windows\Media\battery-notifier\switchon.wav').PlaySync();"
	objShell.Run strCommand, 0, False
	msgbox "Battery is Low Please Charge"
  Elseif bCharging and (iPercent > 98) Then
	Set objShell = CreateObject("Wscript.Shell")
	strCommand = "powershell -c (New-Object Media.SoundPlayer 'C:\Windows\Media\battery-notifier\switchoff.wav').PlaySync();"
	objShell.Run strCommand, 0, False
	msgbox "Battery is fully charged"
end if
  wscript.sleep 30000 
wend
