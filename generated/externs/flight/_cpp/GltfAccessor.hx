package flight._cpp;

private extern class GltfAccessor_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_get_gltf_accessor_count") static function get_count(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_gltf_accessor_count") static function set_count(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_field_get_gltf_accessor_type") static function get_type(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_gltf_accessor_type") static function set_type(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract GltfAccessor(cpp.Star<cpp.Void>) {
	public var count(get, set):Float;

	inline function get_count():Float return GltfAccessor_Ffi.get_count(this);

	inline function set_count(value:Float):Float { GltfAccessor_Ffi.set_count(this, value); return value; }
	public var type(get, set):String;
	inline function get_type():String { var raw = GltfAccessor_Ffi.get_type(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); GltfAccessor_Ffi.freeString(raw); return value; }
	inline function set_type(value:String):String { var raw:cpp.ConstCharStar = cast value; GltfAccessor_Ffi.set_type(this, raw); return value; }
}
