package flight._cpp;

private extern class NetResponseExplanation_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_get_net_response_explanation_status") static function get_status(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_net_response_explanation_status") static function set_status(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_field_get_net_response_explanation_status_text") static function get_statusText(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_net_response_explanation_status_text") static function set_statusText(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_net_response_explanation_url") static function get_url(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_net_response_explanation_url") static function set_url(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract NetResponseExplanation(cpp.Star<cpp.Void>) {
	public var status(get, set):Int;

	inline function get_status():Int return NetResponseExplanation_Ffi.get_status(this);

	inline function set_status(value:Int):Int { NetResponseExplanation_Ffi.set_status(this, value); return value; }
	public var statusText(get, set):String;
	inline function get_statusText():String { var raw = NetResponseExplanation_Ffi.get_statusText(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); NetResponseExplanation_Ffi.freeString(raw); return value; }
	inline function set_statusText(value:String):String { var raw:cpp.ConstCharStar = cast value; NetResponseExplanation_Ffi.set_statusText(this, raw); return value; }
	public var url(get, set):String;
	inline function get_url():String { var raw = NetResponseExplanation_Ffi.get_url(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); NetResponseExplanation_Ffi.freeString(raw); return value; }
	inline function set_url(value:String):String { var raw:cpp.ConstCharStar = cast value; NetResponseExplanation_Ffi.set_url(this, raw); return value; }
}
