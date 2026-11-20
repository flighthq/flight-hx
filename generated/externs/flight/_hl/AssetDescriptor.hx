package flight._hl;

private extern class AssetDescriptor_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_asset_descriptor_id")
	static function get_id(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_asset_descriptor_id")
	static function set_id(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_asset_descriptor_url")
	static function get_url(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_asset_descriptor_url")
	static function set_url(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract AssetDescriptor(hl.Bytes) {
	public var id(get, set):String;
	inline function get_id():String { var raw = AssetDescriptor_Ffi.get_id(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); AssetDescriptor_Ffi.freeString(raw); return value; }
	inline function set_id(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } AssetDescriptor_Ffi.set_id(this, raw); return value; }
	public var url(get, set):String;
	inline function get_url():String { var raw = AssetDescriptor_Ffi.get_url(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); AssetDescriptor_Ffi.freeString(raw); return value; }
	inline function set_url(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } AssetDescriptor_Ffi.set_url(this, raw); return value; }
}
