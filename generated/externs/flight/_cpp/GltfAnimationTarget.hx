package flight._cpp;

private extern class GltfAnimationTarget_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_gltf_animation_target_path") static function get_path(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_gltf_animation_target_path") static function set_path(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract GltfAnimationTarget(cpp.Star<cpp.Void>) {
	public var path(get, set):String;
	inline function get_path():String { var raw = GltfAnimationTarget_Ffi.get_path(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); GltfAnimationTarget_Ffi.freeString(raw); return value; }
	inline function set_path(value:String):String { var raw:cpp.ConstCharStar = cast value; GltfAnimationTarget_Ffi.set_path(this, raw); return value; }
}
