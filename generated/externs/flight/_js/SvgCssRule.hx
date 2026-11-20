package flight._js;

abstract SvgCssRule(Dynamic) {
	public var order(get, set):Int;
	inline function get_order():Int return untyped this.order;
	inline function set_order(value:Int):Int return untyped this.order = value;
	public var selector(get, set):String;
	inline function get_selector():String return untyped this.selector;
	inline function set_selector(value:String):String return untyped this.selector = value;
	public var specificity(get, set):Int;
	inline function get_specificity():Int return untyped this.specificity;
	inline function set_specificity(value:Int):Int return untyped this.specificity = value;
}
