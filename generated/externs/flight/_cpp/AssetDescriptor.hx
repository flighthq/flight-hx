package flight._cpp;

private extern class AssetDescriptor_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_asset_descriptor_id") static function get_id(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_asset_descriptor_id") static function set_id(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_asset_descriptor_url") static function get_url(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_asset_descriptor_url") static function set_url(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract AssetDescriptor(cpp.Star<cpp.Void>) {
	public var id(get, set):String;
	inline function get_id():String { var raw = AssetDescriptor_Ffi.get_id(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); AssetDescriptor_Ffi.freeString(raw); return value; }
	inline function set_id(value:String):String { var raw:cpp.ConstCharStar = cast value; AssetDescriptor_Ffi.set_id(this, raw); return value; }
	public var url(get, set):String;
	inline function get_url():String { var raw = AssetDescriptor_Ffi.get_url(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); AssetDescriptor_Ffi.freeString(raw); return value; }
	inline function set_url(value:String):String { var raw:cpp.ConstCharStar = cast value; AssetDescriptor_Ffi.set_url(this, raw); return value; }
}
