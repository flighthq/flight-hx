package flight._cpp;

private extern class Physics2DJointResolutionExplanation_Ffi {
	@:native("flight_get_physics2_djoint_resolution_explanation_ready_count") static function get_readyCount(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics2_djoint_resolution_explanation_ready_count") static function set_readyCount(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract Physics2DJointResolutionExplanation(cpp.Star<cpp.Void>) {
	public var readyCount(get, set):Int;

	inline function get_readyCount():Int return Physics2DJointResolutionExplanation_Ffi.get_readyCount(this);

	inline function set_readyCount(value:Int):Int return Physics2DJointResolutionExplanation_Ffi.set_readyCount(this, value);
}
