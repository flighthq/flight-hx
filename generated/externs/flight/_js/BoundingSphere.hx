package flight._js;

abstract BoundingSphere(Dynamic) {
	public var radius(get, set):Float;
	inline function get_radius():Float return untyped this.radius;
	inline function set_radius(value:Float):Float return untyped this.radius = value;
}
