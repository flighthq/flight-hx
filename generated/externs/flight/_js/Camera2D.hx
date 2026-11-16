package flight._js;

abstract Camera2D(Dynamic) {
	public var rotation(get, set):Float;
	inline function get_rotation():Float return untyped this.rotation;
	inline function set_rotation(value:Float):Float return untyped this.rotation = value;
	public var x(get, set):Float;
	inline function get_x():Float return untyped this.x;
	inline function set_x(value:Float):Float return untyped this.x = value;
	public var y(get, set):Float;
	inline function get_y():Float return untyped this.y;
	inline function set_y(value:Float):Float return untyped this.y = value;
	public var zoom(get, set):Float;
	inline function get_zoom():Float return untyped this.zoom;
	inline function set_zoom(value:Float):Float return untyped this.zoom = value;
}
