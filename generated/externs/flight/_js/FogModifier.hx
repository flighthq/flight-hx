package flight._js;

abstract FogModifier(Dynamic) {
	public var color(get, set):Int;
	inline function get_color():Int return untyped this.color;
	inline function set_color(value:Int):Int return untyped this.color = value;
	public var near(get, set):Float;
	inline function get_near():Float return untyped this.near;
	inline function set_near(value:Float):Float return untyped this.near = value;
	public var far(get, set):Float;
	inline function get_far():Float return untyped this.far;
	inline function set_far(value:Float):Float return untyped this.far = value;
	public var density(get, set):Float;
	inline function get_density():Float return untyped this.density;
	inline function set_density(value:Float):Float return untyped this.density = value;
}
