package flight._cpp;

private extern class StorageNamespace_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_storage_namespace_prefix") static function get_prefix(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_storage_namespace_prefix") static function set_prefix(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract StorageNamespace(cpp.Star<cpp.Void>) {
	public var prefix(get, set):String;
	inline function get_prefix():String { var raw = StorageNamespace_Ffi.get_prefix(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); StorageNamespace_Ffi.freeString(raw); return value; }
	inline function set_prefix(value:String):String { var raw:cpp.ConstCharStar = cast value; StorageNamespace_Ffi.set_prefix(this, raw); return value; }
}
