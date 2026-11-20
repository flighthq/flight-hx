package flight._hl;

private extern class ImageBitmapComposition_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_image_bitmap_composition_kind")
	static function get_kind(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_image_bitmap_composition_kind")
	static function set_kind(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract ImageBitmapComposition(hl.Bytes) {
	public var kind(get, set):String;
	inline function get_kind():String { var raw = ImageBitmapComposition_Ffi.get_kind(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); ImageBitmapComposition_Ffi.freeString(raw); return value; }
	inline function set_kind(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } ImageBitmapComposition_Ffi.set_kind(this, raw); return value; }
}
