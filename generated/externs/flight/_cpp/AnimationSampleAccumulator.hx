package flight._cpp;

private extern class AnimationSampleAccumulator_Ffi {
	@:native("flight_get_animation_sample_accumulator_components") static function get_components(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_animation_sample_accumulator_components") static function set_components(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_animation_sample_accumulator_quaternion") static function get_quaternion(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_animation_sample_accumulator_quaternion") static function set_quaternion(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_animation_sample_accumulator_weight") static function get_weight(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_animation_sample_accumulator_weight") static function set_weight(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract AnimationSampleAccumulator(cpp.Star<cpp.Void>) {
	public var components(get, set):Int;

	inline function get_components():Int return AnimationSampleAccumulator_Ffi.get_components(this);

	inline function set_components(value:Int):Int return AnimationSampleAccumulator_Ffi.set_components(this, value);
	public var quaternion(get, set):Bool;

	inline function get_quaternion():Bool return AnimationSampleAccumulator_Ffi.get_quaternion(this);

	inline function set_quaternion(value:Bool):Bool return AnimationSampleAccumulator_Ffi.set_quaternion(this, value);
	public var weight(get, set):Single;

	inline function get_weight():Single return AnimationSampleAccumulator_Ffi.get_weight(this);

	inline function set_weight(value:Single):Single return AnimationSampleAccumulator_Ffi.set_weight(this, value);
}
