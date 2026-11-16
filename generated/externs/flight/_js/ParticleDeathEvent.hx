package flight._js;

abstract ParticleDeathEvent(Dynamic) {
	public var x(get, set):Float;
	inline function get_x():Float return untyped this["x"];
	inline function set_x(value:Float):Float return untyped this["x"] = value;
	public var y(get, set):Float;
	inline function get_y():Float return untyped this["y"];
	inline function set_y(value:Float):Float return untyped this["y"] = value;
	public var z(get, set):Float;
	inline function get_z():Float return untyped this["z"];
	inline function set_z(value:Float):Float return untyped this["z"] = value;
}
