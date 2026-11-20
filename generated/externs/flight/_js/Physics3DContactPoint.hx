package flight._js;

abstract Physics3DContactPoint(Dynamic) {
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
	public var rAx(get, set):Float;
	inline function get_rAx():Float return untyped this.rAx;
	inline function set_rAx(value:Float):Float return untyped this.rAx = value;
	public var rAy(get, set):Float;
	inline function get_rAy():Float return untyped this.rAy;
	inline function set_rAy(value:Float):Float return untyped this.rAy = value;
	public var rAz(get, set):Float;
	inline function get_rAz():Float return untyped this.rAz;
	inline function set_rAz(value:Float):Float return untyped this.rAz = value;
	public var rBx(get, set):Float;
	inline function get_rBx():Float return untyped this.rBx;
	inline function set_rBx(value:Float):Float return untyped this.rBx = value;
	public var rBy(get, set):Float;
	inline function get_rBy():Float return untyped this.rBy;
	inline function set_rBy(value:Float):Float return untyped this.rBy = value;
	public var rBz(get, set):Float;
	inline function get_rBz():Float return untyped this.rBz;
	inline function set_rBz(value:Float):Float return untyped this.rBz = value;
}
