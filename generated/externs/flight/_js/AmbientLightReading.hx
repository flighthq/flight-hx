package flight._js;

abstract AmbientLightReading(Dynamic) {
	public var illuminance(get, set):Float;
	inline function get_illuminance():Float return untyped this.illuminance;
	inline function set_illuminance(value:Float):Float return untyped this.illuminance = value;
	public var interval(get, set):Float;
	inline function get_interval():Float return untyped this.interval;
	inline function set_interval(value:Float):Float return untyped this.interval = value;
	public var timestamp(get, set):Float;
	inline function get_timestamp():Float return untyped this.timestamp;
	inline function set_timestamp(value:Float):Float return untyped this.timestamp = value;
}
