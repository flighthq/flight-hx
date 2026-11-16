package flight._cpp;

private extern class InputTextData_Ffi {
	@:native("flight_get_input_text_data_is_composing") static function get_isComposing(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_input_text_data_is_composing") static function set_isComposing(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_field_get_input_text_data_text")
	static function get_text(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_input_text_data_text")
	static function set_text(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
}

abstract InputTextData(cpp.Star<cpp.Void>) {
	public var isComposing(get, set):Bool;

	inline function get_isComposing():Bool return InputTextData_Ffi.get_isComposing(this);

	inline function set_isComposing(value:Bool):Bool { InputTextData_Ffi.set_isComposing(this, value); return value; }
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
		InputTextData_Ffi.set_text(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

}
