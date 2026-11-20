package flight._js;

abstract PressureReading(Dynamic) {
	public var altitude(get, set):Float;
	inline function get_altitude():Float return untyped this.altitude;
	inline function set_altitude(value:Float):Float return untyped this.altitude = value;
	public var interval(get, set):Float;
	inline function get_interval():Float return untyped this.interval;
	inline function set_interval(value:Float):Float return untyped this.interval = value;
	public var pressure(get, set):Float;
	inline function get_pressure():Float return untyped this.pressure;
	inline function set_pressure(value:Float):Float return untyped this.pressure = value;
	public var timestamp(get, set):Float;
	inline function get_timestamp():Float return untyped this.timestamp;
	inline function set_timestamp(value:Float):Float return untyped this.timestamp = value;
}
