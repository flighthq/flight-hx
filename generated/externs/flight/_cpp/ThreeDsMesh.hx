package flight._cpp;

private extern class ThreeDsMesh_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_three_ds_mesh_name") static function get_name(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_three_ds_mesh_name") static function set_name(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract ThreeDsMesh(cpp.Star<cpp.Void>) {
	public var name(get, set):String;
	inline function get_name():String { var raw = ThreeDsMesh_Ffi.get_name(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); ThreeDsMesh_Ffi.freeString(raw); return value; }
	inline function set_name(value:String):String { var raw:cpp.ConstCharStar = cast value; ThreeDsMesh_Ffi.set_name(this, raw); return value; }
}
