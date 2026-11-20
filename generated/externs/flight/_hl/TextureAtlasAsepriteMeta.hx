package flight._hl;

private extern class TextureAtlasAsepriteMeta_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_texture_atlas_aseprite_meta_app")
	static function get_app(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_texture_atlas_aseprite_meta_app")
	static function set_app(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_texture_atlas_aseprite_meta_format")
	static function get_format(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_texture_atlas_aseprite_meta_format")
	static function set_format(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_texture_atlas_aseprite_meta_image")
	static function get_image(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_texture_atlas_aseprite_meta_image")
	static function set_image(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_texture_atlas_aseprite_meta_version")
	static function get_version(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_texture_atlas_aseprite_meta_version")
	static function set_version(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract TextureAtlasAsepriteMeta(hl.Bytes) {
	public var app(get, set):String;
	inline function get_app():String { var raw = TextureAtlasAsepriteMeta_Ffi.get_app(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); TextureAtlasAsepriteMeta_Ffi.freeString(raw); return value; }
	inline function set_app(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } TextureAtlasAsepriteMeta_Ffi.set_app(this, raw); return value; }
	public var format(get, set):String;
	inline function get_format():String { var raw = TextureAtlasAsepriteMeta_Ffi.get_format(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); TextureAtlasAsepriteMeta_Ffi.freeString(raw); return value; }
	inline function set_format(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } TextureAtlasAsepriteMeta_Ffi.set_format(this, raw); return value; }
	public var image(get, set):String;
	inline function get_image():String { var raw = TextureAtlasAsepriteMeta_Ffi.get_image(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); TextureAtlasAsepriteMeta_Ffi.freeString(raw); return value; }
	inline function set_image(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } TextureAtlasAsepriteMeta_Ffi.set_image(this, raw); return value; }
	public var version(get, set):String;
	inline function get_version():String { var raw = TextureAtlasAsepriteMeta_Ffi.get_version(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); TextureAtlasAsepriteMeta_Ffi.freeString(raw); return value; }
	inline function set_version(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } TextureAtlasAsepriteMeta_Ffi.set_version(this, raw); return value; }
}
