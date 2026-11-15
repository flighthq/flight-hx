package flight._cpp;

private extern class Physics2DAbiContactBuffer_Ffi {
	@:native("flight_get_physics2_dabi_contact_buffer_count") static function get_count(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics2_dabi_contact_buffer_count") static function set_count(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_physics2_dabi_contact_buffer_point_count") static function get_pointCount(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics2_dabi_contact_buffer_point_count") static function set_pointCount(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_physics2_dabi_contact_buffer_required_count") static function get_requiredCount(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics2_dabi_contact_buffer_required_count") static function set_requiredCount(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_physics2_dabi_contact_buffer_required_point_count") static function get_requiredPointCount(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics2_dabi_contact_buffer_required_point_count") static function set_requiredPointCount(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract Physics2DAbiContactBuffer(cpp.Star<cpp.Void>) {
	public var count(get, set):Int;

	inline function get_count():Int return Physics2DAbiContactBuffer_Ffi.get_count(this);

	inline function set_count(value:Int):Int return Physics2DAbiContactBuffer_Ffi.set_count(this, value);
	public var pointCount(get, set):Int;

	inline function get_pointCount():Int return Physics2DAbiContactBuffer_Ffi.get_pointCount(this);

	inline function set_pointCount(value:Int):Int return Physics2DAbiContactBuffer_Ffi.set_pointCount(this, value);
	public var requiredCount(get, set):Int;

	inline function get_requiredCount():Int return Physics2DAbiContactBuffer_Ffi.get_requiredCount(this);

	inline function set_requiredCount(value:Int):Int return Physics2DAbiContactBuffer_Ffi.set_requiredCount(this, value);
	public var requiredPointCount(get, set):Int;

	inline function get_requiredPointCount():Int return Physics2DAbiContactBuffer_Ffi.get_requiredPointCount(this);

	inline function set_requiredPointCount(value:Int):Int return Physics2DAbiContactBuffer_Ffi.set_requiredPointCount(this, value);
}
