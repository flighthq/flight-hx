package flight._js;

abstract BitmapReadbackExplanation(Dynamic) {
	public var readable(get, set):Bool;
	inline function get_readable():Bool return untyped this["readable"];
	inline function set_readable(value:Bool):Bool return untyped this["readable"] = value;
}
