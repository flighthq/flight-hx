package flight._js;

abstract UnpackedRectangleExplanation(Dynamic) {
	public var usableWidth(get, set):Float;
	inline function get_usableWidth():Float return untyped this["usableWidth"];
	inline function set_usableWidth(value:Float):Float return untyped this["usableWidth"] = value;
	public var usableHeight(get, set):Float;
	inline function get_usableHeight():Float return untyped this["usableHeight"];
	inline function set_usableHeight(value:Float):Float return untyped this["usableHeight"] = value;
}
