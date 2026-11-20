package flight._js._fn;

@:jsRequire("@flighthq/lifecycle")
extern class Lifecycle {
	@:native("createAppLifecycle")
	public static function createAppLifecycle():flight._js.AppLifecycle;
	@:native("attachAppLifecycle")
	public static function attachAppLifecycle(hostLifecycle:flight._js.HostLifecycleCapability, app:flight._js.AppLifecycle):Void;
	@:native("detachAppLifecycle")
	public static function detachAppLifecycle(app:flight._js.AppLifecycle):Void;
	@:native("disposeAppLifecycle")
	public static function disposeAppLifecycle(app:flight._js.AppLifecycle):Void;
	@:native("explainLifecycleOperation")
	public static function explainLifecycleOperation(hostLifecycle:flight._js.HostLifecycleCapability, operation:Dynamic):flight._js.BackendOperationExplanation;
	@:native("getAppLaunchKind")
	public static function getAppLaunchKind(hostLifecycle:flight._js.HostLifecycleCapability):Dynamic;
	@:native("getAppLifecycleState")
	public static function getAppLifecycleState(hostLifecycle:flight._js.HostLifecycleCapability):Dynamic;
	@:native("hasLifecycleOperation")
	public static function hasLifecycleOperation(hostLifecycle:flight._js.HostLifecycleCapability, operation:Dynamic):Bool;
	@:native("isAppActive")
	public static function isAppActive(hostLifecycle:flight._js.HostLifecycleCapability):Bool;
	@:native("isAppBackground")
	public static function isAppBackground(hostLifecycle:flight._js.HostLifecycleCapability):Bool;
	@:native("isAppInactive")
	public static function isAppInactive(hostLifecycle:flight._js.HostLifecycleCapability):Bool;
	@:native("requestAppBack")
	public static function requestAppBack(app:flight._js.AppLifecycle):Bool;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeAppLifecycle(ptr:flight._js.AppLifecycle):Void {}
}
