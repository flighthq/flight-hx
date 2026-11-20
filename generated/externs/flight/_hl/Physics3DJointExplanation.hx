package flight._hl;

private extern class Physics3DJointExplanation_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_physics3_djoint_explanation_kind")
	static function get_kind(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_physics3_djoint_explanation_kind")
	static function set_kind(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract Physics3DJointExplanation(hl.Bytes) {
	public var kind(get, set):String;
	inline function get_kind():String { var raw = Physics3DJointExplanation_Ffi.get_kind(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); Physics3DJointExplanation_Ffi.freeString(raw); return value; }
	inline function set_kind(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } Physics3DJointExplanation_Ffi.set_kind(this, raw); return value; }
	public var index(get, set):Int;

	inline function get_index():Int return this.getI32(24);

	inline function set_index(value:Int):Int { this.setI32(24, value); return value; }
	public var hasSolver(get, set):Bool;

	inline function get_hasSolver():Bool return this.getUI8(36) != 0;

	inline function set_hasSolver(value:Bool):Bool { this.setUI8(36, value ? 1 : 0); return value; }
	public var bodiesResolvable(get, set):Bool;

	inline function get_bodiesResolvable():Bool return this.getUI8(37) != 0;

	inline function set_bodiesResolvable(value:Bool):Bool { this.setUI8(37, value ? 1 : 0); return value; }
}
