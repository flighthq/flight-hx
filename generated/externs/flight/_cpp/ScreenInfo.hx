package flight._cpp;

private extern class ScreenInfo_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_get_screen_info_id") static function get_id(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_screen_info_id") static function set_id(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_screen_info_x") static function get_x(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_screen_info_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_screen_info_y") static function get_y(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_screen_info_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_screen_info_width") static function get_width(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_screen_info_width") static function set_width(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_screen_info_height") static function get_height(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_screen_info_height") static function set_height(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_screen_info_work_width") static function get_workWidth(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_screen_info_work_width") static function set_workWidth(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_screen_info_work_height") static function get_workHeight(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_screen_info_work_height") static function set_workHeight(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_screen_info_scale_factor") static function get_scaleFactor(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_screen_info_scale_factor") static function set_scaleFactor(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_screen_info_is_primary") static function get_isPrimary(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_screen_info_is_primary") static function set_isPrimary(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_screen_info_rotation") static function get_rotation(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_screen_info_rotation") static function set_rotation(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_screen_info_refresh_rate") static function get_refreshRate(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_screen_info_refresh_rate") static function set_refreshRate(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_screen_info_color_depth") static function get_colorDepth(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_screen_info_color_depth") static function set_colorDepth(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_screen_info_pixel_depth") static function get_pixelDepth(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_screen_info_pixel_depth") static function set_pixelDepth(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_screen_info_physical_width") static function get_physicalWidth(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_screen_info_physical_width") static function set_physicalWidth(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_screen_info_physical_height") static function get_physicalHeight(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_screen_info_physical_height") static function set_physicalHeight(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_screen_info_is_hdr") static function get_isHdr(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_screen_info_is_hdr") static function set_isHdr(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_screen_info_max_luminance") static function get_maxLuminance(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_screen_info_max_luminance") static function set_maxLuminance(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_screen_info_depth_per_component") static function get_depthPerComponent(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_screen_info_depth_per_component") static function set_depthPerComponent(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_screen_info_dpi") static function get_dpi(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_screen_info_dpi") static function set_dpi(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_field_get_screen_info_label") static function get_label(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_screen_info_label") static function set_label(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_screen_info_internal") static function get_internal(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_screen_info_internal") static function set_internal(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_field_get_screen_info_touch_support") static function get_touchSupport(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_screen_info_touch_support") static function set_touchSupport(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_screen_info_monochrome") static function get_monochrome(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_screen_info_monochrome") static function set_monochrome(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract ScreenInfo(cpp.Star<cpp.Void>) {
	public var id(get, set):Float;

	inline function get_id():Float return ScreenInfo_Ffi.get_id(this);

	inline function set_id(value:Float):Float { ScreenInfo_Ffi.set_id(this, value); return value; }
	public var x(get, set):Float;

	inline function get_x():Float return ScreenInfo_Ffi.get_x(this);

	inline function set_x(value:Float):Float { ScreenInfo_Ffi.set_x(this, value); return value; }
	public var y(get, set):Float;

	inline function get_y():Float return ScreenInfo_Ffi.get_y(this);

	inline function set_y(value:Float):Float { ScreenInfo_Ffi.set_y(this, value); return value; }
	public var width(get, set):Float;

	inline function get_width():Float return ScreenInfo_Ffi.get_width(this);

	inline function set_width(value:Float):Float { ScreenInfo_Ffi.set_width(this, value); return value; }
	public var height(get, set):Float;

	inline function get_height():Float return ScreenInfo_Ffi.get_height(this);

	inline function set_height(value:Float):Float { ScreenInfo_Ffi.set_height(this, value); return value; }
	public var workWidth(get, set):Float;

	inline function get_workWidth():Float return ScreenInfo_Ffi.get_workWidth(this);

	inline function set_workWidth(value:Float):Float { ScreenInfo_Ffi.set_workWidth(this, value); return value; }
	public var workHeight(get, set):Float;

	inline function get_workHeight():Float return ScreenInfo_Ffi.get_workHeight(this);

	inline function set_workHeight(value:Float):Float { ScreenInfo_Ffi.set_workHeight(this, value); return value; }
	public var scaleFactor(get, set):Float;

	inline function get_scaleFactor():Float return ScreenInfo_Ffi.get_scaleFactor(this);

	inline function set_scaleFactor(value:Float):Float { ScreenInfo_Ffi.set_scaleFactor(this, value); return value; }
	public var isPrimary(get, set):Bool;

	inline function get_isPrimary():Bool return ScreenInfo_Ffi.get_isPrimary(this);

	inline function set_isPrimary(value:Bool):Bool { ScreenInfo_Ffi.set_isPrimary(this, value); return value; }
	public var rotation(get, set):Float;

	inline function get_rotation():Float return ScreenInfo_Ffi.get_rotation(this);

	inline function set_rotation(value:Float):Float { ScreenInfo_Ffi.set_rotation(this, value); return value; }
	public var refreshRate(get, set):Float;

	inline function get_refreshRate():Float return ScreenInfo_Ffi.get_refreshRate(this);

	inline function set_refreshRate(value:Float):Float { ScreenInfo_Ffi.set_refreshRate(this, value); return value; }
	public var colorDepth(get, set):Float;

	inline function get_colorDepth():Float return ScreenInfo_Ffi.get_colorDepth(this);

	inline function set_colorDepth(value:Float):Float { ScreenInfo_Ffi.set_colorDepth(this, value); return value; }
	public var pixelDepth(get, set):Float;

	inline function get_pixelDepth():Float return ScreenInfo_Ffi.get_pixelDepth(this);

	inline function set_pixelDepth(value:Float):Float { ScreenInfo_Ffi.set_pixelDepth(this, value); return value; }
	public var physicalWidth(get, set):Float;

	inline function get_physicalWidth():Float return ScreenInfo_Ffi.get_physicalWidth(this);

	inline function set_physicalWidth(value:Float):Float { ScreenInfo_Ffi.set_physicalWidth(this, value); return value; }
	public var physicalHeight(get, set):Float;

	inline function get_physicalHeight():Float return ScreenInfo_Ffi.get_physicalHeight(this);

	inline function set_physicalHeight(value:Float):Float { ScreenInfo_Ffi.set_physicalHeight(this, value); return value; }
	public var isHdr(get, set):Bool;

	inline function get_isHdr():Bool return ScreenInfo_Ffi.get_isHdr(this);

	inline function set_isHdr(value:Bool):Bool { ScreenInfo_Ffi.set_isHdr(this, value); return value; }
	public var maxLuminance(get, set):Float;

	inline function get_maxLuminance():Float return ScreenInfo_Ffi.get_maxLuminance(this);

	inline function set_maxLuminance(value:Float):Float { ScreenInfo_Ffi.set_maxLuminance(this, value); return value; }
	public var depthPerComponent(get, set):Float;

	inline function get_depthPerComponent():Float return ScreenInfo_Ffi.get_depthPerComponent(this);

	inline function set_depthPerComponent(value:Float):Float { ScreenInfo_Ffi.set_depthPerComponent(this, value); return value; }
	public var dpi(get, set):Float;

	inline function get_dpi():Float return ScreenInfo_Ffi.get_dpi(this);

	inline function set_dpi(value:Float):Float { ScreenInfo_Ffi.set_dpi(this, value); return value; }
	public var label(get, set):String;
	inline function get_label():String { var raw = ScreenInfo_Ffi.get_label(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); ScreenInfo_Ffi.freeString(raw); return value; }
	inline function set_label(value:String):String { var raw:cpp.ConstCharStar = cast value; ScreenInfo_Ffi.set_label(this, raw); return value; }
	public var internal(get, set):Bool;

	inline function get_internal():Bool return ScreenInfo_Ffi.get_internal(this);

	inline function set_internal(value:Bool):Bool { ScreenInfo_Ffi.set_internal(this, value); return value; }
	public var touchSupport(get, set):String;
	inline function get_touchSupport():String { var raw = ScreenInfo_Ffi.get_touchSupport(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); ScreenInfo_Ffi.freeString(raw); return value; }
	inline function set_touchSupport(value:String):String { var raw:cpp.ConstCharStar = cast value; ScreenInfo_Ffi.set_touchSupport(this, raw); return value; }
	public var monochrome(get, set):Bool;

	inline function get_monochrome():Bool return ScreenInfo_Ffi.get_monochrome(this);

	inline function set_monochrome(value:Bool):Bool { ScreenInfo_Ffi.set_monochrome(this, value); return value; }
}
