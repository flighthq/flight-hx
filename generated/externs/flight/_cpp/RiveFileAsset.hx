package flight._cpp;

private extern class RiveFileAsset_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_rive_file_asset_cdn_base_url") static function get_cdnBaseUrl(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_rive_file_asset_cdn_base_url") static function set_cdnBaseUrl(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_rive_file_asset_height") static function get_height(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rive_file_asset_height") static function set_height(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_field_get_rive_file_asset_kind") static function get_kind(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_rive_file_asset_kind") static function set_kind(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_rive_file_asset_name") static function get_name(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_rive_file_asset_name") static function set_name(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_rive_file_asset_width") static function get_width(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_rive_file_asset_width") static function set_width(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract RiveFileAsset(cpp.Star<cpp.Void>) {
	public var cdnBaseUrl(get, set):String;
	inline function get_cdnBaseUrl():String { var raw = RiveFileAsset_Ffi.get_cdnBaseUrl(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); RiveFileAsset_Ffi.freeString(raw); return value; }
	inline function set_cdnBaseUrl(value:String):String { var raw:cpp.ConstCharStar = cast value; RiveFileAsset_Ffi.set_cdnBaseUrl(this, raw); return value; }
	public var height(get, set):Float;

	inline function get_height():Float return RiveFileAsset_Ffi.get_height(this);

	inline function set_height(value:Float):Float { RiveFileAsset_Ffi.set_height(this, value); return value; }
	public var kind(get, set):String;
	inline function get_kind():String { var raw = RiveFileAsset_Ffi.get_kind(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); RiveFileAsset_Ffi.freeString(raw); return value; }
	inline function set_kind(value:String):String { var raw:cpp.ConstCharStar = cast value; RiveFileAsset_Ffi.set_kind(this, raw); return value; }
	public var name(get, set):String;
	inline function get_name():String { var raw = RiveFileAsset_Ffi.get_name(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); RiveFileAsset_Ffi.freeString(raw); return value; }
	inline function set_name(value:String):String { var raw:cpp.ConstCharStar = cast value; RiveFileAsset_Ffi.set_name(this, raw); return value; }
	public var width(get, set):Float;

	inline function get_width():Float return RiveFileAsset_Ffi.get_width(this);

	inline function set_width(value:Float):Float { RiveFileAsset_Ffi.set_width(this, value); return value; }
}
