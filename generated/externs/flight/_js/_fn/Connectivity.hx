package flight._js._fn;

@:jsRequire("@flighthq/connectivity")
extern class Connectivity {
	@:native("createConnectivity")
	public static function createConnectivity():flight._js.Connectivity;
	@:native("attachConnectivity")
	public static function attachConnectivity(hostConnectivityStatus:flight._js.HostConnectivityStatusCapability, hostConnectivityChange:flight._js.HostConnectivityChangeCapability, connectivity:flight._js.Connectivity):Bool;
	@:native("destroyConnectivity")
	public static function destroyConnectivity(hostConnectivityChange:flight._js.HostConnectivityChangeCapability):Void;
	@:native("detachConnectivity")
	public static function detachConnectivity(connectivity:flight._js.Connectivity):Void;
	@:native("disposeConnectivity")
	public static function disposeConnectivity(connectivity:flight._js.Connectivity):Void;
	@:native("getConnectivityStatus")
	public static function getConnectivityStatus(out:flight._js.ConnectivityStatus, hostConnectivityStatus:flight._js.HostConnectivityStatusCapability):Void;
	@:native("hasConnectivityStatusChanged")
	public static function hasConnectivityStatusChanged(a:flight._js.ConnectivityStatus, b:flight._js.ConnectivityStatus):Bool;
	@:native("isConnectivityMetered")
	public static function isConnectivityMetered(hostConnectivityStatus:flight._js.HostConnectivityStatusCapability):Bool;
	@:native("isConnectivitySaveDataEnabled")
	public static function isConnectivitySaveDataEnabled(hostConnectivityStatus:flight._js.HostConnectivityStatusCapability):Bool;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeConnectivity(ptr:flight._js.Connectivity):Void {}
}
