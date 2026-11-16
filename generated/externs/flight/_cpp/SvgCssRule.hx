package flight._cpp;

private extern class SvgCssRule_Ffi {
	@:native("flight_get_svg_css_rule_order") static function get_order(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_svg_css_rule_order") static function set_order(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_field_get_svg_css_rule_selector")
	static function get_selector(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_svg_css_rule_selector")
	static function set_selector(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_get_svg_css_rule_specificity") static function get_specificity(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_svg_css_rule_specificity") static function set_specificity(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract SvgCssRule(cpp.Star<cpp.Void>) {
	public var order(get, set):Int;

	inline function get_order():Int return SvgCssRule_Ffi.get_order(this);

	inline function set_order(value:Int):Int { SvgCssRule_Ffi.set_order(this, value); return value; }
	public var selector(get, set):String;
	inline function get_selector():String {
		final bytes = SvgCssRule_Ffi.get_selector(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_selector(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		SvgCssRule_Ffi.set_selector(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

	public var specificity(get, set):Int;

	inline function get_specificity():Int return SvgCssRule_Ffi.get_specificity(this);

	inline function set_specificity(value:Int):Int { SvgCssRule_Ffi.set_specificity(this, value); return value; }
}
