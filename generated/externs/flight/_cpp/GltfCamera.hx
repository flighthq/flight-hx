package flight._cpp;

private extern class GltfCamera_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_gltf_camera_type") static function get_type(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_gltf_camera_type") static function set_type(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract GltfCamera(cpp.Star<cpp.Void>) {
	public var type(get, set):String;
	inline function get_type():String { var raw = GltfCamera_Ffi.get_type(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); GltfCamera_Ffi.freeString(raw); return value; }
	inline function set_type(value:String):String { var raw:cpp.ConstCharStar = cast value; GltfCamera_Ffi.set_type(this, raw); return value; }
}
