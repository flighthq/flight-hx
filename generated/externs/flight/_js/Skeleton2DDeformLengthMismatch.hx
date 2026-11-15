package flight._js;

@:jsRequire("flight")
private extern class Skeleton2DDeformLengthMismatch_Ffi {
	@:native("flight_get_skeleton2_ddeform_length_mismatch_addressed") static function get_addressed(ptr:Dynamic):Int;
	@:native("flight_set_skeleton2_ddeform_length_mismatch_addressed") static function set_addressed(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_skeleton2_ddeform_length_mismatch_offsets") static function get_offsets(ptr:Dynamic):Int;
	@:native("flight_set_skeleton2_ddeform_length_mismatch_offsets") static function set_offsets(ptr:Dynamic, value:Int):Int;
}

abstract Skeleton2DDeformLengthMismatch(Dynamic) {
	public var addressed(get, set):Int;

	inline function get_addressed():Int return Skeleton2DDeformLengthMismatch_Ffi.get_addressed(this);

	inline function set_addressed(value:Int):Int return Skeleton2DDeformLengthMismatch_Ffi.set_addressed(this, value);
	public var offsets(get, set):Int;

	inline function get_offsets():Int return Skeleton2DDeformLengthMismatch_Ffi.get_offsets(this);

	inline function set_offsets(value:Int):Int return Skeleton2DDeformLengthMismatch_Ffi.set_offsets(this, value);
}
