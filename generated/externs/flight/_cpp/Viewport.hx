package flight._cpp;

private extern class Viewport_Ffi {
	@:native("flight_get_viewport_device_pixel_ratio") static function get_devicePixelRatio(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_viewport_device_pixel_ratio") static function set_devicePixelRatio(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_viewport_height") static function get_height(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_viewport_height") static function set_height(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_viewport_width") static function get_width(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_viewport_width") static function set_width(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_viewport_x") static function get_x(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_viewport_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_viewport_y") static function get_y(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_viewport_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract Viewport(cpp.Star<cpp.Void>) {
	public var devicePixelRatio(get, set):Single;

	inline function get_devicePixelRatio():Single return Viewport_Ffi.get_devicePixelRatio(this);

	inline function set_devicePixelRatio(value:Single):Single return Viewport_Ffi.set_devicePixelRatio(this, value);
	public var height(get, set):Single;

	inline function get_height():Single return Viewport_Ffi.get_height(this);

	inline function set_height(value:Single):Single return Viewport_Ffi.set_height(this, value);
	public var width(get, set):Single;

	inline function get_width():Single return Viewport_Ffi.get_width(this);

	inline function set_width(value:Single):Single return Viewport_Ffi.set_width(this, value);
	public var x(get, set):Single;

	inline function get_x():Single return Viewport_Ffi.get_x(this);

	inline function set_x(value:Single):Single return Viewport_Ffi.set_x(this, value);
	public var y(get, set):Single;

	inline function get_y():Single return Viewport_Ffi.get_y(this);

	inline function set_y(value:Single):Single return Viewport_Ffi.set_y(this, value);

	static inline public function create():flight._cpp.Viewport {
		return flight._cpp._fn.Node.createViewport();
	}
	inline public function getAspect():Single {
		return flight._cpp._fn.Node.getViewportAspect(cast this);
	}
	inline public function free():Void {
		flight._cpp._fn.Node.freeViewport(cast this);
	}
}
