package flight._cpp;

private extern class TweenPropertyDetail_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_get_tween_property_detail_change") static function get_change(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_tween_property_detail_change") static function set_change(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_field_get_tween_property_detail_key") static function get_key(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_tween_property_detail_key") static function set_key(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_tween_property_detail_start") static function get_start(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_tween_property_detail_start") static function set_start(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract TweenPropertyDetail(cpp.Star<cpp.Void>) {
	public var change(get, set):Float;

	inline function get_change():Float return TweenPropertyDetail_Ffi.get_change(this);

	inline function set_change(value:Float):Float { TweenPropertyDetail_Ffi.set_change(this, value); return value; }
	public var key(get, set):String;
	inline function get_key():String { var raw = TweenPropertyDetail_Ffi.get_key(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); TweenPropertyDetail_Ffi.freeString(raw); return value; }
	inline function set_key(value:String):String { var raw:cpp.ConstCharStar = cast value; TweenPropertyDetail_Ffi.set_key(this, raw); return value; }
	public var start(get, set):Float;

	inline function get_start():Float return TweenPropertyDetail_Ffi.get_start(this);

	inline function set_start(value:Float):Float { TweenPropertyDetail_Ffi.set_start(this, value); return value; }
}
