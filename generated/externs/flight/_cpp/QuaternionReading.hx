package flight._cpp;

private extern class QuaternionReading_Ffi {
	@:native("flight_get_quaternion_reading_interval") static function get_interval(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_quaternion_reading_interval") static function set_interval(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_quaternion_reading_timestamp") static function get_timestamp(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_quaternion_reading_timestamp") static function set_timestamp(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_quaternion_reading_w") static function get_w(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_quaternion_reading_w") static function set_w(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_quaternion_reading_x") static function get_x(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_quaternion_reading_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_quaternion_reading_y") static function get_y(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_quaternion_reading_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_quaternion_reading_z") static function get_z(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_quaternion_reading_z") static function set_z(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract QuaternionReading(cpp.Star<cpp.Void>) {
	public var interval(get, set):Float;

	inline function get_interval():Float return QuaternionReading_Ffi.get_interval(this);

	inline function set_interval(value:Float):Float { QuaternionReading_Ffi.set_interval(this, value); return value; }
	public var timestamp(get, set):Float;

	inline function get_timestamp():Float return QuaternionReading_Ffi.get_timestamp(this);

	inline function set_timestamp(value:Float):Float { QuaternionReading_Ffi.set_timestamp(this, value); return value; }
	public var w(get, set):Single;

	inline function get_w():Single return QuaternionReading_Ffi.get_w(this);

	inline function set_w(value:Single):Single { QuaternionReading_Ffi.set_w(this, value); return value; }
	public var x(get, set):Single;

	inline function get_x():Single return QuaternionReading_Ffi.get_x(this);

	inline function set_x(value:Single):Single { QuaternionReading_Ffi.set_x(this, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return QuaternionReading_Ffi.get_y(this);

	inline function set_y(value:Single):Single { QuaternionReading_Ffi.set_y(this, value); return value; }
	public var z(get, set):Single;

	inline function get_z():Single return QuaternionReading_Ffi.get_z(this);

	inline function set_z(value:Single):Single { QuaternionReading_Ffi.set_z(this, value); return value; }
}
