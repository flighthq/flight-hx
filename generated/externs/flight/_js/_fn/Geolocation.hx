package flight._js._fn;

@:jsRequire("@flighthq/geolocation")
extern class Geolocation {
	@:native("createGeolocationPosition")
	public static function createGeolocationPosition():flight._js.GeolocationPosition;
	@:native("clearGeolocationWatch")
	public static function clearGeolocationWatch(hostGeolocation:flight._js.HostGeolocationCapability, id:Int):Void;
	@:native("isGeolocationAvailable")
	public static function isGeolocationAvailable(hostGeolocation:flight._js.HostGeolocationCapability):Bool;
	@:native("watchGeolocationPosition")
	public static function watchGeolocationPosition(hostGeolocation:flight._js.HostGeolocationCapability, handler:Dynamic, options:Null<flight._js.GeolocationRequestOptions>, onError:Null<Dynamic>):Int;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeGeolocationPosition(ptr:flight._js.GeolocationPosition):Void {}
}
