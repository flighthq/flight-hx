package flight._js;

@:jsRequire("flight")
private extern class VelocityField_Ffi {
	@:native("flight_get_velocity_field_frame_id") static function get_frameId(ptr:Dynamic):Int;
	@:native("flight_set_velocity_field_frame_id") static function set_frameId(ptr:Dynamic, value:Int):Int;
}

abstract VelocityField(Dynamic) {
	public var frameId(get, set):Int;

	inline function get_frameId():Int return VelocityField_Ffi.get_frameId(this);

	inline function set_frameId(value:Int):Int return VelocityField_Ffi.set_frameId(this, value);
}
