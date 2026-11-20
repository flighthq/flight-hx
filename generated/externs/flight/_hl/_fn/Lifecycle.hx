package flight._hl._fn;

extern class Lifecycle {
	@:hlNative("flight", "flight_create_app_lifecycle")
	public static function createAppLifecycle():flight._hl.AppLifecycle;
	@:hlNative("flight", "flight_attach_app_lifecycle")
	public static function attachAppLifecycle(hostLifecycle:flight._hl.HostLifecycleCapability, app:flight._hl.AppLifecycle):Void;
	@:hlNative("flight", "flight_detach_app_lifecycle")
	public static function detachAppLifecycle(app:flight._hl.AppLifecycle):Void;
	@:hlNative("flight", "flight_dispose_app_lifecycle")
	public static function disposeAppLifecycle(app:flight._hl.AppLifecycle):Void;
	@:hlNative("flight", "flight_explain_lifecycle_operation")
	public static function explainLifecycleOperation(hostLifecycle:flight._hl.HostLifecycleCapability, operation:Int):flight._hl.BackendOperationExplanation;
	@:hlNative("flight", "flight_get_app_launch_kind")
	public static function getAppLaunchKind(hostLifecycle:flight._hl.HostLifecycleCapability):Int;
	@:hlNative("flight", "flight_get_app_lifecycle_state")
	public static function getAppLifecycleState(hostLifecycle:flight._hl.HostLifecycleCapability):Int;
	@:hlNative("flight", "flight_has_lifecycle_operation")
	public static function hasLifecycleOperation(hostLifecycle:flight._hl.HostLifecycleCapability, operation:Int):Bool;
	@:hlNative("flight", "flight_is_app_active")
	public static function isAppActive(hostLifecycle:flight._hl.HostLifecycleCapability):Bool;
	@:hlNative("flight", "flight_is_app_background")
	public static function isAppBackground(hostLifecycle:flight._hl.HostLifecycleCapability):Bool;
	@:hlNative("flight", "flight_is_app_inactive")
	public static function isAppInactive(hostLifecycle:flight._hl.HostLifecycleCapability):Bool;
	@:hlNative("flight", "flight_request_app_back")
	public static function requestAppBack(app:flight._hl.AppLifecycle):Bool;
	@:hlNative("flight", "flight_free_app_lifecycle")
	public static function freeAppLifecycle(ptr:flight._hl.AppLifecycle):Void;
}
