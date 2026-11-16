package flight._hl;

private extern class SvgCssRule_Ffi {
	@:hlNative("flight", "flight_field_get_svg_css_rule_selector")
	static function get_selector(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_svg_css_rule_selector")
	static function set_selector(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract SvgCssRule(hl.Bytes) {
	public var order(get, set):Int;

	inline function get_order():Int return this.getI32(48);

	inline function set_order(value:Int):Int { this.setI32(48, value); return value; }
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
		SvgCssRule_Ffi.set_selector(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var specificity(get, set):Int;

	inline function get_specificity():Int return this.getI32(80);

	inline function set_specificity(value:Int):Int { this.setI32(80, value); return value; }
}
