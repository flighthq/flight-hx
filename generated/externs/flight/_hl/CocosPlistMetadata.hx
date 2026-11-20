package flight._hl;

private extern class CocosPlistMetadata_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_cocos_plist_metadata_size")
	static function get_size(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_cocos_plist_metadata_size")
	static function set_size(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_cocos_plist_metadata_texture_file_name")
	static function get_textureFileName(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_cocos_plist_metadata_texture_file_name")
	static function set_textureFileName(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract CocosPlistMetadata(hl.Bytes) {
	public var format(get, set):Int;

	inline function get_format():Int return this.getI32(0);

	inline function set_format(value:Int):Int { this.setI32(0, value); return value; }
	public var size(get, set):String;
	inline function get_size():String { var raw = CocosPlistMetadata_Ffi.get_size(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); CocosPlistMetadata_Ffi.freeString(raw); return value; }
	inline function set_size(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } CocosPlistMetadata_Ffi.set_size(this, raw); return value; }
	public var textureFileName(get, set):String;
	inline function get_textureFileName():String { var raw = CocosPlistMetadata_Ffi.get_textureFileName(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); CocosPlistMetadata_Ffi.freeString(raw); return value; }
	inline function set_textureFileName(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } CocosPlistMetadata_Ffi.set_textureFileName(this, raw); return value; }
}
