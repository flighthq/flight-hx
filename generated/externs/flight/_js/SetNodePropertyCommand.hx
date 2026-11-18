package flight._js;

abstract SetNodePropertyCommand(Dynamic) {
	public var mergeWindow(get, set):Float;
	inline function get_mergeWindow():Float return untyped this["mergeWindow"];
	inline function set_mergeWindow(value:Float):Float return untyped this["mergeWindow"] = value;
	public var time(get, set):Float;
	inline function get_time():Float return untyped this["time"];
	inline function set_time(value:Float):Float return untyped this["time"] = value;
}
