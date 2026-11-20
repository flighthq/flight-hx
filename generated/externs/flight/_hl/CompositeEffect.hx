package flight._hl;

private extern class CompositeEffect_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_composite_effect_operator")
	static function get_operator_(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_composite_effect_operator")
	static function set_operator_(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract CompositeEffect(hl.Bytes) {
	public var operator_(get, set):String;
	inline function get_operator_():String { var raw = CompositeEffect_Ffi.get_operator_(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); CompositeEffect_Ffi.freeString(raw); return value; }
	inline function set_operator_(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } CompositeEffect_Ffi.set_operator_(this, raw); return value; }
}
