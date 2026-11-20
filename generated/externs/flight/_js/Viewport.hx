package flight._js;

abstract Viewport(Dynamic) {
	public var devicePixelRatio(get, set):Float;
	inline function get_devicePixelRatio():Float return untyped this.devicePixelRatio;
	inline function set_devicePixelRatio(value:Float):Float return untyped this.devicePixelRatio = value;
	public var height(get, set):Float;
	inline function get_height():Float return untyped this.height;
	inline function set_height(value:Float):Float return untyped this.height = value;
	public var width(get, set):Float;
	inline function get_width():Float return untyped this.width;
	inline function set_width(value:Float):Float return untyped this.width = value;
	public var x(get, set):Float;
	inline function get_x():Float return untyped this.x;
	inline function set_x(value:Float):Float return untyped this.x = value;
	public var y(get, set):Float;
	inline function get_y():Float return untyped this.y;
	inline function set_y(value:Float):Float return untyped this.y = value;
	static inline public function create():flight._js.Viewport {
		return flight._js._fn.Node.createViewport();
	}
	inline public function getAspect():Float {
		return flight._js._fn.Node.getViewportAspect(cast this);
	}
	inline public function free():Void {
		flight._js._fn.Node.freeViewport(cast this);
	}
}
