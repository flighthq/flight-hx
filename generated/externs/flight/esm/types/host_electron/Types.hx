package flight.esm.types.host_electron;

#if (js && flight_esm)
typedef ElectronApi = { app:flight.esm.types.host_electron.Types.ElectronApp, clipboard:flight.esm.types.host_electron.Types.ElectronClipboard, fs:flight.esm.types.host_electron.Types.ElectronFs, shell:flight.esm.types.host_electron.Types.ElectronShell, dialog:flight.esm.types.host_electron.Types.ElectronDialog, globalShortcut:flight.esm.types.host_electron.Types.ElectronGlobalShortcut, screen:flight.esm.types.host_electron.Types.ElectronScreen, powerMonitor:flight.esm.types.host_electron.Types.ElectronPowerMonitor, powerSaveBlocker:flight.esm.types.host_electron.Types.ElectronPowerSaveBlocker, nativeImage:flight.esm.types.host_electron.Types.ElectronNativeImageModule, ipcMain:flight.esm.types.host_electron.Types.ElectronIpcMain, autoUpdater:flight.esm.types.host_electron.Types.ElectronAutoUpdater, BrowserWindow:flight.esm.types.host_electron.Types.ElectronBrowserWindowConstructor, Menu:flight.esm.types.host_electron.Types.ElectronMenuConstructor, Tray:flight.esm.types.host_electron.Types.ElectronTrayConstructor, Notification:flight.esm.types.host_electron.Types.ElectronNotificationConstructor };

typedef ElectronApp = { getName:(() -> String), getVersion:(() -> String), getLocale:(() -> String), getSystemLocale:(() -> String), getPreferredSystemLanguages:(() -> Array<String>), getAppPath:(() -> String), getPath:((name:String) -> String), setName:((name:String) -> Void), setAppUserModelId:((id:String) -> Void), setActivationPolicy:((policy:String) -> Void), hide:(() -> Void), show:(() -> Void), isHidden:(() -> Bool), addRecentDocument:((path:String) -> Void), clearRecentDocuments:(() -> Void), getLoginItemSettings:(() -> flight.esm.types.host_electron.Types.ElectronLoginItemSettings), setLoginItemSettings:((settings:flight.esm.types.host_electron.Types.ElectronLoginItemSettingsLike) -> Void), quit:(() -> Void), exit:((?code:Null<Float>) -> Void), relaunch:(() -> Void), focus:(() -> Void), requestSingleInstanceLock:(() -> Bool), hasSingleInstanceLock:(() -> Bool), releaseSingleInstanceLock:(() -> Void), setBadgeCount:((count:Float) -> Bool), setAsDefaultProtocolClient:((scheme:String) -> Bool), removeAsDefaultProtocolClient:((scheme:String) -> Bool), isDefaultProtocolClient:((scheme:String) -> Bool), on:((event:String, listener:Dynamic) -> Void), removeListener:((event:String, listener:Dynamic) -> Void), ?dock:Null<flight.esm.types.host_electron.Types.ElectronDock> };

typedef ElectronAppCapabilitiesFor<Profile> = { name:flight.esm.types.app.Types.HostAppNameCapability, version:flight.esm.types.app.Types.HostAppVersionCapability, quit:flight.esm.types.app.Types.HostAppQuitCapability, allWindowsClosed:flight.esm.types.app.Types.HostAppAllWindowsClosedCapability, focus:flight.esm.types.app.Types.HostAppFocusCapability, locale:flight.esm.types.app.Types.HostAppLocaleCapability, nameWrite:flight.esm.types.app.Types.HostAppNameWriteCapability, path:flight.esm.types.app.Types.HostAppPathCapability, quitRequest:flight.esm.types.app.Types.HostAppQuitRequestCapability, ready:flight.esm.types.app.Types.HostAppReadyCapability, relaunch:flight.esm.types.app.Types.HostAppRelaunchCapability, secondInstance:flight.esm.types.app.Types.HostAppSecondInstanceCapability, singleInstance:flight.esm.types.app.Types.HostAppSingleInstanceCapability };

typedef ElectronAutoUpdater = { setFeedURL:((options:Dynamic) -> Void), checkForUpdates:(() -> Void), quitAndInstall:(() -> Void), on:((event:String, listener:Dynamic) -> Void), removeListener:((event:String, listener:Dynamic) -> Void) };

typedef ElectronBrowserWindow = { id:Float, loadURL:((url:String) -> js.lib.Promise<Void>), loadFile:((filePath:String) -> js.lib.Promise<Void>), setTitle:((title:String) -> Void), getTitle:(() -> String), setPosition:((x:Float, y:Float) -> Void), setSize:((width:Float, height:Float) -> Void), getBounds:(() -> flight.esm.types.host_electron.Types.ElectronRectangle), setBounds:((bounds:Dynamic) -> Void), minimize:(() -> Void), maximize:(() -> Void), unmaximize:(() -> Void), restore:(() -> Void), isMinimized:(() -> Bool), isMaximized:(() -> Bool), focus:(() -> Void), show:(() -> Void), hide:(() -> Void), center:(() -> Void), setResizable:((resizable:Bool) -> Void), setAlwaysOnTop:((flag:Bool) -> Void), setMinimumSize:((width:Float, height:Float) -> Void), setMaximumSize:((width:Float, height:Float) -> Void), setFullScreen:((flag:Bool) -> Void), isFullScreen:(() -> Bool), setIcon:((icon:Dynamic) -> Void), setOpacity:((opacity:Float) -> Void), setProgressBar:((progress:Float) -> Void), flashFrame:((flag:Bool) -> Void), setContentProtection:((enable:Bool) -> Void), setHasShadow:((hasShadow:Bool) -> Void), setSkipTaskbar:((skip:Bool) -> Void), setMenuBarVisibility:((visible:Bool) -> Void), setParentWindow:((parent:Null<flight.esm.types.host_electron.Types.ElectronBrowserWindow>) -> Void), close:(() -> Void), destroy:(() -> Void), isDestroyed:(() -> Bool), on:((event:String, listener:Dynamic) -> Void), off:((event:String, listener:Dynamic) -> Void), removeAllListeners:((?event:Null<String>) -> Void) };

typedef ElectronBrowserWindowConstructor = { getAllWindows:(() -> Array<flight.esm.types.host_electron.Types.ElectronBrowserWindow>), fromId:((id:Float) -> Null<flight.esm.types.host_electron.Types.ElectronBrowserWindow>) };

typedef ElectronBrowserWindowOptions = { ?title:Null<String>, ?x:Null<Float>, ?y:Null<Float>, ?width:Null<Float>, ?height:Null<Float>, ?resizable:Null<Bool>, ?alwaysOnTop:Null<Bool>, ?fullscreen:Null<Bool>, ?show:Null<Bool>, ?minWidth:Null<Float>, ?minHeight:Null<Float>, ?maxWidth:Null<Float>, ?maxHeight:Null<Float>, ?frame:Null<Bool>, ?transparent:Null<Bool> };

typedef ElectronClipboard = { readText:(() -> String), writeText:((text:String) -> Void), readHTML:(() -> String), writeHTML:((markup:String) -> Void), readRTF:(() -> String), writeRTF:((text:String) -> Void), readBookmark:(() -> Dynamic), writeBookmark:((title:String, url:String) -> Void), readImage:(() -> flight.esm.types.host_electron.Types.ElectronNativeImage), writeImage:((image:flight.esm.types.host_electron.Types.ElectronNativeImage) -> Void), read:((format:String) -> String), write:((data:flight.esm.types.host_electron.Types.ElectronClipboardData) -> Void), has:((format:String) -> Bool), availableFormats:(() -> Array<String>), clear:(() -> Void) };

typedef ElectronClipboardData = { ?text:Null<String>, ?html:Null<String>, ?rtf:Null<String>, ?bookmark:Null<String>, ?image:Null<flight.esm.types.host_electron.Types.ElectronNativeImage> };

typedef ElectronCommonAppCapabilities = { name:flight.esm.types.app.Types.HostAppNameCapability, version:flight.esm.types.app.Types.HostAppVersionCapability, quit:flight.esm.types.app.Types.HostAppQuitCapability, allWindowsClosed:flight.esm.types.app.Types.HostAppAllWindowsClosedCapability, focus:flight.esm.types.app.Types.HostAppFocusCapability, locale:flight.esm.types.app.Types.HostAppLocaleCapability, nameWrite:flight.esm.types.app.Types.HostAppNameWriteCapability, path:flight.esm.types.app.Types.HostAppPathCapability, quitRequest:flight.esm.types.app.Types.HostAppQuitRequestCapability, ready:flight.esm.types.app.Types.HostAppReadyCapability, relaunch:flight.esm.types.app.Types.HostAppRelaunchCapability, secondInstance:flight.esm.types.app.Types.HostAppSecondInstanceCapability, singleInstance:flight.esm.types.app.Types.HostAppSingleInstanceCapability };

typedef ElectronDialog = { showOpenDialog:((window:Null<flight.esm.types.host_electron.Types.ElectronBrowserWindow>, options:flight.esm.types.host_electron.Types.ElectronOpenDialogOptions) -> js.lib.Promise<Dynamic>), showSaveDialog:((window:Null<flight.esm.types.host_electron.Types.ElectronBrowserWindow>, options:flight.esm.types.host_electron.Types.ElectronSaveDialogOptions) -> js.lib.Promise<Dynamic>), showMessageBox:((window:Null<flight.esm.types.host_electron.Types.ElectronBrowserWindow>, options:flight.esm.types.host_electron.Types.ElectronMessageBoxOptions) -> js.lib.Promise<Dynamic>) };

typedef ElectronDisplay = { id:Float, bounds:Dynamic, workArea:Dynamic, scaleFactor:Float, ?colorDepth:Null<Float>, ?colorSpace:Null<String>, ?displayFrequency:Null<Float>, ?internal:Null<Bool>, ?label:Null<String>, ?monochrome:Null<Bool>, ?rotation:Null<Float>, ?touchSupport:Null<String> };

typedef ElectronDock = { bounce:((?type:Null<String>) -> Float), cancelBounce:((id:Float) -> Void), setBadge:((text:String) -> Void), setMenu:((menu:flight.esm.types.host_electron.Types.ElectronMenu) -> Void) };

typedef ElectronFs = { existsSync:((path:String) -> Bool), readFileSync:((path:String, encoding:String) -> String), renameSync:((oldPath:String, newPath:String) -> Void), unlinkSync:((path:String) -> Void), writeFileSync:((path:String, data:String) -> Void) };

typedef ElectronGlobalShortcut = { register:((accelerator:String, callback_:Dynamic) -> Bool), unregister:((accelerator:String) -> Void), unregisterAll:(() -> Void), isRegistered:((accelerator:String) -> Bool) };

typedef ElectronHost<Profile> = Dynamic;

typedef ElectronHostOptions = { platform:flight.esm.types.tray.Types.DesktopOsProfile, ?storageFileName:Null<String>, ?updaterFeedUrl:Null<String> };

typedef ElectronIpcMain = { on:((channel:String, listener:Dynamic) -> Void), removeListener:((channel:String, listener:Dynamic) -> Void), handle:((channel:String, listener:Dynamic) -> Void), removeHandler:((channel:String) -> Void) };

typedef ElectronIpcRenderer = { invoke:Dynamic, send:Dynamic };

typedef ElectronIpcTarget = { send:Dynamic };

typedef ElectronLinuxAppCapabilities = { name:flight.esm.types.app.Types.HostAppNameCapability, version:flight.esm.types.app.Types.HostAppVersionCapability, quit:flight.esm.types.app.Types.HostAppQuitCapability, allWindowsClosed:flight.esm.types.app.Types.HostAppAllWindowsClosedCapability, focus:flight.esm.types.app.Types.HostAppFocusCapability, locale:flight.esm.types.app.Types.HostAppLocaleCapability, nameWrite:flight.esm.types.app.Types.HostAppNameWriteCapability, path:flight.esm.types.app.Types.HostAppPathCapability, quitRequest:flight.esm.types.app.Types.HostAppQuitRequestCapability, ready:flight.esm.types.app.Types.HostAppReadyCapability, relaunch:flight.esm.types.app.Types.HostAppRelaunchCapability, secondInstance:flight.esm.types.app.Types.HostAppSecondInstanceCapability, singleInstance:flight.esm.types.app.Types.HostAppSingleInstanceCapability, badge:flight.esm.types.app.Types.HostAppBadgeCapability };

typedef ElectronLoginItemSettings = { openAtLogin:Bool, openAsHidden:Bool, ?executableWillLaunchAtLogin:Null<Bool> };

typedef ElectronLoginItemSettingsLike = { ?openAtLogin:Null<Bool>, ?openAsHidden:Null<Bool>, ?path:Null<String>, ?args:Null<Array<String>> };

typedef ElectronMacosAppCapabilities = { name:flight.esm.types.app.Types.HostAppNameCapability, version:flight.esm.types.app.Types.HostAppVersionCapability, quit:flight.esm.types.app.Types.HostAppQuitCapability, allWindowsClosed:flight.esm.types.app.Types.HostAppAllWindowsClosedCapability, focus:flight.esm.types.app.Types.HostAppFocusCapability, locale:flight.esm.types.app.Types.HostAppLocaleCapability, nameWrite:flight.esm.types.app.Types.HostAppNameWriteCapability, path:flight.esm.types.app.Types.HostAppPathCapability, quitRequest:flight.esm.types.app.Types.HostAppQuitRequestCapability, ready:flight.esm.types.app.Types.HostAppReadyCapability, relaunch:flight.esm.types.app.Types.HostAppRelaunchCapability, secondInstance:flight.esm.types.app.Types.HostAppSecondInstanceCapability, singleInstance:flight.esm.types.app.Types.HostAppSingleInstanceCapability, hide:flight.esm.types.app.Types.HostAppHideCapability, activate:flight.esm.types.app.Types.HostAppActivateCapability, activationPolicy:flight.esm.types.app.Types.HostAppActivationPolicyCapability, badge:flight.esm.types.app.Types.HostAppBadgeCapability, dock:flight.esm.types.app.Types.HostAppDockCapability, loginItem:flight.esm.types.app.Types.HostAppLoginItemCapability, openFile:flight.esm.types.app.Types.HostAppOpenFileCapability, recentDocuments:flight.esm.types.app.Types.HostAppRecentDocumentsCapability, show:flight.esm.types.app.Types.HostAppShowCapability };

typedef ElectronMacosHost = Dynamic;

typedef ElectronMenu = { popup:((?options:Dynamic) -> Void) };

typedef ElectronMenuConstructor = { buildFromTemplate:((template:Array<flight.esm.types.host_electron.Types.ElectronMenuItemOptions>) -> flight.esm.types.host_electron.Types.ElectronMenu), setApplicationMenu:((menu:Null<flight.esm.types.host_electron.Types.ElectronMenu>) -> Void) };

typedef ElectronMenuItemOptions = { ?id:Null<String>, ?label:Null<String>, ?type:Null<String>, ?role:Null<String>, ?accelerator:Null<String>, ?enabled:Null<Bool>, ?checked:Null<Bool>, ?click:Null<(() -> Void)>, ?submenu:Null<Array<flight.esm.types.host_electron.Types.ElectronMenuItemOptions>> };

typedef ElectronMenuItemRole = String;

typedef ElectronMessageBoxOptions = { ?type:Null<String>, ?title:Null<String>, message:String, ?detail:Null<String>, ?buttons:Null<Array<String>>, ?defaultId:Null<Float>, ?cancelId:Null<Float>, ?signal:Null<js.html.AbortSignal>, ?checkboxLabel:Null<String>, ?checkboxChecked:Null<Bool> };

typedef ElectronNativeImage = { toDataURL:(() -> String), isEmpty:(() -> Bool), setTemplateImage:((isTemplate:Bool) -> Void) };

typedef ElectronNativeImageModule = { createFromDataURL:((dataUrl:String) -> flight.esm.types.host_electron.Types.ElectronNativeImage), createFromPath:((path:String) -> flight.esm.types.host_electron.Types.ElectronNativeImage) };

typedef ElectronNotification = { show:(() -> Void), close:(() -> Void), on:((event:String, listener:Dynamic) -> Void) };

typedef ElectronNotificationConstructor = { isSupported:(() -> Bool) };

typedef ElectronNotificationOptions = { title:String, ?body:Null<String>, ?icon:Null<String>, ?silent:Null<Bool>, ?actions:Null<Array<Dynamic>>, ?hasReply:Null<Bool> };

typedef ElectronOpenDialogOptions = { ?title:Null<String>, ?defaultPath:Null<String>, ?filters:Null<Array<Dynamic>>, ?properties:Null<Array<String>> };

typedef ElectronPowerMonitor = { on:((event:flight.esm.types.host_electron.Types.ElectronPowerMonitorEvent, listener:Dynamic) -> Void), removeListener:((event:flight.esm.types.host_electron.Types.ElectronPowerMonitorEvent, listener:Dynamic) -> Void), ?getCurrentThermalState:Null<(() -> String)>, getSystemIdleState:((idleThresholdSeconds:Float) -> String), getSystemIdleTime:(() -> Float), ?onBatteryPower:Null<Bool> };

typedef ElectronPowerMonitorEvent = String;

typedef ElectronPowerSaveBlocker = { start:((type:String) -> Float), stop:((id:Float) -> Void), isStarted:((id:Float) -> Bool) };

typedef ElectronProtocolCapabilities = { open:flight.esm.types.protocol_contract.Types.HostProtocolOpenCapability, registration:flight.esm.types.protocol_contract.Types.HostProtocolRegistrationCapability, registrationQuery:flight.esm.types.protocol_contract.Types.HostProtocolRegistrationQueryCapability, unregistration:flight.esm.types.protocol_contract.Types.HostProtocolUnregistrationCapability };

typedef ElectronRectangle = { x:Float, y:Float, width:Float, height:Float };

typedef ElectronSaveDialogOptions = { ?title:Null<String>, ?defaultPath:Null<String>, ?filters:Null<Array<Dynamic>> };

typedef ElectronScreen = { getPrimaryDisplay:(() -> flight.esm.types.host_electron.Types.ElectronDisplay), getAllDisplays:(() -> Array<flight.esm.types.host_electron.Types.ElectronDisplay>), getCursorScreenPoint:(() -> Dynamic), on:((event:String, listener:Dynamic) -> Void), removeListener:((event:String, listener:Dynamic) -> Void) };

typedef ElectronShell = { openExternal:((url:String) -> js.lib.Promise<Void>), openPath:((path:String) -> js.lib.Promise<String>), showItemInFolder:((path:String) -> Void), trashItem:((path:String) -> js.lib.Promise<Void>), beep:(() -> Void), readShortcutLink:((shortcutPath:String) -> flight.esm.types.host_electron.Types.ElectronShortcutDetails), writeShortcutLink:((shortcutPath:String, operation:String, options:flight.esm.types.host_electron.Types.ElectronShortcutDetails) -> Bool) };

typedef ElectronShortcutDetails = { target:String, ?appUserModelId:Null<String>, ?args:Null<String>, ?description:Null<String>, ?icon:Null<String>, ?iconIndex:Null<Float>, ?cwd:Null<String> };

typedef ElectronTray = { setToolTip:((tooltip:String) -> Void), setTitle:((title:String) -> Void), setImage:((image:Dynamic) -> Void), setPressedImage:((image:Dynamic) -> Void), setContextMenu:((menu:Null<flight.esm.types.host_electron.Types.ElectronMenu>) -> Void), popUpContextMenu:((?menu:Null<flight.esm.types.host_electron.Types.ElectronMenu>, ?position:Dynamic) -> Void), setIgnoreDoubleClickEvents:((ignore:Bool) -> Void), displayBalloon:((options:flight.esm.types.host_electron.Types.ElectronTrayBalloonOptions) -> Void), removeBalloon:(() -> Void), getBounds:(() -> flight.esm.types.host_electron.Types.ElectronRectangle), isDestroyed:(() -> Bool), on:((event:String, listener:Dynamic) -> Void), removeListener:((event:String, listener:Dynamic) -> Void), destroy:(() -> Void) };

typedef ElectronTrayBalloonOptions = { ?icon:Dynamic, ?iconType:Null<String>, title:String, content:String, ?largeIcon:Null<Bool>, ?noSound:Null<Bool>, ?respectQuietTime:Null<Bool> };

typedef ElectronTrayCapabilitiesFor<Profile> = { image:flight.esm.types.tray.Types.HostTrayImageCapability, menu:flight.esm.types.tray.Types.HostTrayMenuCapability, lifecycle:flight.esm.types.tray.Types.HostTrayLifecycleCapability, bounds:flight.esm.types.tray.Types.HostTrayBoundsCapability, interactionEvents:flight.esm.types.tray.Types.HostTrayInteractionEventsCapability, menuSelectionEvents:flight.esm.types.tray.Types.HostTrayMenuSelectionEventsCapability, popupMenu:flight.esm.types.tray.Types.HostTrayPopupMenuCapability, tooltip:flight.esm.types.tray.Types.HostTrayTooltipCapability };

typedef ElectronTrayConstructor = Dynamic;

typedef ElectronWindowsAppCapabilities = { name:flight.esm.types.app.Types.HostAppNameCapability, version:flight.esm.types.app.Types.HostAppVersionCapability, quit:flight.esm.types.app.Types.HostAppQuitCapability, allWindowsClosed:flight.esm.types.app.Types.HostAppAllWindowsClosedCapability, focus:flight.esm.types.app.Types.HostAppFocusCapability, locale:flight.esm.types.app.Types.HostAppLocaleCapability, nameWrite:flight.esm.types.app.Types.HostAppNameWriteCapability, path:flight.esm.types.app.Types.HostAppPathCapability, quitRequest:flight.esm.types.app.Types.HostAppQuitRequestCapability, ready:flight.esm.types.app.Types.HostAppReadyCapability, relaunch:flight.esm.types.app.Types.HostAppRelaunchCapability, secondInstance:flight.esm.types.app.Types.HostAppSecondInstanceCapability, singleInstance:flight.esm.types.app.Types.HostAppSingleInstanceCapability, loginItem:flight.esm.types.app.Types.HostAppLoginItemCapability, recentDocuments:flight.esm.types.app.Types.HostAppRecentDocumentsCapability, userModelId:flight.esm.types.app.Types.HostAppUserModelIdCapability };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
