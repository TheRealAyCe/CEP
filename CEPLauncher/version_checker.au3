#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Outfile=version_checker.exe
#AutoIt3Wrapper_Res_Fileversion=1.0.0.0
#AutoIt3Wrapper_Res_LegalCopyright=AyCe © 2013
#AutoIt3Wrapper_Res_requestedExecutionLevel=asInvoker
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <INet.au3>
#include <StaticConstants.au3>
#include <Misc.au3>

Opt('MustDeclareVars', 1)
Opt('TrayIconHide', 1)

Const $SITE = "http://para-welt.com/cep/version.txt"

If _Singleton("CEPVersionChecker", 1) = 0 Then
	; We know the script is already running. Let the user know.
	; Not needed, just a check tool
	;MsgBox(0, "CEPVersionChecker", "This programm is already running. Please close the running version first!")
	Exit
EndIf

; do stuff
Start()

Func Start()
	Local $versionString, $file
	SetError(0)
	$versionString = _INetGetSource($SITE, True)
	If(@error <> 1 And StringLen($versionString) > 0)Then
		; works, now save to file
		$file = FileOpen("updateinfo.txt", 2)
		If($file <> -1)Then
			FileWrite($file, $versionString)
			FileFlush($file)
			FileClose($file)
			; string should have been saved
		EndIf
	EndIf
	; now create a dummy file, so the launcher knows we're done
	$file = FileOpen("update.tmp",2)
	FileClose($file)
EndFunc
