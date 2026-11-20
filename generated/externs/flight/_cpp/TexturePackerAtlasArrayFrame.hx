package flight._cpp;

private extern class TexturePackerAtlasArrayFrame_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_texture_packer_atlas_array_frame_filename") static function get_filename(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_texture_packer_atlas_array_frame_filename") static function set_filename(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_texture_packer_atlas_array_frame_rotated") static function get_rotated(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_texture_packer_atlas_array_frame_rotated") static function set_rotated(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_texture_packer_atlas_array_frame_trimmed") static function get_trimmed(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_texture_packer_atlas_array_frame_trimmed") static function set_trimmed(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract TexturePackerAtlasArrayFrame(cpp.Star<cpp.Void>) {
	public var filename(get, set):String;
	inline function get_filename():String { var raw = TexturePackerAtlasArrayFrame_Ffi.get_filename(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); TexturePackerAtlasArrayFrame_Ffi.freeString(raw); return value; }
	inline function set_filename(value:String):String { var raw:cpp.ConstCharStar = cast value; TexturePackerAtlasArrayFrame_Ffi.set_filename(this, raw); return value; }
	public var rotated(get, set):Bool;

	inline function get_rotated():Bool return TexturePackerAtlasArrayFrame_Ffi.get_rotated(this);

	inline function set_rotated(value:Bool):Bool { TexturePackerAtlasArrayFrame_Ffi.set_rotated(this, value); return value; }
	public var trimmed(get, set):Bool;

	inline function get_trimmed():Bool return TexturePackerAtlasArrayFrame_Ffi.get_trimmed(this);

	inline function set_trimmed(value:Bool):Bool { TexturePackerAtlasArrayFrame_Ffi.set_trimmed(this, value); return value; }
}
