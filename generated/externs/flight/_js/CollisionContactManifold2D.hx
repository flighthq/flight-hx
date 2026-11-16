package flight._js;

abstract CollisionContactManifold2D(Dynamic) {
	public var overlapping(get, set):Bool;
	inline function get_overlapping():Bool return untyped this.overlapping;
	inline function set_overlapping(value:Bool):Bool return untyped this.overlapping = value;
	public var normalX(get, set):Float;
	inline function get_normalX():Float return untyped this.normalX;
	inline function set_normalX(value:Float):Float return untyped this.normalX = value;
	public var normalY(get, set):Float;
	inline function get_normalY():Float return untyped this.normalY;
	inline function set_normalY(value:Float):Float return untyped this.normalY = value;
	public var depth(get, set):Float;
	inline function get_depth():Float return untyped this.depth;
	inline function set_depth(value:Float):Float return untyped this.depth = value;
	public var pointCount(get, set):Int;
	inline function get_pointCount():Int return untyped this.pointCount;
	inline function set_pointCount(value:Int):Int return untyped this.pointCount = value;
}
