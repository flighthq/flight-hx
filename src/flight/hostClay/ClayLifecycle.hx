// Maintained host adapter: Flight LifecycleBackend for Clay (sentinel-copy).
// WRITE-AHEAD against develop 2cf1c5cef. Active/inactive/background transitions
// come from clay.Events (freeze/unfreeze) forwarded by the app. See
// agents/host-develop-adaptation.md.
package flight.hostClay;

#if clay
class ClayLifecycle {
  static var listener:Null<String->Void> = null;

  /** Composed into the host `system.lifecycle` slot by HostClay. */
  public static function createClayLifecycleBackend():Dynamic {
    final backend:Dynamic = ({} : Dynamic);
    backend.subscribe = function(cb:String->Void):(Void->Void) {
      listener = cb;
      return function():Void listener = null;
    };
    backend.getLaunchKind = function():String return 'cold';
    return cast backend;
  }

  /** The app's clay.Events forwards freeze()/unfreeze() here. */
  public static function onActive():Void if (listener != null) listener('active');
  public static function onInactive():Void if (listener != null) listener('inactive');
  public static function onBackground():Void if (listener != null) listener('background');
}
#end
