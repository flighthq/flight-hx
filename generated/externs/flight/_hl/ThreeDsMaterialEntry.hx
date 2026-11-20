package flight._hl;

private extern class ThreeDsMaterialEntry_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_three_ds_material_entry_key")
	static function get_key(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_three_ds_material_entry_key")
	static function set_key(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract ThreeDsMaterialEntry(hl.Bytes) {
	public var key(get, set):String;
	inline function get_key():String { var raw = ThreeDsMaterialEntry_Ffi.get_key(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); ThreeDsMaterialEntry_Ffi.freeString(raw); return value; }
	inline function set_key(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } ThreeDsMaterialEntry_Ffi.set_key(this, raw); return value; }
}
