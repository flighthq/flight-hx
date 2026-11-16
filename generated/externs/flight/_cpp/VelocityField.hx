package flight._cpp;

private extern class VelocityField_Ffi {
	@:native("flight_get_velocity_field_frame_id") static function get_frameId(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_velocity_field_frame_id") static function set_frameId(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract VelocityField(cpp.Star<cpp.Void>) {
	public var frameId(get, set):Int;

	inline function get_frameId():Int return VelocityField_Ffi.get_frameId(this);

	inline function set_frameId(value:Int):Int { VelocityField_Ffi.set_frameId(this, value); return value; }
}
