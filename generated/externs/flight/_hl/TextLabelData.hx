package flight._hl;

private extern class TextLabelData_Ffi {
	@:hlNative("flight", "flight_field_get_text_label_data_text")
	static function get_text(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_text_label_data_text")
	static function set_text(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract TextLabelData(hl.Bytes) {
	public var height(get, set):Single;

	inline function get_height():Single return this.getF32(20);

	inline function set_height(value:Single):Single { this.setF32(20, value); return value; }
	public var text(get, set):String;
	inline function get_text():String {
		final bytes = TextLabelData_Ffi.get_text(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_text(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		TextLabelData_Ffi.set_text(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var width(get, set):Single;

	inline function get_width():Single return this.getF32(60);

	inline function set_width(value:Single):Single { this.setF32(60, value); return value; }
}
