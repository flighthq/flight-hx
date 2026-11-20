package flight._cpp;

private extern class BlendEffect_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_blend_effect_mode") static function get_mode(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_blend_effect_mode") static function set_mode(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract BlendEffect(cpp.Star<cpp.Void>) {
	public var mode(get, set):String;
	inline function get_mode():String { var raw = BlendEffect_Ffi.get_mode(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); BlendEffect_Ffi.freeString(raw); return value; }
	inline function set_mode(value:String):String { var raw:cpp.ConstCharStar = cast value; BlendEffect_Ffi.set_mode(this, raw); return value; }
}
