package flight._cpp;

private extern class SvgPathDataExplanation_Ffi {
	@:native("flight_get_svg_path_data_explanation_position") static function get_position(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_svg_path_data_explanation_position") static function set_position(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_field_get_svg_path_data_explanation_reason")
	static function get_reason(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_svg_path_data_explanation_reason")
	static function set_reason(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
}

abstract SvgPathDataExplanation(cpp.Star<cpp.Void>) {
	public var position(get, set):Int;

	inline function get_position():Int return SvgPathDataExplanation_Ffi.get_position(this);

	inline function set_position(value:Int):Int { SvgPathDataExplanation_Ffi.set_position(this, value); return value; }
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
		SvgPathDataExplanation_Ffi.set_reason(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

}
