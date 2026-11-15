package flight._js;

@:jsRequire("flight")
private extern class AnimationSampleAccumulator_Ffi {
	@:native("flight_get_animation_sample_accumulator_components") static function get_components(ptr:Dynamic):Int;
	@:native("flight_set_animation_sample_accumulator_components") static function set_components(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_animation_sample_accumulator_quaternion") static function get_quaternion(ptr:Dynamic):Bool;
	@:native("flight_set_animation_sample_accumulator_quaternion") static function set_quaternion(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_animation_sample_accumulator_weight") static function get_weight(ptr:Dynamic):Float;
	@:native("flight_set_animation_sample_accumulator_weight") static function set_weight(ptr:Dynamic, value:Float):Float;
}

abstract AnimationSampleAccumulator(Dynamic) {
	public var components(get, set):Int;

	inline function get_components():Int return AnimationSampleAccumulator_Ffi.get_components(this);

	inline function set_components(value:Int):Int return AnimationSampleAccumulator_Ffi.set_components(this, value);
	public var quaternion(get, set):Bool;

	inline function get_quaternion():Bool return AnimationSampleAccumulator_Ffi.get_quaternion(this);

	inline function set_quaternion(value:Bool):Bool return AnimationSampleAccumulator_Ffi.set_quaternion(this, value);
	public var weight(get, set):Float;

	inline function get_weight():Float return AnimationSampleAccumulator_Ffi.get_weight(this);

	inline function set_weight(value:Float):Float return AnimationSampleAccumulator_Ffi.set_weight(this, value);
}
