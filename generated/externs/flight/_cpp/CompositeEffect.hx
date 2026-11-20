package flight._cpp;

private extern class CompositeEffect_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_composite_effect_operator") static function get_operator_(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_composite_effect_operator") static function set_operator_(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract CompositeEffect(cpp.Star<cpp.Void>) {
	public var operator_(get, set):String;
	inline function get_operator_():String { var raw = CompositeEffect_Ffi.get_operator_(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); CompositeEffect_Ffi.freeString(raw); return value; }
	inline function set_operator_(value:String):String { var raw:cpp.ConstCharStar = cast value; CompositeEffect_Ffi.set_operator_(this, raw); return value; }
}
