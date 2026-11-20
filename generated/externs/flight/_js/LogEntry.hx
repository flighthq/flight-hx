package flight._js;

abstract LogEntry(Dynamic) {
	public var timestampMs(get, set):Float;
	inline function get_timestampMs():Float return untyped this.timestampMs;
	inline function set_timestampMs(value:Float):Float return untyped this.timestampMs = value;
}
