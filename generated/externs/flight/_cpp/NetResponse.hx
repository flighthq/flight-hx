package flight._cpp;

private extern class NetResponse_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_get_net_response_status") static function get_status(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_net_response_status") static function set_status(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_field_get_net_response_status_text") static function get_statusText(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_net_response_status_text") static function set_statusText(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_net_response_ok") static function get_ok(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_net_response_ok") static function set_ok(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_field_get_net_response_url") static function get_url(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_net_response_url") static function set_url(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract NetResponse(cpp.Star<cpp.Void>) {
	public var status(get, set):Int;

	inline function get_status():Int return NetResponse_Ffi.get_status(this);

	inline function set_status(value:Int):Int { NetResponse_Ffi.set_status(this, value); return value; }
	public var statusText(get, set):String;
	inline function get_statusText():String { var raw = NetResponse_Ffi.get_statusText(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); NetResponse_Ffi.freeString(raw); return value; }
	inline function set_statusText(value:String):String { var raw:cpp.ConstCharStar = cast value; NetResponse_Ffi.set_statusText(this, raw); return value; }
	public var ok(get, set):Bool;

	inline function get_ok():Bool return NetResponse_Ffi.get_ok(this);

	inline function set_ok(value:Bool):Bool { NetResponse_Ffi.set_ok(this, value); return value; }
	public var url(get, set):String;
	inline function get_url():String { var raw = NetResponse_Ffi.get_url(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); NetResponse_Ffi.freeString(raw); return value; }
	inline function set_url(value:String):String { var raw:cpp.ConstCharStar = cast value; NetResponse_Ffi.set_url(this, raw); return value; }
}
