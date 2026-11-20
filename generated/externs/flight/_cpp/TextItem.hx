package flight._cpp;

private extern class TextItem_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_get_text_item_end") static function get_end(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_text_item_end") static function set_end(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_field_get_text_item_script") static function get_script(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_text_item_script") static function set_script(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_text_item_start") static function get_start(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_text_item_start") static function set_start(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract TextItem(cpp.Star<cpp.Void>) {
	public var end(get, set):Int;

	inline function get_end():Int return TextItem_Ffi.get_end(this);

	inline function set_end(value:Int):Int { TextItem_Ffi.set_end(this, value); return value; }
	public var script(get, set):String;
	inline function get_script():String { var raw = TextItem_Ffi.get_script(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); TextItem_Ffi.freeString(raw); return value; }
	inline function set_script(value:String):String { var raw:cpp.ConstCharStar = cast value; TextItem_Ffi.set_script(this, raw); return value; }
	public var start(get, set):Int;

	inline function get_start():Int return TextItem_Ffi.get_start(this);

	inline function set_start(value:Int):Int { TextItem_Ffi.set_start(this, value); return value; }
}
