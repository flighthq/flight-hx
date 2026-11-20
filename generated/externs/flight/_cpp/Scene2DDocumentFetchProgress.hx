package flight._cpp;

private extern class Scene2DDocumentFetchProgress_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_get_scene2_ddocument_fetch_progress_loaded") static function get_loaded(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_scene2_ddocument_fetch_progress_loaded") static function set_loaded(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_scene2_ddocument_fetch_progress_total") static function get_total(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_scene2_ddocument_fetch_progress_total") static function set_total(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_field_get_scene2_ddocument_fetch_progress_url") static function get_url(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_scene2_ddocument_fetch_progress_url") static function set_url(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract Scene2DDocumentFetchProgress(cpp.Star<cpp.Void>) {
	public var loaded(get, set):Int;

	inline function get_loaded():Int return Scene2DDocumentFetchProgress_Ffi.get_loaded(this);

	inline function set_loaded(value:Int):Int { Scene2DDocumentFetchProgress_Ffi.set_loaded(this, value); return value; }
	public var total(get, set):Int;

	inline function get_total():Int return Scene2DDocumentFetchProgress_Ffi.get_total(this);

	inline function set_total(value:Int):Int { Scene2DDocumentFetchProgress_Ffi.set_total(this, value); return value; }
	public var url(get, set):String;
	inline function get_url():String { var raw = Scene2DDocumentFetchProgress_Ffi.get_url(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); Scene2DDocumentFetchProgress_Ffi.freeString(raw); return value; }
	inline function set_url(value:String):String { var raw:cpp.ConstCharStar = cast value; Scene2DDocumentFetchProgress_Ffi.set_url(this, raw); return value; }
}
