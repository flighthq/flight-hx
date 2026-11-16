package flight._js;

abstract ShapeBoundsExplanation(Dynamic) {
	public var complete(get, set):Bool;
	inline function get_complete():Bool return untyped this["complete"];
	inline function set_complete(value:Bool):Bool return untyped this["complete"] = value;
}
