package flight._cpp;

private extern class Awd2TransformRead_Ffi {
	@:native("flight_get_awd2_transform_read_end") static function get_end(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_awd2_transform_read_end") static function set_end(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract Awd2TransformRead(cpp.Star<cpp.Void>) {
	public var end(get, set):Int;

	inline function get_end():Int return Awd2TransformRead_Ffi.get_end(this);

	inline function set_end(value:Int):Int { Awd2TransformRead_Ffi.set_end(this, value); return value; }
}
