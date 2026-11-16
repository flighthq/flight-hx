package flight._hl;

private extern class SvgPathDataExplanation_Ffi {
	@:hlNative("flight", "flight_field_get_svg_path_data_explanation_reason")
	static function get_reason(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_svg_path_data_explanation_reason")
	static function set_reason(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract SvgPathDataExplanation(hl.Bytes) {
	public var position(get, set):Int;

	inline function get_position():Int return this.getI32(0);

	inline function set_position(value:Int):Int { this.setI32(0, value); return value; }
	public var reason(get, set):String;
	inline function get_reason():String {
		final bytes = SvgPathDataExplanation_Ffi.get_reason(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_reason(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		SvgPathDataExplanation_Ffi.set_reason(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}
