package flight._hl;

private extern class ImageUrlOriginContext_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_image_url_origin_context_href")
	static function get_href(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_image_url_origin_context_href")
	static function set_href(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_image_url_origin_context_origin")
	static function get_origin(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_image_url_origin_context_origin")
	static function set_origin(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract ImageUrlOriginContext(hl.Bytes) {
	public var href(get, set):String;
	inline function get_href():String { var raw = ImageUrlOriginContext_Ffi.get_href(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); ImageUrlOriginContext_Ffi.freeString(raw); return value; }
	inline function set_href(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } ImageUrlOriginContext_Ffi.set_href(this, raw); return value; }
	public var origin(get, set):String;
	inline function get_origin():String { var raw = ImageUrlOriginContext_Ffi.get_origin(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); ImageUrlOriginContext_Ffi.freeString(raw); return value; }
	inline function set_origin(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } ImageUrlOriginContext_Ffi.set_origin(this, raw); return value; }
}
