package flight._hl;

private extern class Scene2DSlotReference_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_scene2_dslot_reference_name")
	static function get_name(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_scene2_dslot_reference_name")
	static function set_name(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_get_scene2_dslot_reference_required")
	static function get_required(ptr:hl.Bytes):Bool;
	@:hlNative("flight", "flight_set_scene2_dslot_reference_required")
	static function set_required(ptr:hl.Bytes, value:Bool):Bool;
}

abstract Scene2DSlotReference(hl.Bytes) {
	public var name(get, set):String;
	inline function get_name():String { var raw = Scene2DSlotReference_Ffi.get_name(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); Scene2DSlotReference_Ffi.freeString(raw); return value; }
	inline function set_name(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } Scene2DSlotReference_Ffi.set_name(this, raw); return value; }
	public var required(get, set):Bool;

	inline function get_required():Bool return Scene2DSlotReference_Ffi.get_required(this);

	inline function set_required(value:Bool):Bool { Scene2DSlotReference_Ffi.set_required(this, value); return value; }
}
