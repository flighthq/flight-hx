package flight._js;

abstract ConnectivityReachability(Dynamic) {
	public var reachable(get, set):Bool;
	inline function get_reachable():Bool return untyped this.reachable;
	inline function set_reachable(value:Bool):Bool return untyped this.reachable = value;
	public var latency(get, set):Float;
	inline function get_latency():Float return untyped this.latency;
	inline function set_latency(value:Float):Float return untyped this.latency = value;
}
