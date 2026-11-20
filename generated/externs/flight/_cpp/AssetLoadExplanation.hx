package flight._cpp;

private extern class AssetLoadExplanation_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_asset_load_explanation_id") static function get_id(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_asset_load_explanation_id") static function set_id(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_asset_load_explanation_ref_count") static function get_refCount(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_asset_load_explanation_ref_count") static function set_refCount(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract AssetLoadExplanation(cpp.Star<cpp.Void>) {
	public var id(get, set):String;
	inline function get_id():String { var raw = AssetLoadExplanation_Ffi.get_id(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); AssetLoadExplanation_Ffi.freeString(raw); return value; }
	inline function set_id(value:String):String { var raw:cpp.ConstCharStar = cast value; AssetLoadExplanation_Ffi.set_id(this, raw); return value; }
	public var refCount(get, set):Int;

	inline function get_refCount():Int return AssetLoadExplanation_Ffi.get_refCount(this);

	inline function set_refCount(value:Int):Int { AssetLoadExplanation_Ffi.set_refCount(this, value); return value; }
}
