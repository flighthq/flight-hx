package flight._cpp;

private extern class VelocitySample_Ffi {
	@:native("flight_get_velocity_sample_last_frame_id") static function get_lastFrameId(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_velocity_sample_last_frame_id") static function set_lastFrameId(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_velocity_sample_explicit_frame_id") static function get_explicitFrameId(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_velocity_sample_explicit_frame_id") static function set_explicitFrameId(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract VelocitySample(cpp.Star<cpp.Void>) {
	public var lastFrameId(get, set):Int;

	inline function get_lastFrameId():Int return VelocitySample_Ffi.get_lastFrameId(this);

	inline function set_lastFrameId(value:Int):Int return VelocitySample_Ffi.set_lastFrameId(this, value);
	public var explicitFrameId(get, set):Int;

	inline function get_explicitFrameId():Int return VelocitySample_Ffi.get_explicitFrameId(this);

	inline function set_explicitFrameId(value:Int):Int return VelocitySample_Ffi.set_explicitFrameId(this, value);
}
