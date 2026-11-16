package flight._cpp;

private extern class SfntFontTable_Ffi {
	@:native("flight_get_sfnt_font_table_tag") static function get_tag(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_sfnt_font_table_tag") static function set_tag(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract SfntFontTable(cpp.Star<cpp.Void>) {
	public var tag(get, set):Int;

	inline function get_tag():Int return SfntFontTable_Ffi.get_tag(this);

	inline function set_tag(value:Int):Int { SfntFontTable_Ffi.set_tag(this, value); return value; }
}
