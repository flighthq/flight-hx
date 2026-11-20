package flight._js;

abstract CollisionObb2D(Dynamic) {
	public var x(get, set):Float;
	inline function get_x():Float return untyped this.x;
	inline function set_x(value:Float):Float return untyped this.x = value;
	public var y(get, set):Float;
	inline function get_y():Float return untyped this.y;
	inline function set_y(value:Float):Float return untyped this.y = value;
	public var halfW(get, set):Float;
	inline function get_halfW():Float return untyped this.halfW;
	inline function set_halfW(value:Float):Float return untyped this.halfW = value;
	public var halfH(get, set):Float;
	inline function get_halfH():Float return untyped this.halfH;
	inline function set_halfH(value:Float):Float return untyped this.halfH = value;
	public var rotation(get, set):Float;
	inline function get_rotation():Float return untyped this.rotation;
	inline function set_rotation(value:Float):Float return untyped this.rotation = value;
}
