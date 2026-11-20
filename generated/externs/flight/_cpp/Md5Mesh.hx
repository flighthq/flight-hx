package flight._cpp;

private extern class Md5Mesh_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_md5_mesh_shader") static function get_shader(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_md5_mesh_shader") static function set_shader(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract Md5Mesh(cpp.Star<cpp.Void>) {
	public var shader(get, set):String;
	inline function get_shader():String { var raw = Md5Mesh_Ffi.get_shader(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); Md5Mesh_Ffi.freeString(raw); return value; }
	inline function set_shader(value:String):String { var raw:cpp.ConstCharStar = cast value; Md5Mesh_Ffi.set_shader(this, raw); return value; }
}
