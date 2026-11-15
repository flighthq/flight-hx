package flight._js;

@:jsRequire("flight")
private extern class Skeleton2DDeformLengthExplanation_Ffi {
	@:native("flight_get_skeleton2_ddeform_length_explanation_accepted") static function get_accepted(ptr:Dynamic):Bool;
	@:native("flight_set_skeleton2_ddeform_length_explanation_accepted") static function set_accepted(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_skeleton2_ddeform_length_explanation_addressed") static function get_addressed(ptr:Dynamic):Int;
	@:native("flight_set_skeleton2_ddeform_length_explanation_addressed") static function set_addressed(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_skeleton2_ddeform_length_explanation_offsets") static function get_offsets(ptr:Dynamic):Int;
	@:native("flight_set_skeleton2_ddeform_length_explanation_offsets") static function set_offsets(ptr:Dynamic, value:Int):Int;
}

abstract Skeleton2DDeformLengthExplanation(Dynamic) {
	public var accepted(get, set):Bool;

	inline function get_accepted():Bool return Skeleton2DDeformLengthExplanation_Ffi.get_accepted(this);

	inline function set_accepted(value:Bool):Bool return Skeleton2DDeformLengthExplanation_Ffi.set_accepted(this, value);
	public var addressed(get, set):Int;

	inline function get_addressed():Int return Skeleton2DDeformLengthExplanation_Ffi.get_addressed(this);

	inline function set_addressed(value:Int):Int return Skeleton2DDeformLengthExplanation_Ffi.set_addressed(this, value);
	public var offsets(get, set):Int;

	inline function get_offsets():Int return Skeleton2DDeformLengthExplanation_Ffi.get_offsets(this);

	inline function set_offsets(value:Int):Int return Skeleton2DDeformLengthExplanation_Ffi.set_offsets(this, value);
}
