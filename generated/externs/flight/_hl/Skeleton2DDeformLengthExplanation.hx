package flight._hl;

private extern class Skeleton2DDeformLengthExplanation_Ffi {
	@:hlNative("flight", "flight_field_get_skeleton2_ddeform_length_explanation_addressing")
	static function get_addressing(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_skeleton2_ddeform_length_explanation_addressing")
	static function set_addressing(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract Skeleton2DDeformLengthExplanation(hl.Bytes) {
	public var accepted(get, set):Bool;

	inline function get_accepted():Bool return this.getUI8(0) != 0;

	inline function set_accepted(value:Bool):Bool { this.setUI8(0, value ? 1 : 0); return value; }
	public var addressed(get, set):Int;

	inline function get_addressed():Int return this.getI32(8);

	inline function set_addressed(value:Int):Int { this.setI32(8, value); return value; }
	public var addressing(get, set):String;
	inline function get_addressing():String {
		final bytes = Skeleton2DDeformLengthExplanation_Ffi.get_addressing(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_addressing(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		Skeleton2DDeformLengthExplanation_Ffi.set_addressing(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var offsets(get, set):Int;

	inline function get_offsets():Int return this.getI32(40);

	inline function set_offsets(value:Int):Int { this.setI32(40, value); return value; }
}
