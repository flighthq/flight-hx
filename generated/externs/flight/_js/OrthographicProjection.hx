package flight._js;

abstract OrthographicProjection(Dynamic) {
	public var halfHeight(get, set):Float;
	inline function get_halfHeight():Float return untyped this.halfHeight;
	inline function set_halfHeight(value:Float):Float return untyped this.halfHeight = value;
	public var halfWidth(get, set):Float;
	inline function get_halfWidth():Float return untyped this.halfWidth;
	inline function set_halfWidth(value:Float):Float return untyped this.halfWidth = value;
}
