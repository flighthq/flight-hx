package flight.hostLime;

#if lime
import flight.types.AppBackend;
import lime.app.Application;
import lime.system.Locale;
import lime.system.System;

/** Maps Flight's application contract onto a Lime application. */
class LimeApp {
  /**
   * Creates a backend without installing it.
   *
   * Unsupported desktop-shell operations retain Flight's capability-owned
   * sentinel behavior. Lime-backed identity, paths, visibility, focus, quit,
   * and lifecycle subscriptions replace the corresponding sentinels.
   */
  public static function createLimeAppBackend(application:Application):AppBackend {
    final backend:Dynamic = Reflect.copy((flight._App._sentinel__app : Dynamic));
    var handlingQuitRequest = false;

    backend.focus = function():Void {
      final window = application.window;
      if (window != null) window.focus();
    };
    backend.getAppDirectoryPath = function(kind:String):String {
      final root = nullToEmpty(System.applicationStorageDirectory);
      return switch (kind) {
        case 'logs': joinPath(root, 'logs');
        case 'crashDumps': joinPath(root, 'crashDumps');
        default: root;
      };
    };
    backend.getAppPath = function():String return nullToEmpty(System.applicationDirectory);
    backend.getCommandLine = function():Array<String> {
      #if sys
      return Sys.args();
      #else
      return [];
      #end
    };
    backend.getExecutablePath = function():String {
      #if sys
      return Sys.programPath();
      #else
      return '';
      #end
    };
    backend.getLocale = function():String return localeString(Locale.currentLocale);
    backend.getName = function():String {
      final title = metadata(application, 'title');
      return title != '' ? title : application.window == null ? '' : application.window.title;
    };
    backend.getPreferredSystemLanguages = function():Array<String> {
      final locale = localeString(Locale.systemLocale);
      return locale == '' ? [] : [locale];
    };
    backend.getSystemLocale = function():String return localeString(Locale.systemLocale);
    backend.getVersion = function():String return metadata(application, 'version');
    backend.hideApp = function():Bool {
      if (application.windows.length == 0) return false;
      for (window in application.windows) window.visible = false;
      for (window in application.windows) if (window.visible) return false;
      return true;
    };
    backend.isAppHidden = function():Bool {
      if (application.windows.length == 0) return false;
      for (window in application.windows) if (window.visible) return false;
      return true;
    };
    backend.quit = function():Void {
      // Flight confirms an uncancelled host request by calling quit(). Lime's
      // request is already inside System.exit/onExit, so do not re-enter it.
      if (!handlingQuitRequest) System.exit(0);
    };
    backend.setName = function(name:String):Bool {
      application.meta.set('title', name);
      final window = application.window;
      if (window != null) window.title = name;
      return true;
    };
    backend.showApp = function():Bool {
      if (application.windows.length == 0) return false;
      for (window in application.windows) window.visible = true;
      final primary = application.window;
      if (primary != null) primary.focus();
      for (window in application.windows) if (!window.visible) return false;
      return true;
    };
    backend.subscribeActivate = function(listener:Void->Void):Void->Void {
      final attached:Array<lime.ui.Window> = [];
      final attach = function(window:lime.ui.Window):Void {
        if (attached.indexOf(window) >= 0) return;
        attached.push(window);
        window.onActivate.add(listener);
      };
      for (window in application.windows) attach(window);
      application.onCreateWindow.add(attach);
      return function():Void {
        application.onCreateWindow.remove(attach);
        for (window in attached) window.onActivate.remove(listener);
      };
    };
    backend.subscribeAllWindowsClosed = function(listener:Void->Void):Void->Void {
      // Lime exits automatically after removing its last window. Filter the
      // shared exit event so an explicit quit with live windows is not
      // mislabeled as an all-windows-closed event.
      final wrapped = function(_code:Int):Void {
        if (application.windows.length == 0) listener();
      };
      application.onExit.add(wrapped);
      return function():Void application.onExit.remove(wrapped);
    };
    backend.subscribeQuitRequest = function(listener:(Void->Void)->Void):Void->Void {
      final wrapped = function(_code:Int):Void {
        handlingQuitRequest = true;
        try {
          listener(application.onExit.cancel);
        } catch (error:Dynamic) {
          handlingQuitRequest = false;
          throw error;
        }
        handlingQuitRequest = false;
      };
      application.onExit.add(wrapped);
      return function():Void application.onExit.remove(wrapped);
    };
    backend.subscribeReady = function(listener:Void->Void):Void->Void {
      // HostLime is normally enabled from onWindowCreate. Deliver readiness on
      // the next Lime update so attachApp cannot miss an already-created host.
      var pending = true;
      var wrapped:Int->Void = null;
      wrapped = function(_deltaTime:Int):Void {
        if (!pending) return;
        pending = false;
        application.onUpdate.remove(wrapped);
        listener();
      };
      application.onUpdate.add(wrapped);
      return function():Void {
        if (!pending) return;
        pending = false;
        application.onUpdate.remove(wrapped);
      };
    };

    return cast backend;
  }

  static function metadata(application:Application, field:String):String {
    final value = application.meta.get(field);
    return value == null ? '' : value;
  }

  static function localeString(locale:Null<Locale>):String {
    return locale == null ? '' : (locale : String);
  }

  static function joinPath(root:String, leaf:String):String {
    return root == '' ? '' : StringTools.endsWith(root, '/') ? root + leaf : root + '/' + leaf;
  }

  static function nullToEmpty(value:Null<String>):String return value == null ? '' : value;
}
#end
