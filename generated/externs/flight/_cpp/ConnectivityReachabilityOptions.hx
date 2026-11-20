package flight._cpp;

private extern class ConnectivityReachabilityOptions_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_connectivity_reachability_options_url") static function get_url(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_connectivity_reachability_options_url") static function set_url(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract ConnectivityReachabilityOptions(cpp.Star<cpp.Void>) {
	public var url(get, set):String;
	inline function get_url():String { var raw = ConnectivityReachabilityOptions_Ffi.get_url(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); ConnectivityReachabilityOptions_Ffi.freeString(raw); return value; }
	inline function set_url(value:String):String { var raw:cpp.ConstCharStar = cast value; ConnectivityReachabilityOptions_Ffi.set_url(this, raw); return value; }
}
