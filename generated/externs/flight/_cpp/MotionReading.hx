package flight._cpp;

private extern class MotionReading_Ffi {
	@:native("flight_get_motion_reading_interval") static function get_interval(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_motion_reading_interval") static function set_interval(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_motion_reading_timestamp") static function get_timestamp(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_motion_reading_timestamp") static function set_timestamp(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_motion_reading_x") static function get_x(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_motion_reading_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_motion_reading_y") static function get_y(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_motion_reading_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_motion_reading_z") static function get_z(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_motion_reading_z") static function set_z(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract MotionReading(cpp.Star<cpp.Void>) {
	public var interval(get, set):Float;

	inline function get_interval():Float return MotionReading_Ffi.get_interval(this);

	inline function set_interval(value:Float):Float { MotionReading_Ffi.set_interval(this, value); return value; }
	public var timestamp(get, set):Float;

	inline function get_timestamp():Float return MotionReading_Ffi.get_timestamp(this);

	inline function set_timestamp(value:Float):Float { MotionReading_Ffi.set_timestamp(this, value); return value; }
	public var x(get, set):Float;

	inline function get_x():Float return MotionReading_Ffi.get_x(this);

	inline function set_x(value:Float):Float { MotionReading_Ffi.set_x(this, value); return value; }
	public var y(get, set):Float;

	inline function get_y():Float return MotionReading_Ffi.get_y(this);

	inline function set_y(value:Float):Float { MotionReading_Ffi.set_y(this, value); return value; }
	public var z(get, set):Float;

	inline function get_z():Float return MotionReading_Ffi.get_z(this);

	inline function set_z(value:Float):Float { MotionReading_Ffi.set_z(this, value); return value; }
}
