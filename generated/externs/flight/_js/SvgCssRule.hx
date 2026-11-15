package flight._js;

@:jsRequire("flight")
private extern class SvgCssRule_Ffi {
	@:native("flight_get_svg_css_rule_order") static function get_order(ptr:Dynamic):Int;
	@:native("flight_set_svg_css_rule_order") static function set_order(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_svg_css_rule_specificity") static function get_specificity(ptr:Dynamic):Int;
	@:native("flight_set_svg_css_rule_specificity") static function set_specificity(ptr:Dynamic, value:Int):Int;
}

abstract SvgCssRule(Dynamic) {
	public var order(get, set):Int;

	inline function get_order():Int return SvgCssRule_Ffi.get_order(this);

	inline function set_order(value:Int):Int return SvgCssRule_Ffi.set_order(this, value);
	public var specificity(get, set):Int;

	inline function get_specificity():Int return SvgCssRule_Ffi.get_specificity(this);

	inline function set_specificity(value:Int):Int return SvgCssRule_Ffi.set_specificity(this, value);
}
