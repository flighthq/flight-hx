package flight._hl;

private extern class InputTextData_Ffi {
	@:hlNative("flight", "flight_field_get_input_text_data_text")
	static function get_text(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_input_text_data_text")
	static function set_text(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract InputTextData(hl.Bytes) {
	public var isComposing(get, set):Bool;

	inline function get_isComposing():Bool return this.getUI8(0) != 0;

	inline function set_isComposing(value:Bool):Bool { this.setUI8(0, value ? 1 : 0); return value; }
	public var text(get, set):String;
	inline function get_text():String {
		final bytes = InputTextData_Ffi.get_text(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_text(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		InputTextData_Ffi.set_text(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}
