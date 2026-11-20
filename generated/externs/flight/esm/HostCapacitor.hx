package flight.esm;

#if (js && flight_esm)
@:jsRequire("@flighthq/host-capacitor")
extern class HostCapacitor {
  public static function capacitorHost<Profile>(capacitor:flight.esm.types.host_capacitor.Types.CapacitorApi, profile:Profile):flight.esm.types.host_capacitor.Types.CapacitorHost<Profile>;
  public static function capacitorHostAccessibility():flight.esm.types.host_contract.Types.HostAccessibilityCapabilities;
  @:overload(function(capacitor:flight.esm.types.host_capacitor.Types.CapacitorApi, profile:String):flight.esm.types.host_capacitor.Types.CapacitorAndroidAppCapabilities {})
  @:overload(function(capacitor:flight.esm.types.host_capacitor.Types.CapacitorApi, profile:String):Dynamic {})
  @:overload(function(capacitor:flight.esm.types.host_capacitor.Types.CapacitorApi, profile:flight.esm.types.app.Types.MobileOsProfile):Dynamic {})
  public static function capacitorHostApp<Profile>(capacitor:flight.esm.types.host_capacitor.Types.CapacitorApi, profile:Profile):flight.esm.types.host_capacitor.Types.CapacitorAppCapabilitiesFor<Profile>;
  public static function capacitorHostAppActivate(capacitor:flight.esm.types.host_capacitor.Types.CapacitorApi):flight.esm.types.app.Types.HostAppActivateCapability;
  public static function capacitorHostAppHide(capacitor:flight.esm.types.host_capacitor.Types.CapacitorApi):flight.esm.types.app.Types.HostAppHideCapability;
  public static function capacitorHostAppName(capacitor:flight.esm.types.host_capacitor.Types.CapacitorApi):flight.esm.types.app.Types.HostAppNameCapability;
  public static function capacitorHostAppQuit(capacitor:flight.esm.types.host_capacitor.Types.CapacitorApi):flight.esm.types.app.Types.HostAppQuitCapability;
  public static function capacitorHostAppVersion(capacitor:flight.esm.types.host_capacitor.Types.CapacitorApi):flight.esm.types.app.Types.HostAppVersionCapability;
  public static function capacitorHostAudio():flight.esm.types.media_contract.Types.HostAudioCapabilities;
  public static function capacitorHostAudioDecode():flight.esm.types.audio.Types.HostAudioDecodeCapabilities;
  public static function capacitorHostBitmap():flight.esm.types.host_contract.Types.HostBitmapCapabilities;
  public static function capacitorHostCanvas():flight.esm.types.surface.Types.HostCanvasCapabilities;
  public static function capacitorHostClipboard(capacitor:flight.esm.types.host_capacitor.Types.CapacitorApi):{ ?bookmark:Null<flight.esm.types.clipboard.Types.HostClipboardBookmarkCapability>, ?change:Null<flight.esm.types.clipboard.Types.HostClipboardChangeCapability>, ?formats:Null<flight.esm.types.clipboard.Types.HostClipboardFormatsCapability>, image:flight.esm.types.clipboard.Types.HostClipboardImageCapability, text:flight.esm.types.clipboard.Types.HostClipboardTextCapability };
  public static function capacitorHostClipboardImage(capacitor:flight.esm.types.host_capacitor.Types.CapacitorApi):flight.esm.types.clipboard.Types.HostClipboardImageCapability;
  public static function capacitorHostClipboardText(capacitor:flight.esm.types.host_capacitor.Types.CapacitorApi):flight.esm.types.clipboard.Types.HostClipboardTextCapability;
  public static function capacitorHostCompress():flight.esm.types.host_contract.Types.HostCompressCapabilities;
  public static function capacitorHostConnectivity(capacitor:flight.esm.types.host_capacitor.Types.CapacitorApi):{ change:flight.esm.types.connectivity_contract.Types.HostConnectivityChangeCapability, ?reachability:Null<flight.esm.types.connectivity_contract.Types.HostConnectivityReachabilityCapability>, status:flight.esm.types.connectivity_contract.Types.HostConnectivityStatusCapability };
  public static function capacitorHostConnectivityChange(capacitor:flight.esm.types.host_capacitor.Types.CapacitorApi):flight.esm.types.connectivity_contract.Types.HostConnectivityChangeCapability;
  public static function capacitorHostConnectivityStatus(capacitor:flight.esm.types.host_capacitor.Types.CapacitorApi):flight.esm.types.connectivity_contract.Types.HostConnectivityStatusCapability;
  public static function capacitorHostDecompress():flight.esm.types.host_contract.Types.HostDecompressCapabilities;
  public static function capacitorHostDevice(capacitor:flight.esm.types.host_capacitor.Types.CapacitorApi):flight.esm.types.device.Types.HostDeviceCapability;
  public static function capacitorHostDeviceGroup(capacitor:flight.esm.types.host_capacitor.Types.CapacitorApi):Dynamic;
  public static function capacitorHostDialog(capacitor:flight.esm.types.host_capacitor.Types.CapacitorApi):{ ?directoryOpen:Null<flight.esm.types.dialog_contract.Types.HostDirectoryOpenDialogCapability>, ?fileOpen:Null<flight.esm.types.dialog_contract.Types.HostFileOpenDialogCapability>, ?fileSave:Null<flight.esm.types.dialog_contract.Types.HostFileSaveDialogCapability>, ?imageOpen:Null<flight.esm.types.dialog_contract.Types.HostImageOpenDialogCapability>, message:flight.esm.types.dialog_contract.Types.HostMessageDialogCapability, ?photoCapture:Null<flight.esm.types.dialog_contract.Types.HostPhotoCaptureDialogCapability>, prompt:flight.esm.types.dialog_contract.Types.HostPromptDialogCapability, ?videoCapture:Null<flight.esm.types.dialog_contract.Types.HostVideoCaptureDialogCapability> };
  public static function capacitorHostFileSystem(capacitor:flight.esm.types.host_capacitor.Types.CapacitorApi):flight.esm.types.filesystem_contract.Types.HostFileSystemCapability;
  public static function capacitorHostFileSystemGroup(capacitor:flight.esm.types.host_capacitor.Types.CapacitorApi):Dynamic;
  public static function capacitorHostFont():flight.esm.types.host_contract.Types.HostFontCapabilities;
  public static function capacitorHostFullscreen():flight.esm.types.app.Types.HostFullscreenCapabilities;
  public static function capacitorHostGeolocation(capacitor:flight.esm.types.host_capacitor.Types.CapacitorApi):flight.esm.types.geolocation_contract.Types.HostGeolocationCapability;
  public static function capacitorHostGeolocationGroup(capacitor:flight.esm.types.host_capacitor.Types.CapacitorApi):Dynamic;
  public static function capacitorHostGl():flight.esm.types.render_gl.Types.HostGlCapabilities;
  public static function capacitorHostGlyph():flight.esm.types.host_contract.Types.HostGlyphCapabilities;
  public static function capacitorHostHaptics(capacitor:flight.esm.types.host_capacitor.Types.CapacitorApi):flight.esm.types.haptics.Types.HostHapticsCapability;
  public static function capacitorHostHapticsGroup(capacitor:flight.esm.types.host_capacitor.Types.CapacitorApi):Dynamic;
  public static function capacitorHostImage():flight.esm.types.host_contract.Types.HostImageCapabilities;
  public static function capacitorHostImageDecode():flight.esm.types.image_codec_contract.Types.HostImageDecodeCapabilities;
  public static function capacitorHostImageEncode():flight.esm.types.image_codec_contract.Types.HostImageEncodeCapabilities;
  public static function capacitorHostInput():flight.esm.types.input.Types.HostInputCapabilities;
  public static function capacitorHostIpc():flight.esm.types.ipc.Types.HostIpcCapabilities;
  public static function capacitorHostLifecycle():flight.esm.types.lifecycle.Types.HostLifecycleCapabilities;
  public static function capacitorHostMediaSession():flight.esm.types.mediasession.Types.HostMediaSessionCapabilities;
  public static function capacitorHostMenu():flight.esm.types.menu.Types.HostMenuCapabilities;
  public static function capacitorHostMessageDialog(capacitor:flight.esm.types.host_capacitor.Types.CapacitorApi):flight.esm.types.dialog_contract.Types.HostMessageDialogCapability;
  public static function capacitorHostMidi():flight.esm.types.host_contract.Types.HostMidiCapabilities;
  public static function capacitorHostNet():flight.esm.types.net.Types.HostNetCapabilities;
  public static function capacitorHostNotification(capacitor:flight.esm.types.host_capacitor.Types.CapacitorApi):Dynamic;
  public static function capacitorHostNotificationAction(capacitor:flight.esm.types.host_capacitor.Types.CapacitorApi):flight.esm.types.notification_contract.Types.HostNotificationActionCapability;
  public static function capacitorHostNotificationClick(capacitor:flight.esm.types.host_capacitor.Types.CapacitorApi):flight.esm.types.notification_contract.Types.HostNotificationClickCapability;
  public static function capacitorHostNotificationDelivery(capacitor:flight.esm.types.host_capacitor.Types.CapacitorApi):flight.esm.types.notification_contract.Types.HostNotificationDeliveryCapability;
  public static function capacitorHostNotificationLifecycle(capacitor:flight.esm.types.host_capacitor.Types.CapacitorApi):flight.esm.types.notification_contract.Types.HostNotificationLifecycleCapability;
  public static function capacitorHostNotificationPermission(capacitor:flight.esm.types.host_capacitor.Types.CapacitorApi):flight.esm.types.notification_contract.Types.HostNotificationPermissionCapability;
  public static function capacitorHostNotificationScheduling(capacitor:flight.esm.types.host_capacitor.Types.CapacitorApi):flight.esm.types.notification_contract.Types.HostNotificationSchedulingCapability;
  public static function capacitorHostPermissions():flight.esm.types.host_contract.Types.HostPermissionsCapabilities;
  public static function capacitorHostPlatform():flight.esm.types.platform.Types.HostPlatformCapabilities;
  public static function capacitorHostPower():flight.esm.types.power.Types.HostPowerCapabilities;
  public static function capacitorHostPreferences():flight.esm.types.preferences_contract.Types.HostPreferencesCapabilities;
  public static function capacitorHostPromptDialog(capacitor:flight.esm.types.host_capacitor.Types.CapacitorApi):flight.esm.types.dialog_contract.Types.HostPromptDialogCapability;
  public static function capacitorHostProtocol(capacitor:flight.esm.types.host_capacitor.Types.CapacitorApi):Dynamic;
  public static function capacitorHostProtocolOpen(capacitor:flight.esm.types.host_capacitor.Types.CapacitorApi):flight.esm.types.protocol_contract.Types.HostProtocolOpenCapability;
  public static function capacitorHostScreen():flight.esm.types.screen.Types.HostScreenCapabilities;
  public static function capacitorHostSensors():flight.esm.types.sensors.Types.HostSensorsCapabilities;
  public static function capacitorHostShare(capacitor:flight.esm.types.host_capacitor.Types.CapacitorApi):{ content:Dynamic, ?files:Null<flight.esm.types.share_contract.Types.HostShareFilesCapability> };
  public static function capacitorHostShareContent(capacitor:flight.esm.types.host_capacitor.Types.CapacitorApi):flight.esm.types.share_contract.Types.HostCapacitorShareContentCapability;
  public static function capacitorHostShell():flight.esm.types.shell.Types.HostShellCapabilities;
  public static function capacitorHostShortcut():flight.esm.types.shortcut.Types.HostShortcutCapabilities;
  public static function capacitorHostSocket():flight.esm.types.socket.Types.HostSocketCapabilities;
  public static function capacitorHostSoftKeyboardAccessoryBar(capacitor:flight.esm.types.host_capacitor.Types.CapacitorApi):flight.esm.types.keyboard_contract.Types.HostSoftKeyboardAccessoryBarCapability;
  public static function capacitorHostSoftKeyboardChange(capacitor:flight.esm.types.host_capacitor.Types.CapacitorApi):flight.esm.types.keyboard_contract.Types.HostSoftKeyboardChangeCapability;
  public static function capacitorHostSoftKeyboardGroup(capacitor:flight.esm.types.host_capacitor.Types.CapacitorApi):Dynamic;
  public static function capacitorHostSoftKeyboardInfo(capacitor:flight.esm.types.host_capacitor.Types.CapacitorApi):flight.esm.types.keyboard_contract.Types.HostSoftKeyboardInfoCapability;
  public static function capacitorHostSoftKeyboardResizeModeWrite(capacitor:flight.esm.types.host_capacitor.Types.CapacitorApi):flight.esm.types.keyboard_contract.Types.HostSoftKeyboardResizeModeWriteCapability;
  public static function capacitorHostSoftKeyboardScrollAssist(capacitor:flight.esm.types.host_capacitor.Types.CapacitorApi):flight.esm.types.keyboard_contract.Types.HostSoftKeyboardScrollAssistCapability;
  public static function capacitorHostSoftKeyboardStyle(capacitor:flight.esm.types.host_capacitor.Types.CapacitorApi):flight.esm.types.keyboard_contract.Types.HostSoftKeyboardStyleCapability;
  public static function capacitorHostSoftKeyboardVisibility(capacitor:flight.esm.types.host_capacitor.Types.CapacitorApi):flight.esm.types.keyboard_contract.Types.HostSoftKeyboardVisibilityCapability;
  public static function capacitorHostStatusBarColor(capacitor:flight.esm.types.host_capacitor.Types.CapacitorApi):flight.esm.types.statusbar.Types.HostStatusBarColorCapability;
  public static function capacitorHostStatusBarGroup(capacitor:flight.esm.types.host_capacitor.Types.CapacitorApi):Dynamic;
  public static function capacitorHostStatusBarInfo(capacitor:flight.esm.types.host_capacitor.Types.CapacitorApi):flight.esm.types.statusbar.Types.HostStatusBarInfoCapability;
  public static function capacitorHostStatusBarOverlays(capacitor:flight.esm.types.host_capacitor.Types.CapacitorApi):flight.esm.types.statusbar.Types.HostStatusBarOverlaysCapability;
  public static function capacitorHostStatusBarStyle(capacitor:flight.esm.types.host_capacitor.Types.CapacitorApi):flight.esm.types.statusbar.Types.HostStatusBarStyleCapability;
  public static function capacitorHostStatusBarVisibility(capacitor:flight.esm.types.host_capacitor.Types.CapacitorApi):flight.esm.types.statusbar.Types.HostStatusBarVisibilityCapability;
  public static function capacitorHostSurface():flight.esm.types.surface.Types.HostSurfaceCapabilities;
  public static function capacitorHostTextSegment():flight.esm.types.host_contract.Types.HostTextSegmentCapabilities;
  public static function capacitorHostTextShaper():flight.esm.types.textshaper.Types.HostTextShaperCapabilities;
  public static function capacitorHostTray():flight.esm.types.tray.Types.HostTrayCapabilities;
  public static function capacitorHostUpdater():flight.esm.types.host_contract.Types.HostUpdaterCapabilities;
  public static function capacitorHostVideo():flight.esm.types.video.Types.HostVideoCapabilities;
  public static function capacitorHostWgpu():flight.esm.types.render_wgpu_contract.Types.HostWgpuCapabilities;
  public static function capacitorHostWindow():flight.esm.types.app.Types.HostWindowCapabilities;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
