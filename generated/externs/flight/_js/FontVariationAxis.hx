package flight._js;

abstract FontVariationAxis(Dynamic) {
	public var defaultValue(get, set):Float;
	inline function get_defaultValue():Float return untyped this["defaultValue"];
	inline function set_defaultValue(value:Float):Float return untyped this["defaultValue"] = value;
	public var max(get, set):Float;
	inline function get_max():Float return untyped this["max"];
	inline function set_max(value:Float):Float return untyped this["max"] = value;
	public var min(get, set):Float;
	inline function get_min():Float return untyped this["min"];
	inline function set_min(value:Float):Float return untyped this["min"] = value;
	public var name(get, set):String;
	inline function get_name():String return untyped this["name"];
	inline function set_name(value:String):String return untyped this["name"] = value;
	public var tag(get, set):String;
	inline function get_tag():String return untyped this["tag"];
	inline function set_tag(value:String):String return untyped this["tag"] = value;
}
