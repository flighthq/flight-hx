package flight._cpp;

private extern class CocosPlistMetadata_Ffi {
	@:native("flight_get_cocos_plist_metadata_format") static function get_format(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_cocos_plist_metadata_format") static function set_format(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract CocosPlistMetadata(cpp.Star<cpp.Void>) {
	public var format(get, set):Int;

	inline function get_format():Int return CocosPlistMetadata_Ffi.get_format(this);

	inline function set_format(value:Int):Int return CocosPlistMetadata_Ffi.set_format(this, value);
}
