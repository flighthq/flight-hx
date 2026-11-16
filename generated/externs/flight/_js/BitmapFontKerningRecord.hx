package flight._js;

abstract BitmapFontKerningRecord(Dynamic) {
	public var amount(get, set):Float;
	inline function get_amount():Float return untyped this["amount"];
	inline function set_amount(value:Float):Float return untyped this["amount"] = value;
	public var first(get, set):Int;
	inline function get_first():Int return untyped this["first"];
	inline function set_first(value:Int):Int return untyped this["first"] = value;
	public var second(get, set):Int;
	inline function get_second():Int return untyped this["second"];
	inline function set_second(value:Int):Int return untyped this["second"] = value;
}
