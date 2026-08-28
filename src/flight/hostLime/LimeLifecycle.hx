package flight.hostLime;

#if lime
import flight.types.LifecycleBackend;
import lime.app.Application;
import lime.ui.Window;

/** Maps Lime activation and visibility events to Flight app lifecycle state. */
class LimeLifecycle {
  public static function createLimeLifecycleBackend(application:Application):LifecycleBackend {
    var state = currentState(application);
    return cast {
      getState: function():String {
        final observed = currentState(application);
        return observed == 'background' ? observed : state;
      },
      getLaunchKind: function():String return 'cold',
      subscribe: function(listener:Void->Void):Void->Void {
        final attached:Array<Window> = [];
        final activate = function():Void {
          state = 'active';
          listener();
        };
        final deactivate = function():Void {
          state = 'inactive';
          listener();
        };
        final hide = function():Void {
          state = 'background';
          listener();
        };
        final show = function():Void {
          state = 'active';
          listener();
        };
        final attach = function(window:Window):Void {
          if (attached.indexOf(window) >= 0) return;
          attached.push(window);
          window.onActivate.add(activate);
          window.onDeactivate.add(deactivate);
          window.onHide.add(hide);
          window.onShow.add(show);
        };
        for (window in application.windows) attach(window);
        application.onCreateWindow.add(attach);
        return function():Void {
          application.onCreateWindow.remove(attach);
          for (window in attached) {
            window.onActivate.remove(activate);
            window.onDeactivate.remove(deactivate);
            window.onHide.remove(hide);
            window.onShow.remove(show);
          }
        };
      },
    };
  }

  static function currentState(application:Application):String {
    if (application.windows.length == 0) return 'active';
    for (window in application.windows) if (window.visible) return 'active';
    return 'background';
  }
}
#end
