;NSIS Modern User Interface
;Basic Example Script
;Written by Joost Verburg

;--------------------------------
;Include Modern UI

  !include "MUI2.nsh"

;--------------------------------
;General

  ;Name and file
  Name "ParaWorld BasicSEAS 1.0.0"
    !insertmacro MUI_DEFAULT MUI_ICON "icon.ico"
  OutFile "paraworld_basicseas.exe"

Function .onInit
   ReadRegStr $INSTDIR HKLM "SOFTWARE\Sunflowers\ParaWorld" "InstallDir"
   IfErrors nopw
   Goto nopwend
   nopw:
   MessageBox MB_OK|MB_ICONEXCLAMATION "The installer could not detect an installation of ParaWorld. You have to set the ParaWorld-path yourself."
   StrCpy $INSTDIR "[insert ParaWorld directory here]"
   nopwend:
   ClearErrors
FunctionEnd


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
  !insertmacro MUI_PAGE_DIRECTORY
  !insertmacro MUI_PAGE_INSTFILES
  
;--------------------------------
;Languages
 
  !insertmacro MUI_LANGUAGE "English"

;--------------------------------
;Installer Sections


Section "BasicSEAS files" SecSBasic

  SectionIn RO

  SetOutPath "$INSTDIR"

  ;ADD YOUR OWN FILES HERE...
  File /r "data\"

  ; --->>>
  ; For the shortcuts!
  SetOutPath "$INSTDIR\bin"
  ; <<<---
  CreateShortCut "$DESKTOP\PW BasicSEAS.lnk" "$INSTDIR\bin\Paraworld.exe" "-enable BasicSEAS" "$INSTDIR\bin\Paraworld.exe" 0

  Exec "$INSTDIR\Tools\ClearCache.exe"
  Exec "notepad.exe $INSTDIR\Data\BasicSEAS\Readme.txt"

SectionEnd
