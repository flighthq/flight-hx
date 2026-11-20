package flight._js;

abstract ProximityReading(Dynamic) {
	public var distance(get, set):Float;
	inline function get_distance():Float return untyped this.distance;
	inline function set_distance(value:Float):Float return untyped this.distance = value;
	public var interval(get, set):Float;
	inline function get_interval():Float return untyped this.interval;
	inline function set_interval(value:Float):Float return untyped this.interval = value;
	public var max(get, set):Float;
	inline function get_max():Float return untyped this.max;
	inline function set_max(value:Float):Float return untyped this.max = value;
	public var near(get, set):Bool;
	inline function get_near():Bool return untyped this.near;
	inline function set_near(value:Bool):Bool return untyped this.near = value;
	public var timestamp(get, set):Float;
	inline function get_timestamp():Float return untyped this.timestamp;
	inline function set_timestamp(value:Float):Float return untyped this.timestamp = value;
}
