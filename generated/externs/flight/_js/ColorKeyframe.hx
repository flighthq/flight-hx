package flight._js;

abstract ColorKeyframe(Dynamic) {
	public var time(get, set):Float;
	inline function get_time():Float return untyped this.time;
	inline function set_time(value:Float):Float return untyped this.time = value;
	public var r(get, set):Float;
	inline function get_r():Float return untyped this.r;
	inline function set_r(value:Float):Float return untyped this.r = value;
	public var g(get, set):Float;
	inline function get_g():Float return untyped this.g;
	inline function set_g(value:Float):Float return untyped this.g = value;
	public var b(get, set):Float;
	inline function get_b():Float return untyped this.b;
	inline function set_b(value:Float):Float return untyped this.b = value;
}
