package flight._hl;

private extern class Skeleton2DDeformLengthMismatch_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_skeleton2_ddeform_length_mismatch_subject")
	static function get_subject(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_skeleton2_ddeform_length_mismatch_subject")
	static function set_subject(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract Skeleton2DDeformLengthMismatch(hl.Bytes) {
	public var addressed(get, set):Int;

	inline function get_addressed():Int return this.getI32(0);

	inline function set_addressed(value:Int):Int { this.setI32(0, value); return value; }
	public var offsets(get, set):Int;

	inline function get_offsets():Int return this.getI32(8);

	inline function set_offsets(value:Int):Int { this.setI32(8, value); return value; }
	public var subject(get, set):String;
	inline function get_subject():String { var raw = Skeleton2DDeformLengthMismatch_Ffi.get_subject(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); Skeleton2DDeformLengthMismatch_Ffi.freeString(raw); return value; }
	inline function set_subject(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } Skeleton2DDeformLengthMismatch_Ffi.set_subject(this, raw); return value; }
}
