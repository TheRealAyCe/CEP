#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=cepicon.ico
#AutoIt3Wrapper_Outfile=CEPLauncher.exe
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseUpx=y
#AutoIt3Wrapper_Res_Fileversion=1.2.2.0
#AutoIt3Wrapper_Res_LegalCopyright=AyCe © 2017
#AutoIt3Wrapper_Res_requestedExecutionLevel=asInvoker
#AutoIt3Wrapper_Res_File_Add=ceplauncher4.jpg, rt_rcdata, LAUNCHERIMAGE
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <resources.au3>
#include <Misc.au3>
#include <Timers.au3>

Opt('MustDeclareVars', 1)
Opt('TrayIconHide', 1)

Const $VERSION = "1.2.2"
Const $WEBSITEVERSION = "122"

Const $pwsettingsdir = @AppDataDir&"\SpieleEntwicklungsKombinat\Paraworld\"

If _Singleton("CEPLauncher", 1) = 0 Then
	; We know the script is already running. Let the user know.
	MsgBox(0, "CEP Launcher", "This programm is already running. Please close the running version first!")
	Exit
EndIf

Global $updateDone, $updateTimer, $gui, $updateState, $updateVersion, $updateName, $labelUpdate, $buttonUpdateSite

$updateDone = 0
$updateState = 0
; states:
; -2=error: wrong format
; -1=error: file not found
; 0=searching...
; 1=latest version
; 2=update available

FileDelete("update.tmp")
;CheckUpdate()
Run ("version_checker.exe")

Launcher()

Func Launcher()
    Local $errorlevel, $image, $buttonStart, $buttonSDK, $buttonUpdates, $buttonCache, $buttonPWcom, $buttonReadme, $buttonReadmeSM, $buttonDevs, $buttonSSSOff, $buttonRestore, $buttonSettings, $buttonDedicated, $buttonUninstall, $msg, $labelUpdateTitle, $labelImprint
    $gui = GUICreate("ParaWorld CEP "&$VERSION, 550, 545)
	$image = GUICtrlCreatePic ( "", 0, 0, 550, 545)
	_ResourceSetImageToCtrl($image, "LAUNCHERIMAGE")
	GUICtrlSetState($image, $GUI_DISABLE)
	;GUICtrlCreateLabel("If PW crashes, press this button!", 10, 90, 240, 20, $SS_CENTER)
    $buttonStart = GUICtrlCreateButton("Start CEP", 20, 20, 200, 55)
    $buttonSDK = GUICtrlCreateButton("Start SDK", 20, 95, 200, 25)
    $buttonUpdates = GUICtrlCreateButton("Website && Updates", 20, 140, 200, 25)
    $buttonPWcom = GUICtrlCreateButton("Visit Para-Welt.com", 20, 170, 200, 25)
    $buttonReadme = GUICtrlCreateButton("Readme CEP", 20, 215, 200, 25)
    $buttonReadmeSM = GUICtrlCreateButton("Readme SEASMOD (old)", 20, 245, 200, 25)
    $buttonDevs = GUICtrlCreateButton("The people who made this", 20, 275, 200, 25)
    $buttonCache = GUICtrlCreateButton("Clear Cache", 20, 320, 200, 25)
    $buttonSettings = GUICtrlCreateButton("Open settings folder", 20, 350, 200, 25)
    $buttonSSSOff = GUICtrlCreateButton("Switch off SSS", 20, 380, 200, 25)
    $buttonRestore = GUICtrlCreateButton("Restore Settings", 20, 410, 200, 25)
    $buttonDedicated = GUICtrlCreateButton("Start Dedicated Server", 20, 455, 200, 25)
    $buttonUninstall = GUICtrlCreateButton("Uninstall CEP", 20, 500, 200, 25)
	$labelImprint = GUICtrlCreateLabel ( "2014 © by Para-Welt.com - ParaWorld © by SEK (Ubi)", 240, 505, 290, 20, $SS_CENTER);
	GUICtrlSetBkColor($labelImprint, $GUI_BKCOLOR_TRANSPARENT)
	;$image = GUICtrlCreatePic ( "", 240, 20, 290, 470)
	GUICtrlSetFont ($buttonStart, 12, 1000)
	GUICtrlSetState ( $buttonStart, $GUI_DEFBUTTON )
	$labelUpdateTitle = GUICtrlCreateLabel ( "Update"&@CRLF&"check:", 240, 50, 290, 100, $SS_CENTER);
	GUICtrlSetFont ($labelUpdateTitle, 30)
	GUICtrlSetBkColor($labelUpdateTitle, $GUI_BKCOLOR_TRANSPARENT)
	$labelUpdate = GUICtrlCreateLabel ( "", 240, 200, 290, 100, $SS_CENTER);
	GUICtrlSetBkColor($labelUpdate, $GUI_BKCOLOR_TRANSPARENT)
	GUICtrlSetFont ($labelUpdate, 20)
    $buttonUpdateSite = GUICtrlCreateButton("Download from here!", 260, 300, 250, 80)
	GUICtrlSetFont ($buttonUpdateSite, 18)
	;Bild: 500-260 = 240 x 425
	UpdateUIState()
    GUISetState()

	$updateTimer = _Timer_SetTimer($gui, 1000, "OnTimerCheck")

    While 1
        $msg = GUIGetMsg()
        Select
			Case $msg = $GUI_EVENT_CLOSE
				ExitLoop
            Case $msg = $buttonStart
				Run ("../../Tools/PWTool.exe Start CEP", "../../Tools/")
				ExitLoop
            Case $msg = $buttonSDK
				Run ("../../Tools/PWTool.exe SDK CEP", "../../Tools/")
				ExitLoop
            Case $msg = $buttonDedicated
				Run ("../../Tools/PWTool.exe Dedicated CEP", "../../Tools/")
				ExitLoop
            Case $msg = $buttonUpdates Or $msg = $buttonUpdateSite
				VisitHomepage()
            Case $msg = $buttonPWcom
				ShellExecute("http://para-welt.com/")
            Case $msg = $buttonReadme
				ShellExecute("ReadMe.txt")
            Case $msg = $buttonReadmeSM
				ShellExecute("ReadMe SEASMOD.txt")
            Case $msg = $buttonDevs
				ShellExecute("credits.txt")
            Case $msg = $buttonCache
				Run ( "../../Tools/ClearCache.exe", "../../Tools/")
            Case $msg = $buttonSettings
				ShellExecute(@AppDataDir&"/SpieleEntwicklungsKombinat/Paraworld")
            Case $msg = $buttonSSSOff
				RunWait ("../../Tools/PWTool.exe SSSOff", "../../Tools/")
            Case $msg = $buttonRestore
				RunWait ("../../Tools/PWTool.exe Restore", "../../Tools/")
            Case $msg = $buttonUninstall
				ShellExecute( "..\..\Uninstall CEP.exe")
				ExitLoop
        EndSelect
    WEnd
EndFunc

Func VisitHomepage()
	ShellExecute("http://para-welt.com/cep/?version="&$WEBSITEVERSION)
EndFunc

Func UpdateUIState()
	; Update the UI display
	GUICtrlSetState($buttonUpdateSite, $GUI_HIDE)
	Switch $updateState
		Case -2
			GUICtrlSetData($labelUpdate, "Error: Wrong format"&@CRLF&"or proxy blocking")
			GUICtrlSetColor($labelUpdate, 0x000000)
		Case -1
			GUICtrlSetData($labelUpdate, "Error: File not found"&@CRLF&"or site not reachable")
			GUICtrlSetColor($labelUpdate, 0x000000)
		Case 0
			GUICtrlSetData($labelUpdate, "Searching...")
			GUICtrlSetColor($labelUpdate, 0x999900)
		Case 1
			GUICtrlSetData($labelUpdate, "Up to date!")
			GUICtrlSetColor($labelUpdate, 0x009900)
		Case 2
			GUICtrlSetData($labelUpdate, "Update available:"&@CRLF&$updateName)
			GUICtrlSetColor($labelUpdate, 0x990000)
			GUICtrlSetState($buttonUpdateSite, $GUI_SHOW)
	EndSwitch
EndFunc

Func CheckUpdate()
	; parse the update file (if it even exists)
	Local $info, $file, $fullStr
	$file = FileOpen("updateinfo.txt", 0)
	If ($updateDone = 0) Then
		$updateState = 0
	Else
		$updateState = -1
	EndIf
	If ($file <> -1) Then
		SetError(0)
		$fullStr = FileRead($file)
		If (@error <= 0) Then
			; now split the data
			$info = StringSplit($fullStr, @TAB)
			If ($info[1] == "versioncheck") Then
				If ($info[0] > 2) Then
					$updateName = $info[2]
					$updateVersion = $info[3]
					; not important atm:
					; $updateNumber = $info[3]
					If ($updateVersion == $WEBSITEVERSION) Then
						$updateState = 1
					Else
						$updateState = 2
					EndIf
				Else
					$updateState = -2
				EndIf
			Else
				$updateState = -2
			EndIf
		EndIf
		FileClose($file)
	EndIf
EndFunc

Func OnTimerCheck($hWnd, $Msg, $iIDTimer, $dwTime)
	;MsgBox(0, "OnTimerCheck", "Called!")
	; Called to check the timer
	; Check if update check file exists
	If (FileExists("update.tmp") = 1) Then
		FileDelete("update.tmp")
		_Timer_KillTimer($gui, $updateTimer)
		$updateDone = 1;
		CheckUpdate()
		UpdateUIState()
	EndIf
EndFunc
