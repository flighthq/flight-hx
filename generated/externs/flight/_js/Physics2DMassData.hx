package flight._js;

abstract Physics2DMassData(Dynamic) {
	public var centerX(get, set):Float;
	inline function get_centerX():Float return untyped this.centerX;
	inline function set_centerX(value:Float):Float return untyped this.centerX = value;
	public var centerY(get, set):Float;
	inline function get_centerY():Float return untyped this.centerY;
	inline function set_centerY(value:Float):Float return untyped this.centerY = value;
	public var inertia(get, set):Float;
	inline function get_inertia():Float return untyped this.inertia;
	inline function set_inertia(value:Float):Float return untyped this.inertia = value;
	public var mass(get, set):Float;
	inline function get_mass():Float return untyped this.mass;
	inline function set_mass(value:Float):Float return untyped this.mass = value;
}
