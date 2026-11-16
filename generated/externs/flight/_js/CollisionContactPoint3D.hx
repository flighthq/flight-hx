package flight._js;

abstract CollisionContactPoint3D(Dynamic) {
	public var x(get, set):Float;
	inline function get_x():Float return untyped this.x;
	inline function set_x(value:Float):Float return untyped this.x = value;
	public var y(get, set):Float;
	inline function get_y():Float return untyped this.y;
	inline function set_y(value:Float):Float return untyped this.y = value;
	public var z(get, set):Float;
	inline function get_z():Float return untyped this.z;
	inline function set_z(value:Float):Float return untyped this.z = value;
	public var depth(get, set):Float;
	inline function get_depth():Float return untyped this.depth;
	inline function set_depth(value:Float):Float return untyped this.depth = value;
	public var featureId(get, set):Float;
	inline function get_featureId():Float return untyped this.featureId;
	inline function set_featureId(value:Float):Float return untyped this.featureId = value;
}
