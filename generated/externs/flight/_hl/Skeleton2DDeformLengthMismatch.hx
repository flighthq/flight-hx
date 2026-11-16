package flight._hl;

private extern class Skeleton2DDeformLengthMismatch_Ffi {
	@:hlNative("flight", "flight_field_get_skeleton2_ddeform_length_mismatch_subject")
	static function get_subject(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_skeleton2_ddeform_length_mismatch_subject")
	static function set_subject(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract Skeleton2DDeformLengthMismatch(hl.Bytes) {
	public var addressed(get, set):Int;

	inline function get_addressed():Int return this.getI32(0);

	inline function set_addressed(value:Int):Int { this.setI32(0, value); return value; }
	public var offsets(get, set):Int;

	inline function get_offsets():Int return this.getI32(8);

	inline function set_offsets(value:Int):Int { this.setI32(8, value); return value; }
	public var subject(get, set):String;
	inline function get_subject():String {
		final bytes = Skeleton2DDeformLengthMismatch_Ffi.get_subject(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_subject(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		Skeleton2DDeformLengthMismatch_Ffi.set_subject(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}
