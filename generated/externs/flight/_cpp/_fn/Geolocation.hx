package flight._cpp._fn;

extern class Geolocation {
	@:native("flight_create_geolocation_position")
	public static function createGeolocationPosition():flight._cpp.GeolocationPosition;
	@:native("flight_clear_geolocation_watch")
	public static function clearGeolocationWatch(hostGeolocation:flight._cpp.HostGeolocationCapability, id:Int):Void;
	@:native("flight_is_geolocation_available")
	public static function isGeolocationAvailable(hostGeolocation:flight._cpp.HostGeolocationCapability):Bool;
	@:native("flight_free_geolocation_position")
	public static function freeGeolocationPosition(ptr:flight._cpp.GeolocationPosition):Void;
}
