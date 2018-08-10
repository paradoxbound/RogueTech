; Inno Setup

#define isfiles "isfiles-unicode"
#define BTDirectory "D:\LadyAlekto\Mod\RogueTech"

#define AppVerJSON
#define FileHandle
#define FileLine
#sub ProcessFileLine
  #define FileLine = FileRead(FileHandle)
  #expr AppVerJSON = AppVerJSON + Str(FileLine)
#endsub
#for {FileHandle = FileOpen(BTDirectory + '/RogueTech Core/mod.json'); \
  FileHandle && !FileEof(FileHandle); ""} \
  ProcessFileLine
#if FileHandle
  #expr FileClose(FileHandle)
#endif

#define tmpStr Copy(AppVerJSON, Pos('"Version": "', AppVerJSON) + 12)
#define len (Pos('"', tmpStr) - 1)
#define RTVersion Copy(AppVerJSON, Pos('"Version": "', AppVerJSON) + 12, len)
#pragma message 'Version: ' + RTVersion
#undef tmpStr
#undef len

[Setup]
AppName=RogueTech
AppId=RogueTech mod (for BATTLETECH)
AppVersion={#RTVersion}
AppPublisher=Lady Alekto
AppPublisherURL=http://reddit.com/r/roguetech
AppSupportURL=http://reddit.com/r/roguetech
AppUpdatesURL=http://reddit.com/r/roguetech
AppMutex=mmon-BATTLETECH-BattleTech-exe-SingleInstanceMutex-Default,Global\mmon-BATTLETECH-BattleTech-exe-SingleInstanceMutex-Default
SetupMutex=RogueTechSetupMutex,Global\RogueTechSetupMutex
DefaultDirName={code:GetDefaultDir}
DisableProgramGroupPage=yes
AppendDefaultDirName=no
;DefaultGroupName=Inno Setup 5
AllowNoIcons=yes
Compression=lzma2/ultra
InternalCompressLevel=ultra
SolidCompression=yes
Uninstallable=yes
UninstallDisplayIcon={#BTDirectory}\RogueTechIcons\Battletech-RogueTech-B (2018).ico
;LicenseFile={#isfiles}\license.txt
WizardImageAlphaFormat=premultiplied
WizardImageFile={#SourcePath}\WizardImageLarge.bmp,{#SourcePath}\WizardImageLarge2.bmp
WizardSmallImageFile={#SourcePath}\WizardImageSmall.bmp,{#SourcePath}\WizardImageSmall2.bmp
SourceDir={#BTDirectory}
SetupIconFile={#BTDirectory}\RogueTechIcons\Battletech-RogueTech-D_2018.ico
DirExistsWarning=no
UsePreviousAppDir=no
UsePreviousTasks=no
DisableWelcomePage=no
OutputDir={#SourcePath}
OutputBaseFilename=RogueTechSetup-v{#RTVersion}
BackColor=clRed
BackColor2=clBlack

[Files]
;Source: "/RogueTech Core/RogueTech.txt"; DestDir: "{app}/Mods/RogueTech Core"; Flags: isreadme ignoreversion
Source: "/*"; Excludes: ".modtek,.git,log.txt,Log_Turbine.txt,RTsetup.iss,*.log,BattletechPerformanceFix,PirateMechs,RogueModuleElites,VanillaEnabler,MercDeployments,RandomTravelContracts,CommanderPortraitLoader,ArmorRepair,ArmorPoints,Pilot_Quirks,StabilePiloting,Pilot_Fatigue,MoreIsLess_dZ,RogueEmblems,All 3025 Mercs,Capellan Emblems,Replacement_MechPortraits,SkipIntro,RogueTanks,VehicleImprovementProject,Gausszilla,PowerArmour,Primitive,JK_VariantsCampaign,JK_VariantsSkirmish,Crabs,OnePointArmorStep,fastsavedelete,CamZoom,InnerSphereMap,WarTech,CrystalClear,ScorchedEarth,SkimishEquipmentUnlock" ; DestDir: "{app}/Mods"; Flags: recursesubdirs ignoreversion
Source: "{#SourcePath}Optionals\Battletech Sound Replacement Pack\*"; DestDir: "{app}"; Flags: recursesubdirs ignoreversion uninsneveruninstall; Components: gfx\soundmod
Source: "{#SourcePath}Optionals\Enable Debug\*"; DestDir: "{app}"; Flags: recursesubdirs ignoreversion uninsneveruninstall; Components: debugjson
Source: "{#SourcePath}Optionals\RogueGenerals\*"; DestDir: "{app}"; Flags: recursesubdirs ignoreversion uninsneveruninstall; Components: gametips
Source: "/CommanderPortraitLoader/*"; Excludes: "log.txt"; DestDir: "{app}/Mods/CommanderPortraitLoader"; Flags: recursesubdirs ignoreversion; Components: gfx\portraitloader;
Source: "/VanillaEnabler/*"; Excludes: "log.txt"; DestDir: "{app}/Mods/VanillaEnabler"; Flags: recursesubdirs ignoreversion; Components: map\VanillaEnabler;
Source: "/InnerSphereMap/*"; Excludes: "log.txt"; DestDir: "{app}/Mods/InnerSphereMap"; Flags: recursesubdirs ignoreversion; Components: map\wartech;
Source: "/WarTech/*"; Excludes: "log.txt"; DestDir: "{app}/Mods/WarTech"; Flags: recursesubdirs ignoreversion; Components: map\wartech;
Source: "/RandomTravelContracts/*"; Excludes: "log.txt"; DestDir: "{app}/Mods/RandomTravelContracts"; Flags: recursesubdirs ignoreversion; Components: map\wartech;
Source: "/MercDeployments/*"; Excludes: "log.txt"; DestDir: "{app}/Mods/MercDeployments"; Flags: recursesubdirs ignoreversion; Components: map\deployments;
Source: "/Pilot_Quirks/*"; Excludes: "log.txt"; DestDir: "{app}/Mods/Pilot_Quirks"; Flags: recursesubdirs ignoreversion; Components: dz\quirks;
Source: "/StabilePiloting/*"; Excludes: "log.txt"; DestDir: "{app}/Mods/StabilePiloting"; Flags: recursesubdirs ignoreversion; Components: dz\quirks;
Source: "/Pilot_Fatigue/*"; Excludes: "log.txt"; DestDir: "{app}/Mods/Pilot_Fatigue"; Flags: recursesubdirs ignoreversion; Components: dz\fatigue;
Source: "/MoreIsLess_dZ/*"; Excludes: "log.txt"; DestDir: "{app}/Mods/MoreIsLess_dZ"; Flags: recursesubdirs ignoreversion; Components: dz\moreisless;
Source: "/RogueEmblems/*"; Excludes: "log.txt"; DestDir: "{app}/Mods/RogueEmblems"; Flags: recursesubdirs ignoreversion; Components: emblems\rogueemblems;
Source: "/All 3025 Mercs/*"; Excludes: "log.txt"; DestDir: "{app}/Mods/All 3025 Mercs"; Flags: recursesubdirs ignoreversion; Components: emblems\mercemblems;
Source: "/Capellan Emblems/*"; Excludes: "log.txt"; DestDir: "{app}/Mods/Capellan Emblems"; Flags: recursesubdirs ignoreversion; Components: emblems\capellaemblems;
Source: "/RogueTanks/*"; Excludes: "log.txt"; DestDir: "{app}/Mods/RogueTanks"; Flags: recursesubdirs ignoreversion; Components: tech\tanks;
Source: "/VehicleImprovementProject/*"; Excludes: "log.txt"; DestDir: "{app}/Mods/VehicleImprovementProject"; Flags: recursesubdirs ignoreversion; Components: tech\tanks;
Source: "/Gausszilla/*"; Excludes: "log.txt"; DestDir: "{app}/Mods/Gausszilla"; Flags: recursesubdirs ignoreversion; Components: tech\gausszilla;
Source: "/PowerArmour/*"; Excludes: "log.txt"; DestDir: "{app}/Mods/PowerArmour"; Flags: recursesubdirs ignoreversion; Components: tech\powerarmour;
Source: "/Primitive/*"; Excludes: "log.txt"; DestDir: "{app}/Mods/Primitive"; Flags: recursesubdirs ignoreversion; Components: tech\primitive;
Source: "/PirateMechs/*"; Excludes: "log.txt"; DestDir: "{app}/Mods/PirateMechs"; Flags: recursesubdirs ignoreversion; Components: tech\pirates;
Source: "/RogueModuleElites/*"; Excludes: "log.txt"; DestDir: "{app}/Mods/RogueModuleElites"; Flags: recursesubdirs ignoreversion; Components: tech\elites;
Source: "/JK_VariantsCampaign/*"; Excludes: "log.txt"; DestDir: "{app}/Mods/JK_VariantsCampaign"; Flags: recursesubdirs ignoreversion; Components: tech\jkvariants;
Source: "/JK_VariantsSkirmish/*"; Excludes: "log.txt"; DestDir: "{app}/Mods/JK_VariantsSkirmish"; Flags: recursesubdirs ignoreversion; Components: tech\jkhero;
Source: "/Crabs/*"; Excludes: "log.txt"; DestDir: "{app}/Mods/Crabs"; Flags: recursesubdirs ignoreversion; Components: tech\crabs;
Source: "/SkipIntro/*"; Excludes: "log.txt"; DestDir: "{app}/Mods/SkipIntro"; Flags: recursesubdirs ignoreversion; Components: qol\skipintro;
Source: "/BattletechPerformanceFix/*"; Excludes: "log.txt"; DestDir: "{app}/Mods/BattletechPerformanceFix"; Flags: recursesubdirs ignoreversion; Components: qol\perfixer;
Source: "/OnePointArmorStep/*"; Excludes: "log.txt"; DestDir: "{app}/Mods/OnePointArmorStep"; Flags: recursesubdirs ignoreversion; Components: qol\onepointarmor;
Source: "/fastsavedelete/*"; Excludes: "log.txt"; DestDir: "{app}/Mods/fastsavedelete"; Flags: recursesubdirs ignoreversion; Components: qol\fastsavedelete;
Source: "/CamZoom/*"; Excludes: "log.txt"; DestDir: "{app}/Mods/CamZoom"; Flags: recursesubdirs ignoreversion; Components: qol\camzoom;
Source: "/SkimishEquipmentUnlock/*"; DestDir: "{app}/Mods/SkimishEquipmentUnlock"; Flags: ignoreversion; Components: qol\skirmishbay;
Source: "/CrystalClear/*"; Excludes: "log.txt"; DestDir: "{app}/Mods/CrystalClear"; Flags: recursesubdirs ignoreversion; Components: gfx\crystal;
Source: "/ScorchedEarth/*"; Excludes: "log.txt"; DestDir: "{app}/Mods/ScorchedEarth"; Flags: recursesubdirs ignoreversion; Components: gfx\scorched;
Source: "/Replacement_MechPortraits/*"; Excludes: "log.txt"; DestDir: "{app}/Mods/Replacement_MechPortraits"; Flags: recursesubdirs ignoreversion; Components: gfx\mechportraits;
Source: "/ArmorRepair/*"; Excludes: "log.txt"; DestDir: "{app}/Mods/ArmorRepair"; Flags: recursesubdirs ignoreversion; Components: repair\on;
Source: "/ArmorPoints/*"; DestDir: "{app}/Mods/ArmorPoints"; Flags: ignoreversion; Components: repair\off;
Source: "{#SourcePath}Optionals\BTML\0Harmony.dll"; DestDir: "{app}\BattleTech_Data\Managed\"; Flags: ignoreversion; Tasks: BTML
Source: "{#SourcePath}Optionals\BTML\BattleTechModLoader.dll"; DestDir: "{app}\BattleTech_Data\Managed\"; Flags: ignoreversion; Tasks: BTML
Source: "{#SourcePath}Optionals\BTML\BattleTechModLoaderInjector.exe"; DestDir: "{app}\BattleTech_Data\Managed\"; Flags: ignoreversion; Tasks: BTML


[Messages]
SetupAppRunningError=Setup has detected that another RT setup or BATTLETECH game is currently running.%n%nPlease close all instances of it now, then click OK to continue, or Cancel to exit.
BrowseDialogTitle=Select your BattleTech folder
SelectDirDesc=[name] needs your BattleTech folder
SelectDirBrowseLabel=To continue, click Next. It should be your BattleTech folder
NoUninstallWarning=Setup has detected that the following components are already installed on your computer:%n%n%1%n%nDeselecting these components will not uninstall them.%n%n You HAVE to remove Mods folder on next step!
WizardPreparing=Preparing for Drop, Brace yourself
WelcomeLabel1=Welcome to the [name] Setup, Commander

[Components]
Name: "map"; Description: "Map Type Selector"; Types: full custom compact; Flags: fixed dontinheritcheck
Name: "map\wartech"; Description: "Inner Sphere Sandbox Package"; Types: full compact; Flags: exclusive
Name: "map\VanillaEnabler"; Description: "Vanilla Campaign with RT-REQUIRES ALL UNITS!"; Types: custom; Flags: exclusive
Name: "map\deployments"; Description: "Deployments- replaces travel contracts"; Types: full compact
Name: "dz"; Description: "Pilot Mods"; Types: full compact;
Name: "dz\quirks"; Description: "Pilot Quirks"; Types: full compact;
Name: "dz\fatigue"; Description: "Pilot Fatigue"; Types: full compact;
Name: "dz\moreisless"; Description: "Reduced Pilot XP gain by Rank"; Types: full compact;
Name: "tech"; Description: "Additional Units"; Types: full compact;
Name: "tech\tanks"; Description: "Extra Tanks"; Types: full compact;
Name: "tech\crabs"; Description: "Crab Mech"; Types: full compact;
Name: "tech\gausszilla"; Description: "GaussZilla"; Types: full compact;
Name: "tech\powerarmour"; Description: "Powered Infantry"; Types: full compact;
Name: "tech\primitive"; Description: "Primitive Mechs"; Types: full compact;
Name: "tech\pirates"; Description: "Pirate Mechs"; Types: full compact;
Name: "tech\elites"; Description: "Elite Mechs"; Types: full compact;
Name: "tech\jkvariants"; Description: "JK Variants"; Types: full compact;
Name: "tech\jkhero"; Description: "JK Hero Variants"; Types: full compact;
Name: "qol"; Description: "Quality of Life Options"; Types: full compact custom;
Name: "qol\camzoom"; Description: "CamZoom mod"; Types: full compact;
Name: "qol\skirmishbay"; Description: "All Gear in Skirmish"; Types: full compact;
Name: "qol\onepointarmor"; Description: "Shift+Click to change armour by 1"; Types: full compact;
Name: "qol\fastsavedelete"; Description: "Delete Saves without Confirmation"; Types: full compact;
Name: "qol\perfixer"; Description: "Performance Fixer, improves UI performance"; Types: full compact;
Name: "qol\skipintro"; Description: "Skip Intro"; Types: full compact;
Name: "emblems"; Description: "Emblem Options"; Types: custom;
Name: "emblems\rogueemblems"; Description: "RogueTech Emblems"; Types: custom;
Name: "emblems\mercemblems"; Description: "3025 Mercenary Emblems"; Types: custom;
Name: "emblems\capellaemblems"; Description: "Capellan Emblems"; Types: custom;
Name: "gfx"; Description: "FX Options"; Types: custom;
Name: "gfx\portraitloader"; Description: "Commander Portrait Loader"; Types: full;
Name: "gfx\soundmod"; Description: "Battletech Sound Replacement Pack by Highwayleopard"; Types: full compact;
Name: "gfx\crystal"; Description: "Crystal Clear - Drastically reduce Postprocessing"; Types: custom;
Name: "gfx\scorched"; Description: "Scorched Earth - Leave more Craters "; Types: custom;
Name: "gfx\mechportraits"; Description: "Coloured Mech Portraits"; Types: custom;
Name: "gametips"; Description: "Loading Screen Texts for RogueTech"; Types: full compact;
Name: "debugjson"; Description: "Debug JSON. Improves debug logging in output_log.txt"; Types: custom;
Name: "repair"; Description: "Armor Repair Options"; Types: full custom compact; Flags: fixed dontinheritcheck
Name: "repair\on"; Description: "Repair Armor After Battle"; Types: full compact; Flags: exclusive 
Name: "repair\off"; Description: "FREE Repair Armor After Battle"; Types: custom; Flags: exclusive

[Types]
Name: "full"; Description: "Full installation";
Name: "compact"; Description: "Compact installation";
Name: "Custom"; Description: "Custom installation"; Flags: iscustom

[Tasks]
Name: "BTML"; Description: "Install BTML (Required for new install)";
Name: cleanup; Description: "Clean previous install"; GroupDescription: "Additional options:";
Name: cleanup\mods; Description: "Remove Mods folder (RECOMMENDED!)";
Name: cleanup\skirmish; Description: "Remove skirmish saves and game settings"; Flags: unchecked
Name: cleanup\WarTech; Description: "Remove WarTech saves"; Flags: unchecked
Name: cleanup\MercDeployments; Description: "Remove MercDeployments saves"; Flags: unchecked

[Run]
Filename: "https://www.nexusmods.com/battletech/mods/79?tab=articles"; Description: "Open NexusMods Articles. THOSE ARTICLES ARE THE MANUAL!"; Flags: postinstall nowait shellexec skipifsilent
;Filename: "{app}/BattleTech.exe"; Description: "Launch BATTLETECH"; Flags: postinstall skipifsilent unchecked
;Filename: "{app}/Mods/RogueTech Core/RogueTech.txt"; Description: "View the Changelog file"; Flags: postinstall nowait shellexec skipifsilent unchecked
Filename: "{app}\BattleTech_Data\Managed\BattleTechModLoaderInjector.exe"; Parameters: /restore /nokeypress; Tasks: BTML
Filename: "{app}\BattleTech_Data\Managed\BattleTechModLoaderInjector.exe"; Parameters: /nokeypress; Tasks: BTML

[UninstallRun]
Filename: "{app}\BattleTech_Data\Managed\BattleTechModLoaderInjector.exe"; Parameters: /restore /nokeypress

[InstallDelete]
Type: filesandordirs; Name: "{app}\Mods\.modtek"
Type: filesandordirs; Name: "{app}\Mods"; Tasks: cleanup\mods
Type: filesandordirs; Name: "{app}\ModSaves\MercDeployments"; Tasks: cleanup\MercDeployments
Type: filesandordirs; Name: "{app}\ModSaves\WarTech"; Tasks: cleanup\WarTech
Type: filesandordirs; Name: "{userappdata}\LocalLow\Harebrained Schemes\BATTLETECH\profiles.dat"; Tasks: cleanup\skirmish
Type: filesandordirs; Name: "{localappdata}\HarebrainedSchemes"; Tasks: cleanup\skirmish
Type: filesandordirs; Name: "{%TEMP|{localappdata}\Temp\Harebrained Schemes}"; Tasks: cleanup\skirmish
Type: filesandordirs; Name: "{reg:HKLM\SOFTWARE\WOW6432Node\Valve\Steam,InstallPath}\steamapps\shadercache\637090"; Tasks: cleanup\skirmish
Type: filesandordirs; Name: "{code:GetSteamUserDir}\637090\remote\C0\settings_cloud.sav"; Tasks: cleanup\skirmish
Type: filesandordirs; Name: "{localappdata}\gog.com\Applications\50593543263669699\storage\shared\files\c0\settings_cloud.sav"; Tasks: cleanup\skirmish

[UninstallDelete]
; delete cache
Type: filesandordirs; Name: "{app}\Mods\.modtek"

[Registry]
Root: HKCU; Subkey: "Software\Harebrained Schemes\BATTLETECH"; Flags: deletekey uninsdeletekey; Tasks: cleanup\skirmish

[Code]
procedure InitializeWizard;
begin
  ExpandConstant('{#SourcePath}');
end;

// detect gog or steam installation
function GetDefaultDir(def: string): string;
var
I : Integer;
P : Integer;
steamInstallPath : string;
gameInstallPath : string;
configFile : string;
fileLines: TArrayOfString;
begin
	steamInstallPath := 'not found';
	if RegQueryStringValue( HKEY_LOCAL_MACHINE, 'SOFTWARE\WOW6432Node\Valve\Steam', 'InstallPath', steamInstallPath ) then
	begin
	end;

	if FileExists(steamInstallPath + '\steamapps\common\BattleTech\BattleTech.exe') then
	begin
		Result := steamInstallPath + '\steamapps\common\BattleTech';
		Exit;
	end
	else
	begin
		configFile := steamInstallPath + '\config\config.vdf';
		if FileExists(configFile) then
		begin
			if LoadStringsFromFile(configFile, FileLines) then
			begin
				for I := 0 to GetArrayLength(FileLines) - 1 do
				begin
					P := Pos('BaseInstallFolder_', FileLines[I]);
					if P > 0 then
					begin
						steamInstallPath := Copy(FileLines[I], P + 23, Length(FileLines[i]) - P - 23);
						if FileExists(steamInstallPath + '\steamapps\common\BattleTech\BattleTech.exe') then
						begin
							Result := steamInstallPath + '\steamapps\common\BattleTech';
							Exit;
						end;
					end;
				end;
			end;
		end;
  end;
  
  gameInstallPath := 'not found';
  if RegQueryStringValue( HKEY_LOCAL_MACHINE, 'SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\1482783682_is1', 'InstallLocation', gameInstallPath ) then
  begin
    Result := gameInstallPath;
    Exit;
  end;
	
	Result := 'C:\BATTLETECH';
end;

// detect gog or steam installation
function GetSteamUserDir(def: string): string;
var
useriddword : Cardinal;
userid : string;
Names: TArrayOfString;
I: Integer;
S: String;
steamInstallPath : string;
begin
	if RegQueryDWordValue( HKEY_CURRENT_USER, 'SOFTWARE\Valve\Steam\ActiveProcess', 'ActiveUser', useriddword ) then
 	begin
		userid := IntToStr(useriddword);
 	end else
		begin
			if RegGetSubkeyNames(HKEY_CURRENT_USER, 'SOFTWARE\Valve\Steam\Users', Names) then
			begin
				S := '';
				for I := 0 to GetArrayLength(Names)-1 do
					S := Names[I];
				userid := S;
			end else
			begin
				userid := '0';
			end;
		end;
	
	RegQueryStringValue( HKEY_LOCAL_MACHINE, 'SOFTWARE\WOW6432Node\Valve\Steam', 'InstallPath', steamInstallPath )
	Result := steamInstallPath + '\userdata\' + userid;
end;
