package flight._cpp;

private extern class HtmlViewData_Ffi {
	@:native("flight_get_html_view_data_height") static function get_height(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_html_view_data_height") static function set_height(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_html_view_data_width") static function get_width(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_html_view_data_width") static function set_width(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract HtmlViewData(cpp.Star<cpp.Void>) {
	public var height(get, set):Float;

	inline function get_height():Float return HtmlViewData_Ffi.get_height(this);

	inline function set_height(value:Float):Float return HtmlViewData_Ffi.set_height(this, value);
	public var width(get, set):Float;

	inline function get_width():Float return HtmlViewData_Ffi.get_width(this);

	inline function set_width(value:Float):Float return HtmlViewData_Ffi.set_width(this, value);
}
