package flight._hl;

private extern class CocosPlistFrame_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_cocos_plist_frame_frame")
	static function get_frame(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_cocos_plist_frame_frame")
	static function set_frame(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_cocos_plist_frame_sprite_offset")
	static function get_spriteOffset(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_cocos_plist_frame_sprite_offset")
	static function set_spriteOffset(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_cocos_plist_frame_sprite_size")
	static function get_spriteSize(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_cocos_plist_frame_sprite_size")
	static function set_spriteSize(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_cocos_plist_frame_sprite_source_size")
	static function get_spriteSourceSize(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_cocos_plist_frame_sprite_source_size")
	static function set_spriteSourceSize(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract CocosPlistFrame(hl.Bytes) {
	public var frame(get, set):String;
	inline function get_frame():String { var raw = CocosPlistFrame_Ffi.get_frame(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); CocosPlistFrame_Ffi.freeString(raw); return value; }
	inline function set_frame(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } CocosPlistFrame_Ffi.set_frame(this, raw); return value; }
	public var spriteOffset(get, set):String;
	inline function get_spriteOffset():String { var raw = CocosPlistFrame_Ffi.get_spriteOffset(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); CocosPlistFrame_Ffi.freeString(raw); return value; }
	inline function set_spriteOffset(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } CocosPlistFrame_Ffi.set_spriteOffset(this, raw); return value; }
	public var spriteSize(get, set):String;
	inline function get_spriteSize():String { var raw = CocosPlistFrame_Ffi.get_spriteSize(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); CocosPlistFrame_Ffi.freeString(raw); return value; }
	inline function set_spriteSize(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } CocosPlistFrame_Ffi.set_spriteSize(this, raw); return value; }
	public var spriteSourceSize(get, set):String;
	inline function get_spriteSourceSize():String { var raw = CocosPlistFrame_Ffi.get_spriteSourceSize(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); CocosPlistFrame_Ffi.freeString(raw); return value; }
	inline function set_spriteSourceSize(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } CocosPlistFrame_Ffi.set_spriteSourceSize(this, raw); return value; }
	public var spriteTrimmed(get, set):Bool;

	inline function get_spriteTrimmed():Bool return this.getUI8(120) != 0;

	inline function set_spriteTrimmed(value:Bool):Bool { this.setUI8(120, value ? 1 : 0); return value; }
	public var textureRotated(get, set):Bool;

	inline function get_textureRotated():Bool return this.getUI8(121) != 0;

	inline function set_textureRotated(value:Bool):Bool { this.setUI8(121, value ? 1 : 0); return value; }
}
