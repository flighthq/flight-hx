package flight.esm.types.host_capacitor;

#if (js && flight_esm)
typedef CapacitorAndroidAppCapabilities = { name:flight.esm.types.app.Types.HostAppNameCapability, activate:flight.esm.types.app.Types.HostAppActivateCapability, version:flight.esm.types.app.Types.HostAppVersionCapability, hide:flight.esm.types.app.Types.HostAppHideCapability, quit:flight.esm.types.app.Types.HostAppQuitCapability };

typedef CapacitorApi = { app:flight.esm.types.host_capacitor.Types.CapacitorAppPlugin, clipboard:flight.esm.types.host_capacitor.Types.CapacitorClipboardPlugin, device:flight.esm.types.host_capacitor.Types.CapacitorDevicePlugin, dialog:flight.esm.types.host_capacitor.Types.CapacitorDialogPlugin, filesystem:flight.esm.types.host_capacitor.Types.CapacitorFilesystemPlugin, geolocation:flight.esm.types.host_capacitor.Types.CapacitorGeolocationPlugin, haptics:flight.esm.types.host_capacitor.Types.CapacitorHapticsPlugin, keyboard:flight.esm.types.host_capacitor.Types.CapacitorKeyboardPlugin, localNotifications:flight.esm.types.host_capacitor.Types.CapacitorLocalNotificationsPlugin, network:flight.esm.types.host_capacitor.Types.CapacitorNetworkPlugin, share:flight.esm.types.host_capacitor.Types.CapacitorSharePlugin, statusBar:flight.esm.types.host_capacitor.Types.CapacitorStatusBarPlugin };

typedef CapacitorAppCapabilitiesFor<Profile> = { name:flight.esm.types.app.Types.HostAppNameCapability, activate:flight.esm.types.app.Types.HostAppActivateCapability, version:flight.esm.types.app.Types.HostAppVersionCapability };

typedef CapacitorAppInfo = { build:String, id:String, name:String, version:String };

typedef CapacitorAppPlugin = { addListener:Dynamic, exitApp:(() -> js.lib.Promise<Void>), getInfo:(() -> js.lib.Promise<flight.esm.types.host_capacitor.Types.CapacitorAppInfo>), minimizeApp:(() -> js.lib.Promise<Void>) };

typedef CapacitorClipboardPlugin = { read:(() -> js.lib.Promise<flight.esm.types.host_capacitor.Types.CapacitorClipboardReadResult>), write:((options:flight.esm.types.host_capacitor.Types.CapacitorClipboardWriteOptions) -> js.lib.Promise<Void>) };

typedef CapacitorClipboardReadResult = { type:String, value:String };

typedef CapacitorClipboardWriteOptions = { ?image:Null<String>, ?label:Null<String>, ?string:Null<String>, ?url:Null<String> };

typedef CapacitorCommonAppCapabilities = { name:flight.esm.types.app.Types.HostAppNameCapability, activate:flight.esm.types.app.Types.HostAppActivateCapability, version:flight.esm.types.app.Types.HostAppVersionCapability };

typedef CapacitorConnectionStatus = { connected:Bool, connectionType:String };

typedef CapacitorDeviceId = { identifier:String };

typedef CapacitorDeviceInfo = { isVirtual:Bool, manufacturer:String, model:String, ?name:Null<String>, operatingSystem:String, osVersion:String, platform:String, webViewVersion:String };

typedef CapacitorDevicePlugin = { getId:(() -> js.lib.Promise<flight.esm.types.host_capacitor.Types.CapacitorDeviceId>), getInfo:(() -> js.lib.Promise<flight.esm.types.host_capacitor.Types.CapacitorDeviceInfo>) };

typedef CapacitorDialogAlertOptions = { ?buttonTitle:Null<String>, message:String, ?title:Null<String> };

typedef CapacitorDialogConfirmOptions = { ?cancelButtonTitle:Null<String>, message:String, ?okButtonTitle:Null<String>, ?title:Null<String> };

typedef CapacitorDialogConfirmResult = { value:Bool };

typedef CapacitorDialogPlugin = { alert:((options:flight.esm.types.host_capacitor.Types.CapacitorDialogAlertOptions) -> js.lib.Promise<Void>), confirm:((options:flight.esm.types.host_capacitor.Types.CapacitorDialogConfirmOptions) -> js.lib.Promise<flight.esm.types.host_capacitor.Types.CapacitorDialogConfirmResult>), prompt:((options:flight.esm.types.host_capacitor.Types.CapacitorDialogPromptOptions) -> js.lib.Promise<flight.esm.types.host_capacitor.Types.CapacitorDialogPromptResult>) };

typedef CapacitorDialogPromptOptions = { ?cancelButtonTitle:Null<String>, ?inputPlaceholder:Null<String>, ?inputText:Null<String>, message:String, ?okButtonTitle:Null<String>, ?title:Null<String> };

typedef CapacitorDialogPromptResult = { cancelled:Bool, value:String };

typedef CapacitorFileInfo = { ?ctime:Null<Float>, mtime:Float, name:String, size:Float, type:String, uri:String };

typedef CapacitorFilesystemCopyOptions = { from:String, to:String };

typedef CapacitorFilesystemMkdirOptions = { path:String, ?recursive:Null<Bool> };

typedef CapacitorFilesystemPathOptions = { path:String };

typedef CapacitorFilesystemPlugin = { appendFile:((options:flight.esm.types.host_capacitor.Types.CapacitorFilesystemWriteOptions) -> js.lib.Promise<Void>), copy:((options:flight.esm.types.host_capacitor.Types.CapacitorFilesystemCopyOptions) -> js.lib.Promise<Dynamic>), deleteFile:((options:flight.esm.types.host_capacitor.Types.CapacitorFilesystemPathOptions) -> js.lib.Promise<Void>), mkdir:((options:flight.esm.types.host_capacitor.Types.CapacitorFilesystemMkdirOptions) -> js.lib.Promise<Void>), readFile:((options:flight.esm.types.host_capacitor.Types.CapacitorFilesystemReadOptions) -> js.lib.Promise<flight.esm.types.host_capacitor.Types.CapacitorFilesystemReadResult>), readdir:((options:flight.esm.types.host_capacitor.Types.CapacitorFilesystemPathOptions) -> js.lib.Promise<flight.esm.types.host_capacitor.Types.CapacitorFilesystemReaddirResult>), rename:((options:flight.esm.types.host_capacitor.Types.CapacitorFilesystemCopyOptions) -> js.lib.Promise<Void>), rmdir:((options:flight.esm.types.host_capacitor.Types.CapacitorFilesystemRmdirOptions) -> js.lib.Promise<Void>), stat:((options:flight.esm.types.host_capacitor.Types.CapacitorFilesystemPathOptions) -> js.lib.Promise<flight.esm.types.host_capacitor.Types.CapacitorFilesystemStatResult>), writeFile:((options:flight.esm.types.host_capacitor.Types.CapacitorFilesystemWriteOptions) -> js.lib.Promise<flight.esm.types.host_capacitor.Types.CapacitorFilesystemWriteResult>) };

typedef CapacitorFilesystemReadOptions = { ?encoding:Null<String>, path:String };

typedef CapacitorFilesystemReadResult = { data:Dynamic };

typedef CapacitorFilesystemReaddirResult = { files:Array<flight.esm.types.host_capacitor.Types.CapacitorFileInfo> };

typedef CapacitorFilesystemRmdirOptions = { path:String, ?recursive:Null<Bool> };

typedef CapacitorFilesystemStatResult = { ?ctime:Null<Float>, mtime:Float, size:Float, type:String, uri:String };

typedef CapacitorFilesystemWriteOptions = { data:String, ?encoding:Null<String>, path:String, ?recursive:Null<Bool> };

typedef CapacitorFilesystemWriteResult = { uri:String };

typedef CapacitorGeolocationOptions = { ?enableHighAccuracy:Null<Bool>, ?maximumAge:Null<Float>, ?timeout:Null<Float> };

typedef CapacitorGeolocationPermissionOptions = { ?permissions:Null<Array<String>> };

typedef CapacitorGeolocationPermissionStatus = { ?coarseLocation:Null<String>, location:String };

typedef CapacitorGeolocationPlugin = { checkPermissions:(() -> js.lib.Promise<flight.esm.types.host_capacitor.Types.CapacitorGeolocationPermissionStatus>), clearWatch:((options:Dynamic) -> js.lib.Promise<Void>), getCurrentPosition:((?options:Null<flight.esm.types.host_capacitor.Types.CapacitorGeolocationOptions>) -> js.lib.Promise<flight.esm.types.host_capacitor.Types.CapacitorPosition>), requestPermissions:((?options:Null<flight.esm.types.host_capacitor.Types.CapacitorGeolocationPermissionOptions>) -> js.lib.Promise<flight.esm.types.host_capacitor.Types.CapacitorGeolocationPermissionStatus>), watchPosition:((options:flight.esm.types.host_capacitor.Types.CapacitorGeolocationOptions, callback_:Dynamic) -> js.lib.Promise<String>) };

typedef CapacitorHapticsPlugin = { impact:((options:Dynamic) -> js.lib.Promise<Void>), notification:((options:Dynamic) -> js.lib.Promise<Void>), selectionChanged:(() -> js.lib.Promise<Void>), selectionEnd:(() -> js.lib.Promise<Void>), selectionStart:(() -> js.lib.Promise<Void>), vibrate:((options:Dynamic) -> js.lib.Promise<Void>) };

typedef CapacitorHost<Profile> = { accessibility:flight.esm.types.host_contract.Types.HostAccessibilityCapabilities, app:flight.esm.types.host_capacitor.Types.CapacitorAppCapabilitiesFor<Profile>, audio:flight.esm.types.media_contract.Types.HostAudioCapabilities, audioDecode:flight.esm.types.audio.Types.HostAudioDecodeCapabilities, bitmap:flight.esm.types.host_contract.Types.HostBitmapCapabilities, canvas:flight.esm.types.surface.Types.HostCanvasCapabilities, clipboard:{ ?bookmark:Null<flight.esm.types.clipboard.Types.HostClipboardBookmarkCapability>, ?change:Null<flight.esm.types.clipboard.Types.HostClipboardChangeCapability>, ?formats:Null<flight.esm.types.clipboard.Types.HostClipboardFormatsCapability>, image:flight.esm.types.clipboard.Types.HostClipboardImageCapability, text:flight.esm.types.clipboard.Types.HostClipboardTextCapability }, compress:flight.esm.types.host_contract.Types.HostCompressCapabilities, connectivity:{ change:flight.esm.types.connectivity_contract.Types.HostConnectivityChangeCapability, ?reachability:Null<flight.esm.types.connectivity_contract.Types.HostConnectivityReachabilityCapability>, status:flight.esm.types.connectivity_contract.Types.HostConnectivityStatusCapability }, decompress:flight.esm.types.host_contract.Types.HostDecompressCapabilities, device:{ info:flight.esm.types.device.Types.HostDeviceCapability }, dialog:{ ?directoryOpen:Null<flight.esm.types.dialog_contract.Types.HostDirectoryOpenDialogCapability>, ?fileOpen:Null<flight.esm.types.dialog_contract.Types.HostFileOpenDialogCapability>, ?fileSave:Null<flight.esm.types.dialog_contract.Types.HostFileSaveDialogCapability>, ?imageOpen:Null<flight.esm.types.dialog_contract.Types.HostImageOpenDialogCapability>, message:flight.esm.types.dialog_contract.Types.HostMessageDialogCapability, ?photoCapture:Null<flight.esm.types.dialog_contract.Types.HostPhotoCaptureDialogCapability>, prompt:flight.esm.types.dialog_contract.Types.HostPromptDialogCapability, ?videoCapture:Null<flight.esm.types.dialog_contract.Types.HostVideoCaptureDialogCapability> }, fileSystem:{ access:flight.esm.types.filesystem_contract.Types.HostFileSystemCapability }, font:flight.esm.types.host_contract.Types.HostFontCapabilities, fullscreen:flight.esm.types.app.Types.HostFullscreenCapabilities, geolocation:{ position:flight.esm.types.geolocation_contract.Types.HostGeolocationCapability }, gl:flight.esm.types.render_gl.Types.HostGlCapabilities, glyph:flight.esm.types.host_contract.Types.HostGlyphCapabilities, haptics:{ engine:flight.esm.types.haptics.Types.HostHapticsCapability }, image:flight.esm.types.host_contract.Types.HostImageCapabilities, imageDecode:flight.esm.types.image_codec_contract.Types.HostImageDecodeCapabilities, imageEncode:flight.esm.types.image_codec_contract.Types.HostImageEncodeCapabilities, input:flight.esm.types.input.Types.HostInputCapabilities, ipc:flight.esm.types.ipc.Types.HostIpcCapabilities, lifecycle:flight.esm.types.lifecycle.Types.HostLifecycleCapabilities, mediaSession:flight.esm.types.mediasession.Types.HostMediaSessionCapabilities, menu:flight.esm.types.menu.Types.HostMenuCapabilities, midi:flight.esm.types.host_contract.Types.HostMidiCapabilities, net:flight.esm.types.net.Types.HostNetCapabilities, notification:Dynamic, permissions:flight.esm.types.host_contract.Types.HostPermissionsCapabilities, platform:flight.esm.types.platform.Types.HostPlatformCapabilities, power:flight.esm.types.power.Types.HostPowerCapabilities, preferences:flight.esm.types.preferences_contract.Types.HostPreferencesCapabilities, protocol:{ open:flight.esm.types.protocol_contract.Types.HostProtocolOpenCapability }, screen:flight.esm.types.screen.Types.HostScreenCapabilities, sensors:flight.esm.types.sensors.Types.HostSensorsCapabilities, share:{ content:Dynamic, ?files:Null<flight.esm.types.share_contract.Types.HostShareFilesCapability> }, shell:flight.esm.types.shell.Types.HostShellCapabilities, shortcut:flight.esm.types.shortcut.Types.HostShortcutCapabilities, socket:flight.esm.types.socket.Types.HostSocketCapabilities, softKeyboard:{ info:flight.esm.types.keyboard_contract.Types.HostSoftKeyboardInfoCapability, style:flight.esm.types.keyboard_contract.Types.HostSoftKeyboardStyleCapability, change:flight.esm.types.keyboard_contract.Types.HostSoftKeyboardChangeCapability, accessoryBar:flight.esm.types.keyboard_contract.Types.HostSoftKeyboardAccessoryBarCapability, resizeModeWrite:flight.esm.types.keyboard_contract.Types.HostSoftKeyboardResizeModeWriteCapability, scrollAssist:flight.esm.types.keyboard_contract.Types.HostSoftKeyboardScrollAssistCapability, visibility:flight.esm.types.keyboard_contract.Types.HostSoftKeyboardVisibilityCapability }, statusBar:{ color:flight.esm.types.statusbar.Types.HostStatusBarColorCapability, info:flight.esm.types.statusbar.Types.HostStatusBarInfoCapability, style:flight.esm.types.statusbar.Types.HostStatusBarStyleCapability, visibility:flight.esm.types.statusbar.Types.HostStatusBarVisibilityCapability, overlays:flight.esm.types.statusbar.Types.HostStatusBarOverlaysCapability }, surface:flight.esm.types.surface.Types.HostSurfaceCapabilities, textSegment:flight.esm.types.host_contract.Types.HostTextSegmentCapabilities, textShaper:flight.esm.types.textshaper.Types.HostTextShaperCapabilities, tray:flight.esm.types.tray.Types.HostTrayCapabilities, updater:flight.esm.types.host_contract.Types.HostUpdaterCapabilities, video:flight.esm.types.video.Types.HostVideoCapabilities, wgpu:flight.esm.types.render_wgpu_contract.Types.HostWgpuCapabilities, window:flight.esm.types.app.Types.HostWindowCapabilities };

typedef CapacitorKeyboardPlugin = { addListener:Dynamic, hide:(() -> js.lib.Promise<Void>), setAccessoryBarVisible:((options:Dynamic) -> js.lib.Promise<Void>), setResizeMode:((options:Dynamic) -> js.lib.Promise<Void>), setScroll:((options:Dynamic) -> js.lib.Promise<Void>), setStyle:((options:Dynamic) -> js.lib.Promise<Void>), show:(() -> js.lib.Promise<Void>) };

typedef CapacitorLocalNotificationAction = { actionId:String, notification:Dynamic };

typedef CapacitorLocalNotificationSchema = { ?body:Null<String>, id:Float, ?schedule:Dynamic, title:String };

typedef CapacitorLocalNotificationsPending = { notifications:Array<flight.esm.types.host_capacitor.Types.CapacitorLocalNotificationSchema> };

typedef CapacitorLocalNotificationsPermission = { display:String };

typedef CapacitorLocalNotificationsPlugin = { addListener:((eventName:String, listener:Dynamic) -> js.lib.Promise<flight.esm.types.host_capacitor.Types.CapacitorPluginListenerHandle>), cancel:((options:Dynamic) -> js.lib.Promise<Void>), checkPermissions:(() -> js.lib.Promise<flight.esm.types.host_capacitor.Types.CapacitorLocalNotificationsPermission>), getPending:(() -> js.lib.Promise<flight.esm.types.host_capacitor.Types.CapacitorLocalNotificationsPending>), requestPermissions:(() -> js.lib.Promise<flight.esm.types.host_capacitor.Types.CapacitorLocalNotificationsPermission>), schedule:((options:Dynamic) -> js.lib.Promise<flight.esm.types.host_capacitor.Types.CapacitorLocalNotificationsScheduleResult>) };

typedef CapacitorLocalNotificationsScheduleResult = { notifications:Array<Dynamic> };

typedef CapacitorNetworkPlugin = { addListener:((eventName:String, listener:Dynamic) -> js.lib.Promise<flight.esm.types.host_capacitor.Types.CapacitorPluginListenerHandle>), getStatus:(() -> js.lib.Promise<flight.esm.types.host_capacitor.Types.CapacitorConnectionStatus>) };

typedef CapacitorPluginListenerHandle = { remove:(() -> js.lib.Promise<Void>) };

typedef CapacitorPosition = { coords:flight.esm.types.host_capacitor.Types.CapacitorPositionCoords, timestamp:Float };

typedef CapacitorPositionCoords = { accuracy:Float, altitude:Null<Float>, altitudeAccuracy:Null<Float>, heading:Null<Float>, latitude:Float, longitude:Float, speed:Null<Float> };

typedef CapacitorProtocolCapabilities = { open:flight.esm.types.protocol_contract.Types.HostProtocolOpenCapability };

typedef CapacitorShareOptions = { ?dialogTitle:Null<String>, ?files:Null<Array<String>>, ?text:Null<String>, ?title:Null<String>, ?url:Null<String> };

typedef CapacitorSharePlugin = { share:((options:flight.esm.types.host_capacitor.Types.CapacitorShareOptions) -> js.lib.Promise<flight.esm.types.host_capacitor.Types.CapacitorShareResult>) };

typedef CapacitorShareResult = { ?activityType:Null<String> };

typedef CapacitorStatusBarInfoResult = { ?color:Null<String>, ?overlays:Null<Bool>, style:String, visible:Bool };

typedef CapacitorStatusBarPlugin = { getInfo:(() -> js.lib.Promise<flight.esm.types.host_capacitor.Types.CapacitorStatusBarInfoResult>), hide:(() -> js.lib.Promise<Void>), setBackgroundColor:((options:Dynamic) -> js.lib.Promise<Void>), setOverlaysWebView:((options:Dynamic) -> js.lib.Promise<Void>), setStyle:((options:Dynamic) -> js.lib.Promise<Void>), show:(() -> js.lib.Promise<Void>) };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
