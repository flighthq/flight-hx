package flight._cpp;

private extern class CocosPlistMetadata_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_get_cocos_plist_metadata_format") static function get_format(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_cocos_plist_metadata_format") static function set_format(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_field_get_cocos_plist_metadata_size") static function get_size(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_cocos_plist_metadata_size") static function set_size(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_cocos_plist_metadata_texture_file_name") static function get_textureFileName(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_cocos_plist_metadata_texture_file_name") static function set_textureFileName(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract CocosPlistMetadata(cpp.Star<cpp.Void>) {
	public var format(get, set):Int;

	inline function get_format():Int return CocosPlistMetadata_Ffi.get_format(this);

	inline function set_format(value:Int):Int { CocosPlistMetadata_Ffi.set_format(this, value); return value; }
	public var size(get, set):String;
	inline function get_size():String { var raw = CocosPlistMetadata_Ffi.get_size(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); CocosPlistMetadata_Ffi.freeString(raw); return value; }
	inline function set_size(value:String):String { var raw:cpp.ConstCharStar = cast value; CocosPlistMetadata_Ffi.set_size(this, raw); return value; }
	public var textureFileName(get, set):String;
	inline function get_textureFileName():String { var raw = CocosPlistMetadata_Ffi.get_textureFileName(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); CocosPlistMetadata_Ffi.freeString(raw); return value; }
	inline function set_textureFileName(value:String):String { var raw:cpp.ConstCharStar = cast value; CocosPlistMetadata_Ffi.set_textureFileName(this, raw); return value; }
}
