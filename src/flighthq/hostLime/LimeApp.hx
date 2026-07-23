package flighthq.hostLime;

#if lime
import flighthq.AppApi;
import flighthq.Types.AppBackend;
import lime.app.Application;

/** Maps Flight's AppBackend onto a Lime application. */
class LimeApp {
  /**
   * Creates a Flight application backend backed by `application`.
   *
   * Lime supplies application identity and process/window lifecycle. Flight's
   * web backend supplies the documented sentinels for unsupported integrations
   * such as dock menus, login items, and recent documents.
   */
  public static function createLimeAppBackend(application:Application):AppBackend {
    final backend = AppApi.createWebAppBackend();
    backend.focus = function():Void {
      if (application.window != null) application.window.focus();
    };
    backend.getName = function():String {
      return getMetadata(application, 'title');
    };
    backend.getVersion = function():String {
      return getMetadata(application, 'version');
    };
    backend.quit = function():Void {
      if (application.window != null) application.window.close();
    };
    backend.showApp = function():Bool {
      if (application.window == null) return false;
      application.window.focus();
      return true;
    };
    return backend;
  }

  static function getMetadata(application:Application, field:String):String {
    final config = Reflect.field(application, 'config');
    final meta = config == null ? null : Reflect.field(config, 'meta');
    final value = meta == null ? null : Reflect.field(meta, field);
    return value == null ? '' : Std.string(value);
  }
}
#end
