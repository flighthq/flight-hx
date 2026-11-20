package flight._js;

abstract Scene3DHit(Dynamic) {
	public var distance(get, set):Float;
	inline function get_distance():Float return untyped this.distance;
	inline function set_distance(value:Float):Float return untyped this.distance = value;
	public var triangleIndex(get, set):Int;
	inline function get_triangleIndex():Int return untyped this.triangleIndex;
	inline function set_triangleIndex(value:Int):Int return untyped this.triangleIndex = value;
	public var u(get, set):Float;
	inline function get_u():Float return untyped this.u;
	inline function set_u(value:Float):Float return untyped this.u = value;
	public var v(get, set):Float;
	inline function get_v():Float return untyped this.v;
	inline function set_v(value:Float):Float return untyped this.v = value;
	public var w(get, set):Float;
	inline function get_w():Float return untyped this.w;
	inline function set_w(value:Float):Float return untyped this.w = value;
	public var pointX(get, set):Float;
	inline function get_pointX():Float return untyped this.pointX;
	inline function set_pointX(value:Float):Float return untyped this.pointX = value;
	public var pointY(get, set):Float;
	inline function get_pointY():Float return untyped this.pointY;
	inline function set_pointY(value:Float):Float return untyped this.pointY = value;
	public var pointZ(get, set):Float;
	inline function get_pointZ():Float return untyped this.pointZ;
	inline function set_pointZ(value:Float):Float return untyped this.pointZ = value;
	public var normalX(get, set):Float;
	inline function get_normalX():Float return untyped this.normalX;
	inline function set_normalX(value:Float):Float return untyped this.normalX = value;
	public var normalY(get, set):Float;
	inline function get_normalY():Float return untyped this.normalY;
	inline function set_normalY(value:Float):Float return untyped this.normalY = value;
	public var normalZ(get, set):Float;
	inline function get_normalZ():Float return untyped this.normalZ;
	inline function set_normalZ(value:Float):Float return untyped this.normalZ = value;
}
