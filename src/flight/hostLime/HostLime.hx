package flight.hostLime;

#if lime
import flight._App.installAppHostBackend;
import flight._Application.installLoopHostBackend;
import flight._Clipboard.installClipboardHostBackend;
import flight._Dialog.installDialogHostBackend;
import flight._Haptics.installHapticsHostBackend;
import flight._Lifecycle.installLifecycleHostBackend;
import flight._Platform.installPlatformHostBackend;
import flight._Screen.installScreenHostBackend;
#if sys
import flight._FileSystem.installFileSystemHostBackend;
import flight._Storage.installStorageHostBackend;
#end
import haxe.ds.ObjectMap;
import lime.app.Application;

/** Installs Lime-owned Flight capability backends with host-layer precedence. */
class HostLime {
  static final installations = new ObjectMap<Application, LimeInstallation>();

  /**
   * Enables every capability HostLime can implement honestly.
   *
   * Call this once the first Lime window exists (normally from
   * `onWindowCreate`). Repeating it for the same application is idempotent.
   * Networking and audio are intentionally separate: Flight networking does
   * not yet expose a host-layer installation seam, while audio is a per-context
   * service created with `LimeAudio.createLimeAudioContext()`.
   */
  public static function enableHostLime(application:Application):Void {
    enableHostLimeApp(application);
    enableHostLimeClipboard(application);
    enableHostLimeDialog(application);
    enableHostLimeHaptics(application);
    enableHostLimeLifecycle(application);
    enableHostLimeLoop(application);
    enableHostLimePlatform(application);
    enableHostLimeScreen(application);
    #if sys
    enableHostLimeFileSystem(application);
    enableHostLimeStorage(application);
    #end
  }

  public static function enableHostLimeApp(application:Application):Void {
    final installation = forApplication(application);
    if (installation.app == null) installation.app = LimeApp.createLimeAppBackend(application);
    installAppHostBackend(installation.app);
  }

  public static function enableHostLimeClipboard(application:Application):Void {
    final installation = forApplication(application);
    if (installation.clipboard == null) installation.clipboard = LimeClipboard.createLimeClipboardBackend();
    installClipboardHostBackend(installation.clipboard);
  }

  /** Returns false when called before Lime has created a window. */
  public static function enableHostLimeDialog(application:Application):Bool {
    final window = application.window;
    if (window == null) return false;
    final installation = forApplication(application);
    if (installation.dialog == null) installation.dialog = LimeDialog.createLimeApplicationDialogBackend(application);
    installDialogHostBackend(installation.dialog);
    return true;
  }

  public static function enableHostLimeHaptics(application:Application):Void {
    final installation = forApplication(application);
    if (installation.haptics == null) installation.haptics = LimeHaptics.createLimeHapticsBackend();
    installHapticsHostBackend(installation.haptics);
  }

  public static function enableHostLimeLifecycle(application:Application):Void {
    final installation = forApplication(application);
    if (installation.lifecycle == null) installation.lifecycle = LimeLifecycle.createLimeLifecycleBackend(application);
    installLifecycleHostBackend(installation.lifecycle);
  }

  public static function enableHostLimeLoop(application:Application):Void {
    final installation = forApplication(application);
    if (installation.loop == null) installation.loop = LimeLoop.createLimeLoopBackend(application);
    installLoopHostBackend(installation.loop);
  }

  public static function enableHostLimePlatform(application:Application):Void {
    final installation = forApplication(application);
    if (installation.platform == null) installation.platform = LimePlatform.createLimePlatformBackend();
    installPlatformHostBackend(installation.platform);
  }

  public static function enableHostLimeScreen(application:Application):Void {
    final installation = forApplication(application);
    if (installation.screen == null) installation.screen = LimeScreen.createLimeScreenBackend(application);
    installScreenHostBackend(installation.screen);
  }

  #if sys
  public static function enableHostLimeFileSystem(application:Application):Void {
    final installation = forApplication(application);
    if (installation.fileSystem == null) installation.fileSystem = LimeFileSystem.createLimeFileSystemBackend();
    installFileSystemHostBackend(installation.fileSystem);
  }

  public static function enableHostLimeStorage(application:Application):Void {
    final installation = forApplication(application);
    if (installation.storage == null) installation.storage = LimeStorage.createLimeStorageBackend();
    installStorageHostBackend(installation.storage);
  }
  #end

  static function forApplication(application:Application):LimeInstallation {
    var installation = installations.get(application);
    if (installation == null) {
      installation = new LimeInstallation();
      installations.set(application, installation);
    }
    return installation;
  }
}

private class LimeInstallation {
  public var app:Dynamic;
  public var clipboard:Dynamic;
  public var dialog:Dynamic;
  public var haptics:Dynamic;
  public var lifecycle:Dynamic;
  public var loop:Dynamic;
  public var platform:Dynamic;
  public var screen:Dynamic;
  #if sys
  public var fileSystem:Dynamic;
  public var storage:Dynamic;
  #end

  public function new() {}
}
#end
