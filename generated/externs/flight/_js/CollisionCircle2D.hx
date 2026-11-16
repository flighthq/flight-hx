package flight._js;

abstract CollisionCircle2D(Dynamic) {
	public var x(get, set):Float;
	inline function get_x():Float return untyped this.x;
	inline function set_x(value:Float):Float return untyped this.x = value;
	public var y(get, set):Float;
	inline function get_y():Float return untyped this.y;
	inline function set_y(value:Float):Float return untyped this.y = value;
	public var radius(get, set):Float;
	inline function get_radius():Float return untyped this.radius;
	inline function set_radius(value:Float):Float return untyped this.radius = value;
}
