package flight._cpp._fn;

extern class Lifecycle {
	@:native("flight_create_app_lifecycle")
	public static function createAppLifecycle():flight._cpp.AppLifecycle;
	@:native("flight_attach_app_lifecycle")
	public static function attachAppLifecycle(hostLifecycle:flight._cpp.HostLifecycleCapability, app:flight._cpp.AppLifecycle):Void;
	@:native("flight_detach_app_lifecycle")
	public static function detachAppLifecycle(app:flight._cpp.AppLifecycle):Void;
	@:native("flight_dispose_app_lifecycle")
	public static function disposeAppLifecycle(app:flight._cpp.AppLifecycle):Void;
	@:native("flight_explain_lifecycle_operation")
	public static function explainLifecycleOperation(hostLifecycle:flight._cpp.HostLifecycleCapability, operation:Int):flight._cpp.BackendOperationExplanation;
	@:native("flight_get_app_launch_kind")
	public static function getAppLaunchKind(hostLifecycle:flight._cpp.HostLifecycleCapability):Int;
	@:native("flight_get_app_lifecycle_state")
	public static function getAppLifecycleState(hostLifecycle:flight._cpp.HostLifecycleCapability):Int;
	@:native("flight_has_lifecycle_operation")
	public static function hasLifecycleOperation(hostLifecycle:flight._cpp.HostLifecycleCapability, operation:Int):Bool;
	@:native("flight_is_app_active")
	public static function isAppActive(hostLifecycle:flight._cpp.HostLifecycleCapability):Bool;
	@:native("flight_is_app_background")
	public static function isAppBackground(hostLifecycle:flight._cpp.HostLifecycleCapability):Bool;
	@:native("flight_is_app_inactive")
	public static function isAppInactive(hostLifecycle:flight._cpp.HostLifecycleCapability):Bool;
	@:native("flight_request_app_back")
	public static function requestAppBack(app:flight._cpp.AppLifecycle):Bool;
	@:native("flight_free_app_lifecycle")
	public static function freeAppLifecycle(ptr:flight._cpp.AppLifecycle):Void;
}
