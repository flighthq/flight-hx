package flight._cpp;

private extern class TrayTooltipReading_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_tray_tooltip_reading_tooltip") static function get_tooltip(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_tray_tooltip_reading_tooltip") static function set_tooltip(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract TrayTooltipReading(cpp.Star<cpp.Void>) {
	public var tooltip(get, set):String;
	inline function get_tooltip():String { var raw = TrayTooltipReading_Ffi.get_tooltip(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); TrayTooltipReading_Ffi.freeString(raw); return value; }
	inline function set_tooltip(value:String):String { var raw:cpp.ConstCharStar = cast value; TrayTooltipReading_Ffi.set_tooltip(this, raw); return value; }
}
