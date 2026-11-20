package flight._hl._fn;

extern class Geolocation {
	@:hlNative("flight", "flight_create_geolocation_position")
	public static function createGeolocationPosition():flight._hl.GeolocationPosition;
	@:hlNative("flight", "flight_clear_geolocation_watch")
	public static function clearGeolocationWatch(hostGeolocation:flight._hl.HostGeolocationCapability, id:Int):Void;
	@:hlNative("flight", "flight_is_geolocation_available")
	public static function isGeolocationAvailable(hostGeolocation:flight._hl.HostGeolocationCapability):Bool;
	@:hlNative("flight", "flight_free_geolocation_position")
	public static function freeGeolocationPosition(ptr:flight._hl.GeolocationPosition):Void;
}
