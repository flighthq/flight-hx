package flight._cpp;

private extern class TweenManagerData_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_tween_manager_data___brand") static function get_brand(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_tween_manager_data___brand") static function set_brand(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract TweenManagerData(cpp.Star<cpp.Void>) {
	public var brand(get, set):String;
	inline function get_brand():String { var raw = TweenManagerData_Ffi.get_brand(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); TweenManagerData_Ffi.freeString(raw); return value; }
	inline function set_brand(value:String):String { var raw:cpp.ConstCharStar = cast value; TweenManagerData_Ffi.set_brand(this, raw); return value; }
}
