package flight._hl;

private extern class ConnectivityReachabilityOptions_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_connectivity_reachability_options_url")
	static function get_url(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_connectivity_reachability_options_url")
	static function set_url(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract ConnectivityReachabilityOptions(hl.Bytes) {
	public var url(get, set):String;
	inline function get_url():String { var raw = ConnectivityReachabilityOptions_Ffi.get_url(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); ConnectivityReachabilityOptions_Ffi.freeString(raw); return value; }
	inline function set_url(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } ConnectivityReachabilityOptions_Ffi.set_url(this, raw); return value; }
}
