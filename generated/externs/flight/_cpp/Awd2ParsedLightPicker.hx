package flight._cpp;

private extern class Awd2ParsedLightPicker_Ffi {
	@:native("flight_field_get_awd2_parsed_light_picker_name")
	static function get_name(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_awd2_parsed_light_picker_name")
	static function set_name(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
}

abstract Awd2ParsedLightPicker(cpp.Star<cpp.Void>) {
	public var name(get, set):String;
	inline function get_name():String {
		final bytes = Awd2ParsedLightPicker_Ffi.get_name(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_name(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		Awd2ParsedLightPicker_Ffi.set_name(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

}
