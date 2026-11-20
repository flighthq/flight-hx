package flight._hl;

private extern class ColladaSkinInfluence_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_collada_skin_influence_joint")
	static function get_joint(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_collada_skin_influence_joint")
	static function set_joint(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract ColladaSkinInfluence(hl.Bytes) {
	public var joint(get, set):String;
	inline function get_joint():String { var raw = ColladaSkinInfluence_Ffi.get_joint(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); ColladaSkinInfluence_Ffi.freeString(raw); return value; }
	inline function set_joint(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } ColladaSkinInfluence_Ffi.set_joint(this, raw); return value; }
	public var weight(get, set):Float;

	inline function get_weight():Float return this.getF64(24);

	inline function set_weight(value:Float):Float { this.setF64(24, value); return value; }
}
