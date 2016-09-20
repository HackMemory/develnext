; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "DevelNext"
#define MyAppVersion "2016 rc-1"
#define MyAppPublisher "develnext.org"
#define MyAppURL "http://develnext.org"
#define MyAppExeName "DevelNext.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{CA74A9B0-AFDA-4D34-8CA1-5F2122F71ABF}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName=DevelNext IDE
OutputDir=../build/distributions/
OutputBaseFilename=DevelNextSetup
Compression=lzma
SolidCompression=no
WizardImageFile=wizardImage.bmp
ChangesAssociations=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked; OnlyBelowVersion: 0,6.1

[Files]
Source: "../build/install/develnext/DevelNext.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "../build/install/develnext/*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[InstallDelete]
Type: files; Name: "{app}/lib/*"

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\{cm:ProgramOnTheWeb,{#MyAppName}}"; Filename: "{#MyAppURL}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: quicklaunchicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

[Registry]
Root: HKCR; Subkey: "develnext"; ValueType: "string"; ValueData: "URL:DevelNext Protocol"; Flags: uninsdeletekey
Root: HKCR; Subkey: "develnext"; ValueType: "string"; ValueName: "URL Protocol"; ValueData: ""
Root: HKCR; Subkey: "develnext\DefaultIcon"; ValueType: "string"; ValueData: "{app}\DevelNext.exe,0"
Root: HKCR; Subkey: "develnext\shell\open\command"; ValueType: "string"; ValueData: """{app}\DevelNext.exe"" ""%1"""

; Ext assoc:
Root: HKCR; Subkey: ".dnproject"; ValueData: "DevelNext"; Flags: uninsdeletevalue; ValueType: string;  ValueName: ""
Root: HKCR; Subkey: "{#MyAppName}"; ValueData: "DevelNext Project"; Flags: uninsdeletekey; ValueType: string;  ValueName: ""
Root: HKCR; Subkey: "{#MyAppName}\DefaultIcon"; ValueData: "{app}\projectExtension.ico"; ValueType: string;  ValueName: ""
Root: HKCR; Subkey: "{#MyAppName}\shell\open\command"; ValueData: """{app}\{#MyAppExeName}"" ""%1"""; ValueType: string;  ValueName: ""



