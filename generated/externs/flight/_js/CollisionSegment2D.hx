package flight._js;

abstract CollisionSegment2D(Dynamic) {
	public var x0(get, set):Float;
	inline function get_x0():Float return untyped this.x0;
	inline function set_x0(value:Float):Float return untyped this.x0 = value;
	public var y0(get, set):Float;
	inline function get_y0():Float return untyped this.y0;
	inline function set_y0(value:Float):Float return untyped this.y0 = value;
	public var x1(get, set):Float;
	inline function get_x1():Float return untyped this.x1;
	inline function set_x1(value:Float):Float return untyped this.x1 = value;
	public var y1(get, set):Float;
	inline function get_y1():Float return untyped this.y1;
	inline function set_y1(value:Float):Float return untyped this.y1 = value;
}
