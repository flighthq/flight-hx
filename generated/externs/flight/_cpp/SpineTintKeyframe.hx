package flight._cpp;

private extern class SpineTintKeyframe_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_spine_tint_keyframe_color") static function get_color(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_spine_tint_keyframe_color") static function set_color(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_spine_tint_keyframe_time") static function get_time(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_spine_tint_keyframe_time") static function set_time(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract SpineTintKeyframe(cpp.Star<cpp.Void>) {
	public var color(get, set):String;
	inline function get_color():String { var raw = SpineTintKeyframe_Ffi.get_color(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); SpineTintKeyframe_Ffi.freeString(raw); return value; }
	inline function set_color(value:String):String { var raw:cpp.ConstCharStar = cast value; SpineTintKeyframe_Ffi.set_color(this, raw); return value; }
	public var time(get, set):Single;

	inline function get_time():Single return SpineTintKeyframe_Ffi.get_time(this);

	inline function set_time(value:Single):Single { SpineTintKeyframe_Ffi.set_time(this, value); return value; }
}
