package flight._cpp;

private extern class Skeleton2DDeformLengthMismatch_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_get_skeleton2_ddeform_length_mismatch_addressed") static function get_addressed(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_skeleton2_ddeform_length_mismatch_addressed") static function set_addressed(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_skeleton2_ddeform_length_mismatch_offsets") static function get_offsets(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_skeleton2_ddeform_length_mismatch_offsets") static function set_offsets(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_field_get_skeleton2_ddeform_length_mismatch_subject") static function get_subject(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_skeleton2_ddeform_length_mismatch_subject") static function set_subject(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract Skeleton2DDeformLengthMismatch(cpp.Star<cpp.Void>) {
	public var addressed(get, set):Int;

	inline function get_addressed():Int return Skeleton2DDeformLengthMismatch_Ffi.get_addressed(this);

	inline function set_addressed(value:Int):Int { Skeleton2DDeformLengthMismatch_Ffi.set_addressed(this, value); return value; }
	public var offsets(get, set):Int;

	inline function get_offsets():Int return Skeleton2DDeformLengthMismatch_Ffi.get_offsets(this);

	inline function set_offsets(value:Int):Int { Skeleton2DDeformLengthMismatch_Ffi.set_offsets(this, value); return value; }
	public var subject(get, set):String;
	inline function get_subject():String { var raw = Skeleton2DDeformLengthMismatch_Ffi.get_subject(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); Skeleton2DDeformLengthMismatch_Ffi.freeString(raw); return value; }
	inline function set_subject(value:String):String { var raw:cpp.ConstCharStar = cast value; Skeleton2DDeformLengthMismatch_Ffi.set_subject(this, raw); return value; }
}
