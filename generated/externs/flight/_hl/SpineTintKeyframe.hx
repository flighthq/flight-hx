package flight._hl;

private extern class SpineTintKeyframe_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_spine_tint_keyframe_color")
	static function get_color(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_spine_tint_keyframe_color")
	static function set_color(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract SpineTintKeyframe(hl.Bytes) {
	public var color(get, set):String;
	inline function get_color():String { var raw = SpineTintKeyframe_Ffi.get_color(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); SpineTintKeyframe_Ffi.freeString(raw); return value; }
	inline function set_color(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } SpineTintKeyframe_Ffi.set_color(this, raw); return value; }
	public var time(get, set):Single;

	inline function get_time():Single return this.getF32(24);

	inline function set_time(value:Single):Single { this.setF32(24, value); return value; }
}
