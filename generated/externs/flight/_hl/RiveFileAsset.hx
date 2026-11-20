package flight._hl;

private extern class RiveFileAsset_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_rive_file_asset_cdn_base_url")
	static function get_cdnBaseUrl(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_rive_file_asset_cdn_base_url")
	static function set_cdnBaseUrl(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_rive_file_asset_kind")
	static function get_kind(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_rive_file_asset_kind")
	static function set_kind(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_rive_file_asset_name")
	static function get_name(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_rive_file_asset_name")
	static function set_name(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract RiveFileAsset(hl.Bytes) {
	public var cdnBaseUrl(get, set):String;
	inline function get_cdnBaseUrl():String { var raw = RiveFileAsset_Ffi.get_cdnBaseUrl(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); RiveFileAsset_Ffi.freeString(raw); return value; }
	inline function set_cdnBaseUrl(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } RiveFileAsset_Ffi.set_cdnBaseUrl(this, raw); return value; }
	public var height(get, set):Float;

	inline function get_height():Float return this.getF64(40);

	inline function set_height(value:Float):Float { this.setF64(40, value); return value; }
	public var kind(get, set):String;
	inline function get_kind():String { var raw = RiveFileAsset_Ffi.get_kind(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); RiveFileAsset_Ffi.freeString(raw); return value; }
	inline function set_kind(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } RiveFileAsset_Ffi.set_kind(this, raw); return value; }
	public var name(get, set):String;
	inline function get_name():String { var raw = RiveFileAsset_Ffi.get_name(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); RiveFileAsset_Ffi.freeString(raw); return value; }
	inline function set_name(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } RiveFileAsset_Ffi.set_name(this, raw); return value; }
	public var width(get, set):Float;

	inline function get_width():Float return this.getF64(96);

	inline function set_width(value:Float):Float { this.setF64(96, value); return value; }
}
