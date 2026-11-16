package flight._js;

abstract SlotId(Dynamic) {
	public var value(get, set):Int;
	inline function get_value():Int return untyped this["value"];
	inline function set_value(value:Int):Int return untyped this["value"] = value;
}
