package flight._cpp;

private extern class GeolocationPosition_Ffi {
	@:native("flight_get_geolocation_position_latitude") static function get_latitude(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_geolocation_position_latitude") static function set_latitude(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_geolocation_position_longitude") static function get_longitude(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_geolocation_position_longitude") static function set_longitude(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_geolocation_position_accuracy") static function get_accuracy(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_geolocation_position_accuracy") static function set_accuracy(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_geolocation_position_altitude") static function get_altitude(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_geolocation_position_altitude") static function set_altitude(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_geolocation_position_altitude_accuracy") static function get_altitudeAccuracy(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_geolocation_position_altitude_accuracy") static function set_altitudeAccuracy(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_geolocation_position_floor_level") static function get_floorLevel(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_geolocation_position_floor_level") static function set_floorLevel(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_geolocation_position_heading") static function get_heading(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_geolocation_position_heading") static function set_heading(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_geolocation_position_speed") static function get_speed(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_geolocation_position_speed") static function set_speed(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_geolocation_position_timestamp") static function get_timestamp(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_geolocation_position_timestamp") static function set_timestamp(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract GeolocationPosition(cpp.Star<cpp.Void>) {
	public var latitude(get, set):Single;

	inline function get_latitude():Single return GeolocationPosition_Ffi.get_latitude(this);

	inline function set_latitude(value:Single):Single { GeolocationPosition_Ffi.set_latitude(this, value); return value; }
	public var longitude(get, set):Single;

	inline function get_longitude():Single return GeolocationPosition_Ffi.get_longitude(this);

	inline function set_longitude(value:Single):Single { GeolocationPosition_Ffi.set_longitude(this, value); return value; }
	public var accuracy(get, set):Single;

	inline function get_accuracy():Single return GeolocationPosition_Ffi.get_accuracy(this);

	inline function set_accuracy(value:Single):Single { GeolocationPosition_Ffi.set_accuracy(this, value); return value; }
	public var altitude(get, set):Single;

	inline function get_altitude():Single return GeolocationPosition_Ffi.get_altitude(this);

	inline function set_altitude(value:Single):Single { GeolocationPosition_Ffi.set_altitude(this, value); return value; }
	public var altitudeAccuracy(get, set):Single;

	inline function get_altitudeAccuracy():Single return GeolocationPosition_Ffi.get_altitudeAccuracy(this);

	inline function set_altitudeAccuracy(value:Single):Single { GeolocationPosition_Ffi.set_altitudeAccuracy(this, value); return value; }
	public var floorLevel(get, set):Single;

	inline function get_floorLevel():Single return GeolocationPosition_Ffi.get_floorLevel(this);

	inline function set_floorLevel(value:Single):Single { GeolocationPosition_Ffi.set_floorLevel(this, value); return value; }
	public var heading(get, set):Single;

	inline function get_heading():Single return GeolocationPosition_Ffi.get_heading(this);

	inline function set_heading(value:Single):Single { GeolocationPosition_Ffi.set_heading(this, value); return value; }
	public var speed(get, set):Single;

	inline function get_speed():Single return GeolocationPosition_Ffi.get_speed(this);

	inline function set_speed(value:Single):Single { GeolocationPosition_Ffi.set_speed(this, value); return value; }
	public var timestamp(get, set):Float;

	inline function get_timestamp():Float return GeolocationPosition_Ffi.get_timestamp(this);

	inline function set_timestamp(value:Float):Float { GeolocationPosition_Ffi.set_timestamp(this, value); return value; }
}
