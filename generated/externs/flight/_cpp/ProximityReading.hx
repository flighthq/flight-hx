package flight._cpp;

private extern class ProximityReading_Ffi {
	@:native("flight_get_proximity_reading_distance") static function get_distance(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_proximity_reading_distance") static function set_distance(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_proximity_reading_interval") static function get_interval(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_proximity_reading_interval") static function set_interval(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_proximity_reading_max") static function get_max(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_proximity_reading_max") static function set_max(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_proximity_reading_near") static function get_near(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_proximity_reading_near") static function set_near(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_proximity_reading_timestamp") static function get_timestamp(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_proximity_reading_timestamp") static function set_timestamp(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract ProximityReading(cpp.Star<cpp.Void>) {
	public var distance(get, set):Float;

	inline function get_distance():Float return ProximityReading_Ffi.get_distance(this);

	inline function set_distance(value:Float):Float { ProximityReading_Ffi.set_distance(this, value); return value; }
	public var interval(get, set):Float;

	inline function get_interval():Float return ProximityReading_Ffi.get_interval(this);

	inline function set_interval(value:Float):Float { ProximityReading_Ffi.set_interval(this, value); return value; }
	public var max(get, set):Float;

	inline function get_max():Float return ProximityReading_Ffi.get_max(this);

	inline function set_max(value:Float):Float { ProximityReading_Ffi.set_max(this, value); return value; }
	public var near(get, set):Bool;

	inline function get_near():Bool return ProximityReading_Ffi.get_near(this);

	inline function set_near(value:Bool):Bool { ProximityReading_Ffi.set_near(this, value); return value; }
	public var timestamp(get, set):Float;

	inline function get_timestamp():Float return ProximityReading_Ffi.get_timestamp(this);

	inline function set_timestamp(value:Float):Float { ProximityReading_Ffi.set_timestamp(this, value); return value; }
}
