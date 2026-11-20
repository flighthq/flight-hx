package flight._hl._fn;

extern class Connectivity {
	@:hlNative("flight", "flight_create_connectivity")
	public static function createConnectivity():flight._hl.Connectivity;
	@:hlNative("flight", "flight_attach_connectivity")
	public static function attachConnectivity(hostConnectivityStatus:flight._hl.HostConnectivityStatusCapability, hostConnectivityChange:flight._hl.HostConnectivityChangeCapability, connectivity:flight._hl.Connectivity):Bool;
	@:hlNative("flight", "flight_destroy_connectivity")
	public static function destroyConnectivity(hostConnectivityChange:flight._hl.HostConnectivityChangeCapability):Void;
	@:hlNative("flight", "flight_detach_connectivity")
	public static function detachConnectivity(connectivity:flight._hl.Connectivity):Void;
	@:hlNative("flight", "flight_dispose_connectivity")
	public static function disposeConnectivity(connectivity:flight._hl.Connectivity):Void;
	@:hlNative("flight", "flight_get_connectivity_status")
	public static function getConnectivityStatus(out:flight._hl.ConnectivityStatus, hostConnectivityStatus:flight._hl.HostConnectivityStatusCapability):Void;
	@:hlNative("flight", "flight_has_connectivity_status_changed")
	public static function hasConnectivityStatusChanged(a:flight._hl.ConnectivityStatus, b:flight._hl.ConnectivityStatus):Bool;
	@:hlNative("flight", "flight_is_connectivity_metered")
	public static function isConnectivityMetered(hostConnectivityStatus:flight._hl.HostConnectivityStatusCapability):Bool;
	@:hlNative("flight", "flight_is_connectivity_save_data_enabled")
	public static function isConnectivitySaveDataEnabled(hostConnectivityStatus:flight._hl.HostConnectivityStatusCapability):Bool;
	@:hlNative("flight", "flight_free_connectivity")
	public static function freeConnectivity(ptr:flight._hl.Connectivity):Void;
}
