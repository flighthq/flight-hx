package flight._hl;

private extern class Skeleton3DValidationDiagnostic_Ffi {
	@:hlNative("flight", "flight_field_get_skeleton3_dvalidation_diagnostic_message")
	static function get_message(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_skeleton3_dvalidation_diagnostic_message")
	static function set_message(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract Skeleton3DValidationDiagnostic(hl.Bytes) {
	public var jointCount(get, set):Int;

	inline function get_jointCount():Int return this.getI32(24);

	inline function set_jointCount(value:Int):Int { this.setI32(24, value); return value; }
	public var inverseBindMatricesLength(get, set):Int;

	inline function get_inverseBindMatricesLength():Int return this.getI32(32);

	inline function set_inverseBindMatricesLength(value:Int):Int { this.setI32(32, value); return value; }
	public var expectedInverseBindMatricesLength(get, set):Int;

	inline function get_expectedInverseBindMatricesLength():Int return this.getI32(40);

	inline function set_expectedInverseBindMatricesLength(value:Int):Int { this.setI32(40, value); return value; }
	public var message(get, set):String;
	inline function get_message():String {
		final bytes = Skeleton3DValidationDiagnostic_Ffi.get_message(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_message(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		Skeleton3DValidationDiagnostic_Ffi.set_message(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}
