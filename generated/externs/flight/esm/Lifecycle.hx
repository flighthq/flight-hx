package flight.esm;

#if (js && flight_esm)
@:jsRequire("@flighthq/lifecycle")
extern class Lifecycle {
  public static function attachAppLifecycle(hostLifecycle:flight.esm.types.lifecycle.Types.HostLifecycleCapability, app:flight.esm.types.lifecycle.Types.AppLifecycle):Void;
  public static function createAppLifecycle():flight.esm.types.lifecycle.Types.AppLifecycle;
  public static function detachAppLifecycle(app:flight.esm.types.lifecycle.Types.AppLifecycle):Void;
  public static function disposeAppLifecycle(app:flight.esm.types.lifecycle.Types.AppLifecycle):Void;
  public static function explainLifecycleOperation(hostLifecycle:flight.esm.types.lifecycle.Types.HostLifecycleCapability, operation:flight.esm.types.lifecycle.Types.LifecycleOperation):flight.esm.types.host.Types.BackendOperationExplanation;
  public static function getAppLaunchKind(hostLifecycle:flight.esm.types.lifecycle.Types.HostLifecycleCapability):flight.esm.types.lifecycle.Types.AppLaunchKind;
  public static function getAppLifecycleState(hostLifecycle:flight.esm.types.lifecycle.Types.HostLifecycleCapability):flight.esm.types.lifecycle.Types.AppLifecycleState;
  public static function hasLifecycleOperation(hostLifecycle:flight.esm.types.lifecycle.Types.HostLifecycleCapability, operation:flight.esm.types.lifecycle.Types.LifecycleOperation):Bool;
  public static function isAppActive(hostLifecycle:flight.esm.types.lifecycle.Types.HostLifecycleCapability):Bool;
  public static function isAppBackground(hostLifecycle:flight.esm.types.lifecycle.Types.HostLifecycleCapability):Bool;
  public static function isAppInactive(hostLifecycle:flight.esm.types.lifecycle.Types.HostLifecycleCapability):Bool;
  public static function requestAppBack(app:flight.esm.types.lifecycle.Types.AppLifecycle):Bool;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
