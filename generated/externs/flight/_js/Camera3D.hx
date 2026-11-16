package flight._js;

abstract Camera3D(Dynamic) {
	public var far(get, set):Float;
	inline function get_far():Float return untyped this.far;
	inline function set_far(value:Float):Float return untyped this.far = value;
	public var near(get, set):Float;
	inline function get_near():Float return untyped this.near;
	inline function set_near(value:Float):Float return untyped this.near = value;
}
