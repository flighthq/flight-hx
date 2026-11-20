package flight._js;

abstract Physics2DMaterial(Dynamic) {
	public var density(get, set):Float;
	inline function get_density():Float return untyped this.density;
	inline function set_density(value:Float):Float return untyped this.density = value;
	public var friction(get, set):Float;
	inline function get_friction():Float return untyped this.friction;
	inline function set_friction(value:Float):Float return untyped this.friction = value;
	public var restitution(get, set):Float;
	inline function get_restitution():Float return untyped this.restitution;
	inline function set_restitution(value:Float):Float return untyped this.restitution = value;
}
