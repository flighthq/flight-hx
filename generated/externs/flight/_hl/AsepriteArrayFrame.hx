package flight._hl;

private extern class AsepriteArrayFrame_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_aseprite_array_frame_filename")
	static function get_filename(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_aseprite_array_frame_filename")
	static function set_filename(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract AsepriteArrayFrame(hl.Bytes) {
	public var duration(get, set):Single;

	inline function get_duration():Single return this.getF32(0);

	inline function set_duration(value:Single):Single { this.setF32(0, value); return value; }
	public var filename(get, set):String;
	inline function get_filename():String { var raw = AsepriteArrayFrame_Ffi.get_filename(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); AsepriteArrayFrame_Ffi.freeString(raw); return value; }
	inline function set_filename(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } AsepriteArrayFrame_Ffi.set_filename(this, raw); return value; }
	public var rotated(get, set):Bool;

	inline function get_rotated():Bool return this.getUI8(48) != 0;

	inline function set_rotated(value:Bool):Bool { this.setUI8(48, value ? 1 : 0); return value; }
	public var trimmed(get, set):Bool;

	inline function get_trimmed():Bool return this.getUI8(76) != 0;

	inline function set_trimmed(value:Bool):Bool { this.setUI8(76, value ? 1 : 0); return value; }
}
