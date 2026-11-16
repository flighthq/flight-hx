package flight._js;

abstract CollisionContactManifold3D(Dynamic) {
	public var overlapping(get, set):Bool;
	inline function get_overlapping():Bool return untyped this.overlapping;
	inline function set_overlapping(value:Bool):Bool return untyped this.overlapping = value;
	public var normalX(get, set):Float;
	inline function get_normalX():Float return untyped this.normalX;
	inline function set_normalX(value:Float):Float return untyped this.normalX = value;
	public var normalY(get, set):Float;
	inline function get_normalY():Float return untyped this.normalY;
	inline function set_normalY(value:Float):Float return untyped this.normalY = value;
	public var normalZ(get, set):Float;
	inline function get_normalZ():Float return untyped this.normalZ;
	inline function set_normalZ(value:Float):Float return untyped this.normalZ = value;
	public var pointCount(get, set):Int;
	inline function get_pointCount():Int return untyped this.pointCount;
	inline function set_pointCount(value:Int):Int return untyped this.pointCount = value;
}
