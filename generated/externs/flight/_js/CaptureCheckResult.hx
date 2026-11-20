package flight._js;

abstract CaptureCheckResult(Dynamic) {
	public var pass(get, set):Bool;
	inline function get_pass():Bool return untyped this.pass;
	inline function set_pass(value:Bool):Bool return untyped this.pass = value;
	public var difference(get, set):Float;
	inline function get_difference():Float return untyped this.difference;
	inline function set_difference(value:Float):Float return untyped this.difference = value;
	public var tolerance(get, set):Float;
	inline function get_tolerance():Float return untyped this.tolerance;
	inline function set_tolerance(value:Float):Float return untyped this.tolerance = value;
}
