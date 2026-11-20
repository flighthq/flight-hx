package flight._cpp;

private extern class SpritesheetFramePatternName_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_spritesheet_frame_pattern_name_value") static function get_value(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_spritesheet_frame_pattern_name_value") static function set_value(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract SpritesheetFramePatternName(cpp.Star<cpp.Void>) {
	public var value(get, set):String;
	inline function get_value():String { var raw = SpritesheetFramePatternName_Ffi.get_value(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); SpritesheetFramePatternName_Ffi.freeString(raw); return value; }
	inline function set_value(value:String):String { var raw:cpp.ConstCharStar = cast value; SpritesheetFramePatternName_Ffi.set_value(this, raw); return value; }
}
