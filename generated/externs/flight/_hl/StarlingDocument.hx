package flight._hl;

private extern class StarlingDocument_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_starling_document_image_path")
	static function get_imagePath(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_starling_document_image_path")
	static function set_imagePath(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract StarlingDocument(hl.Bytes) {
	public var imagePath(get, set):String;
	inline function get_imagePath():String { var raw = StarlingDocument_Ffi.get_imagePath(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); StarlingDocument_Ffi.freeString(raw); return value; }
	inline function set_imagePath(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } StarlingDocument_Ffi.set_imagePath(this, raw); return value; }
}
