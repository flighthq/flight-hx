package flight._hl;

private extern class AsepriteArrayFrame_Ffi {
	@:hlNative("flight", "flight_field_get_aseprite_array_frame_filename")
	static function get_filename(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_aseprite_array_frame_filename")
	static function set_filename(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract AsepriteArrayFrame(hl.Bytes) {
	public var duration(get, set):Single;

	inline function get_duration():Single return this.getF32(0);

	inline function set_duration(value:Single):Single { this.setF32(0, value); return value; }
	public var filename(get, set):String;
	inline function get_filename():String {
		final bytes = AsepriteArrayFrame_Ffi.get_filename(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_filename(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		AsepriteArrayFrame_Ffi.set_filename(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var rotated(get, set):Bool;

	inline function get_rotated():Bool return this.getUI8(48) != 0;

	inline function set_rotated(value:Bool):Bool { this.setUI8(48, value ? 1 : 0); return value; }
	public var trimmed(get, set):Bool;

	inline function get_trimmed():Bool return this.getUI8(76) != 0;

	inline function set_trimmed(value:Bool):Bool { this.setUI8(76, value ? 1 : 0); return value; }
}
