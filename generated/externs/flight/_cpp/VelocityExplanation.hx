package flight._cpp;

private extern class VelocityExplanation_Ffi {
	@:native("flight_get_velocity_explanation_current_frame_id") static function get_currentFrameId(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_velocity_explanation_current_frame_id") static function set_currentFrameId(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_velocity_explanation_explicit") static function get_explicit(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_velocity_explanation_explicit") static function set_explicit(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_velocity_explanation_last_frame_id") static function get_lastFrameId(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_velocity_explanation_last_frame_id") static function set_lastFrameId(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_velocity_explanation_x") static function get_x(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_velocity_explanation_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_velocity_explanation_y") static function get_y(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_velocity_explanation_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract VelocityExplanation(cpp.Star<cpp.Void>) {
	public var currentFrameId(get, set):Int;

	inline function get_currentFrameId():Int return VelocityExplanation_Ffi.get_currentFrameId(this);

	inline function set_currentFrameId(value:Int):Int return VelocityExplanation_Ffi.set_currentFrameId(this, value);
	public var explicit(get, set):Bool;

	inline function get_explicit():Bool return VelocityExplanation_Ffi.get_explicit(this);

	inline function set_explicit(value:Bool):Bool return VelocityExplanation_Ffi.set_explicit(this, value);
	public var lastFrameId(get, set):Int;

	inline function get_lastFrameId():Int return VelocityExplanation_Ffi.get_lastFrameId(this);

	inline function set_lastFrameId(value:Int):Int return VelocityExplanation_Ffi.set_lastFrameId(this, value);
	public var x(get, set):Single;

	inline function get_x():Single return VelocityExplanation_Ffi.get_x(this);

	inline function set_x(value:Single):Single return VelocityExplanation_Ffi.set_x(this, value);
	public var y(get, set):Single;

	inline function get_y():Single return VelocityExplanation_Ffi.get_y(this);

	inline function set_y(value:Single):Single return VelocityExplanation_Ffi.set_y(this, value);
}
