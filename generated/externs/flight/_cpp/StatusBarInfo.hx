package flight._cpp;

private extern class StatusBarInfo_Ffi {
	@:native("flight_get_status_bar_info_color") static function get_color(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_status_bar_info_color") static function set_color(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_status_bar_info_height") static function get_height(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_status_bar_info_height") static function set_height(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_status_bar_info_overlays_content") static function get_overlaysContent(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_status_bar_info_overlays_content") static function set_overlaysContent(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_status_bar_info_visible") static function get_visible(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_status_bar_info_visible") static function set_visible(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract StatusBarInfo(cpp.Star<cpp.Void>) {
	public var color(get, set):Int;

	inline function get_color():Int return StatusBarInfo_Ffi.get_color(this);

	inline function set_color(value:Int):Int { StatusBarInfo_Ffi.set_color(this, value); return value; }
	public var height(get, set):Single;

	inline function get_height():Single return StatusBarInfo_Ffi.get_height(this);

	inline function set_height(value:Single):Single { StatusBarInfo_Ffi.set_height(this, value); return value; }
	public var overlaysContent(get, set):Bool;

	inline function get_overlaysContent():Bool return StatusBarInfo_Ffi.get_overlaysContent(this);

	inline function set_overlaysContent(value:Bool):Bool { StatusBarInfo_Ffi.set_overlaysContent(this, value); return value; }
	public var visible(get, set):Bool;

	inline function get_visible():Bool return StatusBarInfo_Ffi.get_visible(this);

	inline function set_visible(value:Bool):Bool { StatusBarInfo_Ffi.set_visible(this, value); return value; }
}
