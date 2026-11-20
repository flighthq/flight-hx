package flight._js;

abstract RotationRateReading(Dynamic) {
	public var alpha(get, set):Float;
	inline function get_alpha():Float return untyped this.alpha;
	inline function set_alpha(value:Float):Float return untyped this.alpha = value;
	public var beta(get, set):Float;
	inline function get_beta():Float return untyped this.beta;
	inline function set_beta(value:Float):Float return untyped this.beta = value;
	public var gamma(get, set):Float;
	inline function get_gamma():Float return untyped this.gamma;
	inline function set_gamma(value:Float):Float return untyped this.gamma = value;
	public var interval(get, set):Float;
	inline function get_interval():Float return untyped this.interval;
	inline function set_interval(value:Float):Float return untyped this.interval = value;
	public var timestamp(get, set):Float;
	inline function get_timestamp():Float return untyped this.timestamp;
	inline function set_timestamp(value:Float):Float return untyped this.timestamp = value;
}
