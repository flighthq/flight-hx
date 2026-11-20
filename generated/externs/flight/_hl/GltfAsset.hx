package flight._hl;

private extern class GltfAsset_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_gltf_asset_version")
	static function get_version(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_gltf_asset_version")
	static function set_version(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract GltfAsset(hl.Bytes) {
	public var version(get, set):String;
	inline function get_version():String { var raw = GltfAsset_Ffi.get_version(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); GltfAsset_Ffi.freeString(raw); return value; }
	inline function set_version(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } GltfAsset_Ffi.set_version(this, raw); return value; }
}
