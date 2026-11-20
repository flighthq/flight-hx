package flight._cpp;

private extern class Viewport_Ffi {
	@:native("flight_get_viewport_device_pixel_ratio") static function get_devicePixelRatio(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_viewport_device_pixel_ratio") static function set_devicePixelRatio(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_viewport_height") static function get_height(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_viewport_height") static function set_height(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_viewport_width") static function get_width(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_viewport_width") static function set_width(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_viewport_x") static function get_x(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_viewport_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_viewport_y") static function get_y(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_viewport_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract Viewport(cpp.Star<cpp.Void>) {
	public var devicePixelRatio(get, set):Float;

	inline function get_devicePixelRatio():Float return Viewport_Ffi.get_devicePixelRatio(this);

	inline function set_devicePixelRatio(value:Float):Float { Viewport_Ffi.set_devicePixelRatio(this, value); return value; }
	public var height(get, set):Float;

	inline function get_height():Float return Viewport_Ffi.get_height(this);

	inline function set_height(value:Float):Float { Viewport_Ffi.set_height(this, value); return value; }
	public var width(get, set):Float;

	inline function get_width():Float return Viewport_Ffi.get_width(this);

	inline function set_width(value:Float):Float { Viewport_Ffi.set_width(this, value); return value; }
	public var x(get, set):Float;

	inline function get_x():Float return Viewport_Ffi.get_x(this);

	inline function set_x(value:Float):Float { Viewport_Ffi.set_x(this, value); return value; }
	public var y(get, set):Float;

	inline function get_y():Float return Viewport_Ffi.get_y(this);

	inline function set_y(value:Float):Float { Viewport_Ffi.set_y(this, value); return value; }

	static extern inline public function create():flight._cpp.Viewport {
		return flight._cpp._fn.Node.createViewport();
	}
	extern inline public function getAspect():Float {
		return flight._cpp._fn.Node.getViewportAspect(cast this);
	}
	extern inline public function free():Void {
		flight._cpp._fn.Node.freeViewport(cast this);
	}
}
