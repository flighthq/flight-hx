package flight._cpp;

private extern class GltfAsset_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_gltf_asset_version") static function get_version(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_gltf_asset_version") static function set_version(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract GltfAsset(cpp.Star<cpp.Void>) {
	public var version(get, set):String;
	inline function get_version():String { var raw = GltfAsset_Ffi.get_version(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); GltfAsset_Ffi.freeString(raw); return value; }
	inline function set_version(value:String):String { var raw:cpp.ConstCharStar = cast value; GltfAsset_Ffi.set_version(this, raw); return value; }
}
