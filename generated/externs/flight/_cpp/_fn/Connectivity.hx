package flight._cpp._fn;

extern class Connectivity {
	@:native("flight_create_connectivity")
	public static function createConnectivity():flight._cpp.Connectivity;
	@:native("flight_attach_connectivity")
	public static function attachConnectivity(hostConnectivityStatus:flight._cpp.HostConnectivityStatusCapability, hostConnectivityChange:flight._cpp.HostConnectivityChangeCapability, connectivity:flight._cpp.Connectivity):Bool;
	@:native("flight_destroy_connectivity")
	public static function destroyConnectivity(hostConnectivityChange:flight._cpp.HostConnectivityChangeCapability):Void;
	@:native("flight_detach_connectivity")
	public static function detachConnectivity(connectivity:flight._cpp.Connectivity):Void;
	@:native("flight_dispose_connectivity")
	public static function disposeConnectivity(connectivity:flight._cpp.Connectivity):Void;
	@:native("flight_get_connectivity_status")
	public static function getConnectivityStatus(out:flight._cpp.ConnectivityStatus, hostConnectivityStatus:flight._cpp.HostConnectivityStatusCapability):Void;
	@:native("flight_has_connectivity_status_changed")
	public static function hasConnectivityStatusChanged(a:flight._cpp.ConnectivityStatus, b:flight._cpp.ConnectivityStatus):Bool;
	@:native("flight_is_connectivity_metered")
	public static function isConnectivityMetered(hostConnectivityStatus:flight._cpp.HostConnectivityStatusCapability):Bool;
	@:native("flight_is_connectivity_save_data_enabled")
	public static function isConnectivitySaveDataEnabled(hostConnectivityStatus:flight._cpp.HostConnectivityStatusCapability):Bool;
	@:native("flight_free_connectivity")
	public static function freeConnectivity(ptr:flight._cpp.Connectivity):Void;
}
