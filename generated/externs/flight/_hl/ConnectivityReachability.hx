package flight._hl;

abstract ConnectivityReachability(hl.Bytes) {
	public var reachable(get, set):Bool;

	inline function get_reachable():Bool return this.getUI8(4) != 0;

	inline function set_reachable(value:Bool):Bool { this.setUI8(4, value ? 1 : 0); return value; }
	public var latency(get, set):Single;

	inline function get_latency():Single return this.getF32(0);

	inline function set_latency(value:Single):Single { this.setF32(0, value); return value; }
}
