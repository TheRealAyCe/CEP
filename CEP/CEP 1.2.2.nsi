;NSIS Modern User Interface
;Basic Example Script
;Written by Joost Verburg

;--------------------------------
;Include Modern UI

  !include "MUI2.nsh"

;--------------------------------
;General

Var modversion
;Var modversion2

  ;Name and file
  Name "ParaWorld CEP 1.2.2"
    !insertmacro MUI_DEFAULT MUI_ICON "installericon.ico"
  OutFile "paraworld_cep.exe"

Function .onInit
   StrCpy $modversion "122"
   InitPluginsDir
   File /oname=$PLUGINSDIR\splash.bmp "splash\ceplogo122.bmp"
   splash::show 10000 $PLUGINSDIR\splash
   ClearErrors
   ReadRegStr $INSTDIR HKLM "SOFTWARE\Sunflowers\ParaWorld" "InstallDir"
   IfErrors nopw
   Goto nopwend
   nopw:
   MessageBox MB_OK|MB_ICONEXCLAMATION "The installer could not detect an installation of ParaWorld. You have to set the ParaWorld-path yourself."
   StrCpy $INSTDIR "[insert ParaWorld directory here]"
   nopwend:
   ClearErrors
   ReadRegStr $0 HKCU "Software\ParaWorldCEP" "InstDir"
   IfErrors normal
   ;StrCpy $MY ;why did i use this???
   ; TODO: When user tries to install it in a folder its already in, warn user that files will be deleted
   ;       Also, tell him that there is already a version installed + the path
   MessageBox MB_YESNO|MB_ICONQUESTION "It seems another version of CEP is already installed. Should the installer remove it first?" IDYES qy IDNO qn
   qy:
   IfFileExists "$0\Data\CEP\Presets.txt" itis
   Goto tn
   itis:
   MessageBox MB_YESNO|MB_ICONQUESTION "Do you want to keep your army-sets?" IDYES ty IDNO tn
   ty:
   CopyFiles "$0\Data\CEP\Presets.txt" "$0"
   tn:
   RMDir /r "$0\Data\CEP"
   Delete "$INSTDIR\bin\CEP.bat"
   Delete "$INSTDIR\bin\CEPSDK.bat"
   Delete "$0\Data\Info\CEP.info"
   Delete "$0\Uninstall CEP.exe"
   Delete "$DESKTOP\ParaWorld CEP.lnk"
   Delete "$DESKTOP\PW SDK CEP.lnk"
   DeleteRegKey HKCU "Software\ParaWorldCEP"
   RMDir /r "$SMPROGRAMS\Sunflowers\ParaWorld\CEP"
   Goto normal
   qn:
   Quit
   normal:
   ClearErrors
FunctionEnd

Function AfterLang
   ; start: AyCe's Method for language-depending LTF
   ; 1. Find any language in the BP-folder
   FindFirst $0 $1 "$INSTDIR\Data\BoosterPack1\locale\*.*"
   loop:
     StrCmp $1 "" done
     StrCmp $1 ".." next
     StrCmp $1 "." next
     Goto done
     next:
       FindNext $0 $1
       Goto loop
   done:
   FindClose $0
   ; If language is not 2 chars, set to empty
   StrLen $2 $1
   ${If} $2 != 2
      StrCpy $1 ""
   ${EndIf}

   ; 2. Check if a language has been found (=BP installed)
   IfFileExists "$INSTDIR\Data\BoosterPack1\locale\$1\Texts\_ltflist.txt" UseBPLTF NoLTF
   UseBPLTF:
     ; 3. Copy the BP-_ltflist.txt-file
     CopyFiles "$INSTDIR\Data\BoosterPack1\locale\$1\Texts\_ltflist.txt" "$INSTDIR\Data\CEP\Texts\_ltflist.txt"
     ; 4. Open it and append cep.ltf to it
     FileOpen $4 "$INSTDIR\Data\CEP\Texts\_ltflist.txt" a
       FileSeek $4 0 END
       FileWrite $4 "$\r$\n"
       FileWrite $4 "/Data/CEP/Texts/cep.ltf"
       FileWrite $4 "$\r$\n"
     FileClose $4
     ; 5. Modify the ltf-header. This is quite hacky!
     FileOpen $4 "$INSTDIR\Data\CEP\Texts\cep.ltf" a
       FileSeek $4 3
       FileWrite $4 '"Suit Localization File";"$1 UTF8"'
     FileClose $4
   ; If no BP/_ltflist.txt was found, continue using the built-in ltf
   NoLTF:
   ; end
   Call CheckPresets
FunctionEnd

Function CheckPresets
  IfFileExists "$INSTDIR\Presets.txt" tey
  Goto ten
  tey:
  CopyFiles "$INSTDIR\Presets.txt" "$INSTDIR\Data\CEP"
  Delete "$INSTDIR\Presets.txt"
  ten:
  ClearErrors
FunctionEnd
  
  ;Get installation folder from registry if available
  InstallDirRegKey HKCU "Software\ParaworldCEP" ""

  ;Request application privileges for Windows Vista
  RequestExecutionLevel admin

  ;Default installation folder
  InstallDir $INSTDIR

;--------------------------------
;Interface Settings

  !define MUI_ABORTWARNING

;--------------------------------
;Pages

  !insertmacro MUI_PAGE_LICENSE "desc.txt"
  !insertmacro MUI_PAGE_COMPONENTS
  !insertmacro MUI_PAGE_DIRECTORY
  !insertmacro MUI_PAGE_INSTFILES
  
  !insertmacro MUI_UNPAGE_CONFIRM
  !insertmacro MUI_UNPAGE_INSTFILES
  
;--------------------------------
;Languages
 
  !insertmacro MUI_LANGUAGE "English"

;--------------------------------
;Installer Sections

InstType "English (UK)"
InstType "English (US)"
InstType "German"
InstType "Italian"
InstType "Polish"
InstType "French"
InstType "Spanish"
InstType "Russian"
InstType "Hungarian"
InstType /NOCUSTOM

Section "!CEP files" SecSBasic

  SectionIn RO

  SetOutPath "$INSTDIR"

  ;ADD YOUR OWN FILES HERE...
  File /r "files\basic\"

  SetOutPath "$INSTDIR\Data\CEP"
  
  ;Store installation folder
  WriteRegStr HKCU "Software\ParaWorldCEP" "InstDir" $INSTDIR
  WriteRegStr HKCU "Software\ParaWorldCEP" "Version" $modversion
  CreateShortCut "$DESKTOP\ParaWorld CEP.lnk" "$INSTDIR\Data\CEP\CEPLauncher.exe" "" "$INSTDIR\Data\CEP\modicon.ico"
  CreateDirectory "$SMPROGRAMS\Sunflowers\ParaWorld\CEP"
  CreateShortCut "$SMPROGRAMS\Sunflowers\ParaWorld\Turn off SSS.lnk" "$INSTDIR\Tools\PWTool.exe SSSOff" "" "$INSTDIR\bin\PWServer.exe" 0
  CreateShortCut "$SMPROGRAMS\Sunflowers\ParaWorld\CEP\ParaWorld CEP.lnk" "$INSTDIR\Data\CEP\CEPLauncher.exe" "" "$INSTDIR\Data\CEP\modicon.ico"
  CreateShortCut "$SMPROGRAMS\Sunflowers\ParaWorld\CEP\View Readme.lnk" "$INSTDIR\Data\CEP\ReadMe.txt"
  CreateShortCut "$SMPROGRAMS\Sunflowers\ParaWorld\CEP\View Readme (SEASMOD).lnk" "$INSTDIR\Data\CEP\ReadMe SEASMOD.txt"
  CreateShortCut "$SMPROGRAMS\Sunflowers\ParaWorld\CEP\Developers.lnk" "$INSTDIR\Data\CEP\credits.txt"
  CopyFiles "$INSTDIR\Data\CEP\Check for Updates.url" "$SMPROGRAMS\Sunflowers\ParaWorld\CEP"

  SetOutPath "$INSTDIR\Tools"
  CreateShortCut "$SMPROGRAMS\Sunflowers\ParaWorld\PW Tool.lnk" "$INSTDIR\Tools\PWTool.exe" "" "$INSTDIR\Tools\PWTool.exe" 0
  
  ; Since the SDK is launched by the CEP Launcher, we don't need that anymore
  ;IfFileExists "$INSTDIR\Data\leveled\*.*" edy edn
  ;Goto edn
  ;edy:
  ;CreateShortCut "$DESKTOP\PW SDK CEP.lnk" "$INSTDIR\bin\CEPSDK.bat" "" "$INSTDIR\bin\Paraworld.exe" 0
  ;CreateShortCut "$SMPROGRAMS\Sunflowers\ParaWorld\CEP\PW SDK CEP.lnk" "$INSTDIR\bin\CEPSDK.bat" "" "$INSTDIR\bin\Paraworld.exe" 0
  ;CreateShortCut "$SMPROGRAMS\SEASMOD\PW SDK SM.lnk" "$INSTDIR\bin\PWClient.exe" "-leveled -enable SEASMOD" "$INSTDIR\bin\Paraworld.exe" 0
  ;CreateShortCut "$DESKTOP\PW SDK SM.lnk" "$INSTDIR\bin\PWClient.exe" "-leveled -enable SEASMOD" "$INSTDIR\bin\Paraworld.exe" 0
  ;edn:
  
  ;Create uninstaller
  SetOutPath "$INSTDIR"
  WriteUninstaller "$INSTDIR\Uninstall CEP.exe"
  CreateShortCut "$SMPROGRAMS\Sunflowers\ParaWorld\CEP\Uninstall CEP.lnk" "$INSTDIR\Uninstall CEP.exe" "" "$INSTDIR\Uninstall CEP.exe" 0

  MessageBox MB_OK "Now the installer will clear the cache and delete outdated files and maps. Don't panic, the next windows are harmless!"
  ExecWait "$INSTDIR\Tools\ClearCache.exe"
  ExecWait "$INSTDIR\Tools\PWCleaner.exe bin"
  ExecWait "$INSTDIR\Tools\PWCleaner.exe maps"
  MessageBox MB_OK "Perfect! Please note you should install the newest mappack if you haven't already. You can get it from www.para-welt.com!"
  Exec "notepad.exe $INSTDIR\Data\CEP\ReadMe.txt"

SectionEnd

Section "English (UK) files" SecSLangUk

  SectionIn 1 RO

  SetOutPath "$INSTDIR\Data\CEP"
  
  ;ADD YOUR OWN FILES HERE...
  File /r "files\uk_lang\"

  Call AfterLang

SectionEnd

Section "English (US) files" SecSLangUs

  SectionIn 2 RO

  SetOutPath "$INSTDIR\Data\CEP"
  
  ;ADD YOUR OWN FILES HERE...
  File /r "files\us_lang\"

  Call AfterLang

SectionEnd

Section "German files" SecSLangDe

  SectionIn 3 RO

  SetOutPath "$INSTDIR\Data\CEP"
  
  ;ADD YOUR OWN FILES HERE...
  File /r "files\de_lang\"

  Call AfterLang

SectionEnd

Section "Italian files" SecSLangIt

  SectionIn 4 RO

  SetOutPath "$INSTDIR\Data\CEP"
  
  ;ADD YOUR OWN FILES HERE...
  File /r "files\it_lang\"

  Call AfterLang

SectionEnd

Section "Polish files" SecSLangPl

  SectionIn 5 RO

  SetOutPath "$INSTDIR\Data\CEP"
  
  ;ADD YOUR OWN FILES HERE...
  File /r "files\pl_lang\"

  Call AfterLang

SectionEnd

Section "French files" SecSLangFr

  SectionIn 6 RO

  SetOutPath "$INSTDIR\Data\CEP"
  
  ;ADD YOUR OWN FILES HERE...
  File /r "files\fr_lang\"

  Call AfterLang

SectionEnd

Section "Spanish files" SecSLangEs

  SectionIn 7 RO

  SetOutPath "$INSTDIR\Data\CEP"
  
  ;ADD YOUR OWN FILES HERE...
  File /r "files\es_lang\"

  Call AfterLang

SectionEnd

Section "Russian files" SecSLangRu

  SectionIn 8 RO

  SetOutPath "$INSTDIR\Data\CEP"
  
  ;ADD YOUR OWN FILES HERE...
  File /r "files\ru_lang\"

  Call AfterLang

SectionEnd

Section "Hungarian files" SecSLangHu

  SectionIn 9 RO

  SetOutPath "$INSTDIR\Data\CEP"
  
  ;ADD YOUR OWN FILES HERE...
  File /r "files\hu_lang\"

  Call AfterLang

SectionEnd

;--------------------------------
;Descriptions

  ;Language strings
  LangString DESC_SecSBasic ${LANG_ENGLISH} "The basic game files, which are required for playing."
  LangString DESC_SecSLangUk ${LANG_ENGLISH} "Required to play with english (uk) language."
  LangString DESC_SecSLangUs ${LANG_ENGLISH} "Required to play with english (us) language."
  LangString DESC_SecSLangDe ${LANG_ENGLISH} "Required to play with german language."
  LangString DESC_SecSLangIt ${LANG_ENGLISH} "Required to play with italian language."
  LangString DESC_SecSLangPl ${LANG_ENGLISH} "Required to play with polish language."
  LangString DESC_SecSLangFr ${LANG_ENGLISH} "Required to play with french language."
  LangString DESC_SecSLangEs ${LANG_ENGLISH} "Required to play with spanish language."
  LangString DESC_SecSLangRu ${LANG_ENGLISH} "Required to play with russian language."
  LangString DESC_SecSLangHu ${LANG_ENGLISH} "Required to play with hungarian language."

  ;Assign language strings to sections
  !insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
    !insertmacro MUI_DESCRIPTION_TEXT ${SecSBasic} $(DESC_SecSBasic)
    !insertmacro MUI_DESCRIPTION_TEXT ${SecSLangUk} $(DESC_SecSLangUk)
    !insertmacro MUI_DESCRIPTION_TEXT ${SecSLangUs} $(DESC_SecSLangUs)
    !insertmacro MUI_DESCRIPTION_TEXT ${SecSLangDe} $(DESC_SecSLangDe)
    !insertmacro MUI_DESCRIPTION_TEXT ${SecSLangIt} $(DESC_SecSLangIt)
    !insertmacro MUI_DESCRIPTION_TEXT ${SecSLangPl} $(DESC_SecSLangPl)
    !insertmacro MUI_DESCRIPTION_TEXT ${SecSLangFr} $(DESC_SecSLangFr)
    !insertmacro MUI_DESCRIPTION_TEXT ${SecSLangEs} $(DESC_SecSLangEs)
    !insertmacro MUI_DESCRIPTION_TEXT ${SecSLangRu} $(DESC_SecSLangRu)
    !insertmacro MUI_DESCRIPTION_TEXT ${SecSLangHu} $(DESC_SecSLangHu)
  !insertmacro MUI_FUNCTION_DESCRIPTION_END

;--------------------------------
;Uninstaller Section

Section "Uninstall"

  ExecWait '"$INSTDIR\bin\mod_conf.exe" SSSOff "$APPDATA"'

  RMDir /r "$INSTDIR\Data\CEP"
  Delete "$INSTDIR\bin\CEP.bat"
  Delete "$INSTDIR\bin\CEPSDK.bat"
  Delete "$INSTDIR\Data\Info\CEP.info"
  Delete "$INSTDIR\Uninstall CEP.exe"
  Delete "$DESKTOP\ParaWorld CEP.lnk"
  Delete "$DESKTOP\PW SDK CEP.lnk"
  RMDir /r "$SMPROGRAMS\Sunflowers\ParaWorld\CEP"

  DeleteRegKey HKCU "Software\ParaWorldCEP"

SectionEnd