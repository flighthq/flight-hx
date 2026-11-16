package flight._js;

abstract ParticleSpawnEvent(Dynamic) {
	public var x(get, set):Float;
	inline function get_x():Float return untyped this["x"];
	inline function set_x(value:Float):Float return untyped this["x"] = value;
	public var y(get, set):Float;
	inline function get_y():Float return untyped this["y"];
	inline function set_y(value:Float):Float return untyped this["y"] = value;
	public var z(get, set):Float;
	inline function get_z():Float return untyped this["z"];
	inline function set_z(value:Float):Float return untyped this["z"] = value;
	public var vx(get, set):Float;
	inline function get_vx():Float return untyped this["vx"];
	inline function set_vx(value:Float):Float return untyped this["vx"] = value;
	public var vy(get, set):Float;
	inline function get_vy():Float return untyped this["vy"];
	inline function set_vy(value:Float):Float return untyped this["vy"] = value;
	public var vz(get, set):Float;
	inline function get_vz():Float return untyped this["vz"];
	inline function set_vz(value:Float):Float return untyped this["vz"] = value;
}
