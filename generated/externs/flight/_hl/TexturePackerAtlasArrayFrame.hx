package flight._hl;

private extern class TexturePackerAtlasArrayFrame_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_texture_packer_atlas_array_frame_filename")
	static function get_filename(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_texture_packer_atlas_array_frame_filename")
	static function set_filename(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract TexturePackerAtlasArrayFrame(hl.Bytes) {
	public var filename(get, set):String;
	inline function get_filename():String { var raw = TexturePackerAtlasArrayFrame_Ffi.get_filename(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); TexturePackerAtlasArrayFrame_Ffi.freeString(raw); return value; }
	inline function set_filename(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } TexturePackerAtlasArrayFrame_Ffi.set_filename(this, raw); return value; }
	public var rotated(get, set):Bool;

	inline function get_rotated():Bool return this.getUI8(52) != 0;

	inline function set_rotated(value:Bool):Bool { this.setUI8(52, value ? 1 : 0); return value; }
	public var trimmed(get, set):Bool;

	inline function get_trimmed():Bool return this.getUI8(80) != 0;

	inline function set_trimmed(value:Bool):Bool { this.setUI8(80, value ? 1 : 0); return value; }
}
