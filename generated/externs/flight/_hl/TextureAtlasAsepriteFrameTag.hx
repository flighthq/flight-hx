package flight._hl;

private extern class TextureAtlasAsepriteFrameTag_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_texture_atlas_aseprite_frame_tag_name")
	static function get_name(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_texture_atlas_aseprite_frame_tag_name")
	static function set_name(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract TextureAtlasAsepriteFrameTag(hl.Bytes) {
	public var from(get, set):Int;

	inline function get_from():Int return this.getI32(28);

	inline function set_from(value:Int):Int { this.setI32(28, value); return value; }
	public var name(get, set):String;
	inline function get_name():String { var raw = TextureAtlasAsepriteFrameTag_Ffi.get_name(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); TextureAtlasAsepriteFrameTag_Ffi.freeString(raw); return value; }
	inline function set_name(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } TextureAtlasAsepriteFrameTag_Ffi.set_name(this, raw); return value; }
	public var to(get, set):Int;

	inline function get_to():Int return this.getI32(56);

	inline function set_to(value:Int):Int { this.setI32(56, value); return value; }
}
