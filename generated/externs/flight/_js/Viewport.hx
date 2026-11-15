package flight._js;

@:jsRequire("flight")
private extern class Viewport_Ffi {
	@:native("flight_get_viewport_device_pixel_ratio") static function get_devicePixelRatio(ptr:Dynamic):Float;
	@:native("flight_set_viewport_device_pixel_ratio") static function set_devicePixelRatio(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_viewport_height") static function get_height(ptr:Dynamic):Float;
	@:native("flight_set_viewport_height") static function set_height(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_viewport_width") static function get_width(ptr:Dynamic):Float;
	@:native("flight_set_viewport_width") static function set_width(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_viewport_x") static function get_x(ptr:Dynamic):Float;
	@:native("flight_set_viewport_x") static function set_x(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_viewport_y") static function get_y(ptr:Dynamic):Float;
	@:native("flight_set_viewport_y") static function set_y(ptr:Dynamic, value:Float):Float;
}

abstract Viewport(Dynamic) {
	public var devicePixelRatio(get, set):Float;

	inline function get_devicePixelRatio():Float return Viewport_Ffi.get_devicePixelRatio(this);

	inline function set_devicePixelRatio(value:Float):Float return Viewport_Ffi.set_devicePixelRatio(this, value);
	public var height(get, set):Float;

	inline function get_height():Float return Viewport_Ffi.get_height(this);

	inline function set_height(value:Float):Float return Viewport_Ffi.set_height(this, value);
	public var width(get, set):Float;

	inline function get_width():Float return Viewport_Ffi.get_width(this);

	inline function set_width(value:Float):Float return Viewport_Ffi.set_width(this, value);
	public var x(get, set):Float;

	inline function get_x():Float return Viewport_Ffi.get_x(this);

	inline function set_x(value:Float):Float return Viewport_Ffi.set_x(this, value);
	public var y(get, set):Float;

	inline function get_y():Float return Viewport_Ffi.get_y(this);

	inline function set_y(value:Float):Float return Viewport_Ffi.set_y(this, value);

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
