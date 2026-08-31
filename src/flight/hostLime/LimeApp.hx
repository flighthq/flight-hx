package flight.hostLime;

#if lime
import flight.types.HostAppCapabilities;
import lime.app.Application;
import lime.system.Locale;
import lime.system.System;

/**
 * Builds Flight's `app` capability namespace from a Lime application.
 *
 * The upstream host seam decomposed the former single `AppBackend` into one
 * single-purpose backend per capability field; this composes the honestly
 * Lime-backed ones (identity, paths, locale, visibility, focus, quit, and
 * lifecycle subscriptions) into a `HostAppCapabilities`. Unsupported desktop
 * fields are simply omitted, leaving Flight's capability-owned sentinels in place.
 */
class LimeApp {
  public static function createLimeAppCapabilities(application:Application):HostAppCapabilities {
    var handlingQuitRequest = false;

    return {
      focus: {
        focus: function():Void {
          final window = application.window;
          if (window != null) window.focus();
        },
      },
      name: {
        getName: function():String {
          final title = metadata(application, 'title');
          return title != '' ? title : application.window == null ? '' : application.window.title;
        },
      },
      nameWrite: {
        setName: function(name:String):Void {
          application.meta.set('title', name);
          final window = application.window;
          if (window != null) window.title = name;
        },
      },
      path: {
        getAppDirectoryPath: function(kind:String):String {
          final root = nullToEmpty(System.applicationStorageDirectory);
          return switch (kind) {
            case 'logs': joinPath(root, 'logs');
            case 'crashDumps': joinPath(root, 'crashDumps');
            default: root;
          };
        },
        getAppPath: function():String return nullToEmpty(System.applicationDirectory),
        getExecutablePath: function():String {
          #if sys
          return Sys.programPath();
          #else
          return '';
          #end
        },
      },
      locale: {
        getLocale: function():String return localeString(Locale.currentLocale),
        getPreferredSystemLanguages: function():Array<String> {
          final locale = localeString(Locale.systemLocale);
          return locale == '' ? [] : [locale];
        },
        getSystemLocale: function():String return localeString(Locale.systemLocale),
      },
      version: {
        getVersion: function():String return metadata(application, 'version'),
      },
      quit: {
        quit: function():Void {
          // Flight confirms an uncancelled host request by calling quit(). Lime's
          // request is already inside System.exit/onExit, so do not re-enter it.
          if (!handlingQuitRequest) System.exit(0);
        },
      },
      quitRequest: {
        subscribe: function(listener:(Void->Void)->Void):Void->Void {
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
        },
      },
      ready: {
        subscribe: function(listener:Void->Void):Void->Void {
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
        },
      },
      allWindowsClosed: {
        subscribe: function(listener:Void->Void):Void->Void {
          // Lime exits automatically after removing its last window. Filter the
          // shared exit event so an explicit quit with live windows is not
          // mislabeled as an all-windows-closed event.
          final wrapped = function(_code:Int):Void {
            if (application.windows.length == 0) listener();
          };
          application.onExit.add(wrapped);
          return function():Void application.onExit.remove(wrapped);
        },
      },
      activate: {
        subscribe: function(listener:Void->Void):Void->Void {
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
        },
      },
      hide: {
        hideApp: function():Void {
          for (window in application.windows) window.visible = false;
        },
      },
      show: {
        showApp: function():Void {
          for (window in application.windows) window.visible = true;
          final primary = application.window;
          if (primary != null) primary.focus();
        },
      },
      hiddenQuery: {
        isAppHidden: function():Bool {
          if (application.windows.length == 0) return false;
          for (window in application.windows) if (window.visible) return false;
          return true;
        },
      },
    };
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
