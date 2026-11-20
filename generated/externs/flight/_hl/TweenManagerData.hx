package flight._hl;

private extern class TweenManagerData_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_tween_manager_data___brand")
	static function get_brand(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_tween_manager_data___brand")
	static function set_brand(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract TweenManagerData(hl.Bytes) {
	public var brand(get, set):String;
	inline function get_brand():String { var raw = TweenManagerData_Ffi.get_brand(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); TweenManagerData_Ffi.freeString(raw); return value; }
	inline function set_brand(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } TweenManagerData_Ffi.set_brand(this, raw); return value; }
}
