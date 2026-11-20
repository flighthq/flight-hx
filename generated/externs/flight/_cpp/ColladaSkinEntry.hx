package flight._cpp;

private extern class ColladaSkinEntry_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_collada_skin_entry_key") static function get_key(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_collada_skin_entry_key") static function set_key(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract ColladaSkinEntry(cpp.Star<cpp.Void>) {
	public var key(get, set):String;
	inline function get_key():String { var raw = ColladaSkinEntry_Ffi.get_key(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); ColladaSkinEntry_Ffi.freeString(raw); return value; }
	inline function set_key(value:String):String { var raw:cpp.ConstCharStar = cast value; ColladaSkinEntry_Ffi.set_key(this, raw); return value; }
}
