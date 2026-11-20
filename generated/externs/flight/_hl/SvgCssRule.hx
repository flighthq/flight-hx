package flight._hl;

private extern class SvgCssRule_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_svg_css_rule_selector")
	static function get_selector(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_svg_css_rule_selector")
	static function set_selector(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract SvgCssRule(hl.Bytes) {
	public var order(get, set):Int;

	inline function get_order():Int return this.getI32(48);

	inline function set_order(value:Int):Int { this.setI32(48, value); return value; }
	public var selector(get, set):String;
	inline function get_selector():String { var raw = SvgCssRule_Ffi.get_selector(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); SvgCssRule_Ffi.freeString(raw); return value; }
	inline function set_selector(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } SvgCssRule_Ffi.set_selector(this, raw); return value; }
	public var specificity(get, set):Int;

	inline function get_specificity():Int return this.getI32(80);

	inline function set_specificity(value:Int):Int { this.setI32(80, value); return value; }
}
