package flight._js;

abstract RateLimitedLogSinkOptions(Dynamic) {
	public var perChannel(get, set):Bool;
	inline function get_perChannel():Bool return untyped this.perChannel;
	inline function set_perChannel(value:Bool):Bool return untyped this.perChannel = value;
	public var maxPerInterval(get, set):Int;
	inline function get_maxPerInterval():Int return untyped this.maxPerInterval;
	inline function set_maxPerInterval(value:Int):Int return untyped this.maxPerInterval = value;
	public var intervalMs(get, set):Float;
	inline function get_intervalMs():Float return untyped this.intervalMs;
	inline function set_intervalMs(value:Float):Float return untyped this.intervalMs = value;
}
