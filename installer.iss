; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Internet Friendly Media Encoder"
#define MyAppVersion "5.1.13.0"
#define MyAppPublisher "Anime4000"
#define MyAppURL "https://x265.github.io/"
#define MyAppExeName "ifme.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{90310E77-D70E-4A63-8A25-BD4C38F0F9B5}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
ArchitecturesInstallIn64BitMode=x64  

SourceDir=build
LicenseFile=..\license.txt
InfoBeforeFile=..\patents.txt
InfoAfterFile=..\changelog.txt

Compression=lzma2/ultra64
SolidCompression=yes

SetupIconFile=..\installer\image_unboxing.ico
WizardImageFile=..\installer\image_banner.bmp
WizardSmallImageFile=..\installer\image_small.bmp

OutputDir=..\
OutputBaseFilename=ifme-{#MyAppVersion}-x86x64_windows

Uninstallable=not IsTaskSelected('portablemode')

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "japanese"; MessagesFile: "compiler:Languages\Japanese.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: checkedonce
Name: portablemode; Description: "Portable Mode"; Flags: unchecked 

[Dirs]
Name: "{app}"; Permissions: everyone-full

[Files]
Source: "*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs

Source: "..\prerequisite\windows\32bit\7za.exe"; DestDir: "{app}"; Flags: ignoreversion; Check: not Is64BitInstallMode
Source: "..\prerequisite\windows\32bit\MediaInfo.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: not Is64BitInstallMode

Source: "..\prerequisite\windows\64bit\7za.exe"; DestDir: "{app}"; Flags: ignoreversion; Check: Is64BitInstallMode
Source: "..\prerequisite\windows\64bit\MediaInfo.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: Is64BitInstallMode

Source: "..\prerequisite\windows\32bit\plugins\avisynth\*"; DestDir: "{app}\plugins\avisynth"; Flags: ignoreversion
Source: "..\prerequisite\windows\32bit\plugins\faac\*"; DestDir: "{app}\plugins\faac"; Flags: ignoreversion
Source: "..\prerequisite\windows\32bit\plugins\mp4fpsmod\*"; DestDir: "{app}\plugins\mp4fpsmod"; Flags: ignoreversion
Source: "..\prerequisite\windows\32bit\plugins\opus\*"; DestDir: "{app}\plugins\opus"; Flags: ignoreversion

Source: "..\prerequisite\windows\32bit\plugins\ffmpeg\*"; DestDir: "{app}\plugins\ffmpeg"; Flags: ignoreversion; Check: not Is64BitInstallMode
Source: "..\prerequisite\windows\32bit\plugins\ffmsindex\*"; DestDir: "{app}\plugins\ffmsindex"; Flags: ignoreversion; Check: not Is64BitInstallMode
Source: "..\prerequisite\windows\32bit\plugins\flac\*"; DestDir: "{app}\plugins\flac"; Flags: ignoreversion; Check: not Is64BitInstallMode
Source: "..\prerequisite\windows\32bit\plugins\mkvtool\*"; DestDir: "{app}\plugins\mkvtool"; Flags: ignoreversion; Check: not Is64BitInstallMode
Source: "..\prerequisite\windows\32bit\plugins\mp4box\*"; DestDir: "{app}\plugins\mp4box"; Flags: ignoreversion; Check: not Is64BitInstallMode
Source: "..\prerequisite\windows\32bit\plugins\ogg\*"; DestDir: "{app}\plugins\ogg"; Flags: ignoreversion; Check: not Is64BitInstallMode
Source: "..\prerequisite\windows\32bit\plugins\x265msvc\*"; DestDir: "{app}\plugins\x265msvc"; Flags: ignoreversion; Check: not Is64BitInstallMode

Source: "..\prerequisite\windows\64bit\plugins\ffmpeg\*"; DestDir: "{app}\plugins\ffmpeg"; Flags: ignoreversion; Check: Is64BitInstallMode
Source: "..\prerequisite\windows\64bit\plugins\ffmsindex\*"; DestDir: "{app}\plugins\ffmsindex"; Flags: ignoreversion; Check: Is64BitInstallMode
Source: "..\prerequisite\windows\64bit\plugins\flac\*"; DestDir: "{app}\plugins\flac"; Flags: ignoreversion; Check: Is64BitInstallMode
Source: "..\prerequisite\windows\64bit\plugins\mkvtool\*"; DestDir: "{app}\plugins\mkvtool"; Flags: ignoreversion; Check: Is64BitInstallMode
Source: "..\prerequisite\windows\64bit\plugins\mp4box\*"; DestDir: "{app}\plugins\mp4box"; Flags: ignoreversion; Check: Is64BitInstallMode
Source: "..\prerequisite\windows\64bit\plugins\ogg\*"; DestDir: "{app}\plugins\ogg"; Flags: ignoreversion; Check: Is64BitInstallMode
Source: "..\prerequisite\windows\64bit\plugins\x265gcc\*"; DestDir: "{app}\plugins\x265gcc"; Flags: ignoreversion; Check: Is64BitInstallMode
Source: "..\prerequisite\windows\64bit\plugins\x265icc\*"; DestDir: "{app}\plugins\x265icc"; Flags: ignoreversion; Check: Is64BitInstallMode
Source: "..\prerequisite\windows\64bit\plugins\x265msvc\*"; DestDir: "{app}\plugins\x265msvc"; Flags: ignoreversion; Check: Is64BitInstallMode
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; WorkingDir: "{app}"; Comment: "Open a powerful x265 GUI Encoder"; Tasks: desktopicon
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; WorkingDir: "{app}"; Comment: "x265 GUI Encoder with Internet Friendly Media Encoder!"
Name: "{group}\{cm:ProgramOnTheWeb,{#MyAppName}}"; Filename: "{#MyAppURL}"; Comment: "Visit Internet Friendly Media Encoder!"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"; Comment: "Remove Internet Friendly Media Encoder, but please :( try contact me, I'll try to fix!"

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

[Code]
function IsDotNetDetected(version: string; service: cardinal): boolean;
// Indicates whether the specified version and service pack of the .NET Framework is installed.
//
// version -- Specify one of these strings for the required .NET Framework version:
//    'v1.1'          .NET Framework 1.1
//    'v2.0'          .NET Framework 2.0
//    'v3.0'          .NET Framework 3.0
//    'v3.5'          .NET Framework 3.5
//    'v4\Client'     .NET Framework 4.0 Client Profile
//    'v4\Full'       .NET Framework 4.0 Full Installation
//    'v4.5'          .NET Framework 4.5
//    'v4.5.1'        .NET Framework 4.5.1
//    'v4.5.2'        .NET Framework 4.5.2
//    'v4.6'          .NET Framework 4.6
//
// service -- Specify any non-negative integer for the required service pack level:
//    0               No service packs required
//    1, 2, etc.      Service pack 1, 2, etc. required
var
    key, versionKey: string;
    install, release, serviceCount, versionRelease: cardinal;
    success: boolean;
begin
    versionKey := version;
    versionRelease := 0;

    // .NET 1.1 and 2.0 embed release number in version key
    if version = 'v1.1' then begin
        versionKey := 'v1.1.4322';
    end else if version = 'v2.0' then begin
        versionKey := 'v2.0.50727';
    end

    // .NET 4.5 and newer install as update to .NET 4.0 Full
    else if Pos('v4.', version) = 1 then begin
        versionKey := 'v4\Full';
        case version of
          'v4.5':   versionRelease := 378389;
          'v4.5.1': versionRelease := 378675; // or 378758 on Windows 8 and older
          'v4.5.2': versionRelease := 379893;
          'v4.6':   versionRelease := 393295; // or 393297 on Windows 8.1 and older
        end;
    end;

    // installation key group for all .NET versions
    key := 'SOFTWARE\Microsoft\NET Framework Setup\NDP\' + versionKey;

    // .NET 3.0 uses value InstallSuccess in subkey Setup
    if Pos('v3.0', version) = 1 then begin
        success := RegQueryDWordValue(HKLM, key + '\Setup', 'InstallSuccess', install);
    end else begin
        success := RegQueryDWordValue(HKLM, key, 'Install', install);
    end;

    // .NET 4.0 and newer use value Servicing instead of SP
    if Pos('v4', version) = 1 then begin
        success := success and RegQueryDWordValue(HKLM, key, 'Servicing', serviceCount);
    end else begin
        success := success and RegQueryDWordValue(HKLM, key, 'SP', serviceCount);
    end;

    // .NET 4.5 and newer use additional value Release
    if versionRelease > 0 then begin
        success := success and RegQueryDWordValue(HKLM, key, 'Release', release);
        success := success and (release >= versionRelease);
    end;

    result := success and (install = 1) and (serviceCount >= service);
end;


function InitializeSetup(): Boolean;
begin
    if not IsDotNetDetected('v4\Full', 0) then begin
        MsgBox('IFME requires Microsoft .NET Framework 4.0 Full.'#13#13
            'Please use Windows Update to install this version,'#13
            'and then re-run the IFME setup program.', mbInformation, MB_OK);
        result := false;
    end else
        result := true;
end;