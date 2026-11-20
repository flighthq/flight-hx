package flight._cpp;

private extern class Skeleton2DDeformLengthExplanation_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_get_skeleton2_ddeform_length_explanation_accepted") static function get_accepted(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_skeleton2_ddeform_length_explanation_accepted") static function set_accepted(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_skeleton2_ddeform_length_explanation_addressed") static function get_addressed(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_skeleton2_ddeform_length_explanation_addressed") static function set_addressed(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_field_get_skeleton2_ddeform_length_explanation_addressing") static function get_addressing(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_skeleton2_ddeform_length_explanation_addressing") static function set_addressing(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_skeleton2_ddeform_length_explanation_offsets") static function get_offsets(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_skeleton2_ddeform_length_explanation_offsets") static function set_offsets(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract Skeleton2DDeformLengthExplanation(cpp.Star<cpp.Void>) {
	public var accepted(get, set):Bool;

	inline function get_accepted():Bool return Skeleton2DDeformLengthExplanation_Ffi.get_accepted(this);

	inline function set_accepted(value:Bool):Bool { Skeleton2DDeformLengthExplanation_Ffi.set_accepted(this, value); return value; }
	public var addressed(get, set):Int;

	inline function get_addressed():Int return Skeleton2DDeformLengthExplanation_Ffi.get_addressed(this);

	inline function set_addressed(value:Int):Int { Skeleton2DDeformLengthExplanation_Ffi.set_addressed(this, value); return value; }
	public var addressing(get, set):String;
	inline function get_addressing():String { var raw = Skeleton2DDeformLengthExplanation_Ffi.get_addressing(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); Skeleton2DDeformLengthExplanation_Ffi.freeString(raw); return value; }
	inline function set_addressing(value:String):String { var raw:cpp.ConstCharStar = cast value; Skeleton2DDeformLengthExplanation_Ffi.set_addressing(this, raw); return value; }
	public var offsets(get, set):Int;

	inline function get_offsets():Int return Skeleton2DDeformLengthExplanation_Ffi.get_offsets(this);

	inline function set_offsets(value:Int):Int { Skeleton2DDeformLengthExplanation_Ffi.set_offsets(this, value); return value; }
}
