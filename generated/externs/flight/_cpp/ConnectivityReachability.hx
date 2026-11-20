package flight._cpp;

private extern class ConnectivityReachability_Ffi {
	@:native("flight_get_connectivity_reachability_reachable") static function get_reachable(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_connectivity_reachability_reachable") static function set_reachable(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_connectivity_reachability_latency") static function get_latency(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_connectivity_reachability_latency") static function set_latency(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract ConnectivityReachability(cpp.Star<cpp.Void>) {
	public var reachable(get, set):Bool;

	inline function get_reachable():Bool return ConnectivityReachability_Ffi.get_reachable(this);

	inline function set_reachable(value:Bool):Bool { ConnectivityReachability_Ffi.set_reachable(this, value); return value; }
	public var latency(get, set):Single;

	inline function get_latency():Single return ConnectivityReachability_Ffi.get_latency(this);

	inline function set_latency(value:Single):Single { ConnectivityReachability_Ffi.set_latency(this, value); return value; }
}
