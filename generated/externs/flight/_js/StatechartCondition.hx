package flight._js;

abstract StatechartCondition(Dynamic) {
	public var inputIndex(get, set):Int;
	inline function get_inputIndex():Int return untyped this["inputIndex"];
	inline function set_inputIndex(value:Int):Int return untyped this["inputIndex"] = value;
	public var value(get, set):Float;
	inline function get_value():Float return untyped this["value"];
	inline function set_value(value:Float):Float return untyped this["value"] = value;
}
