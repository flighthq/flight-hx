package flight._js;

abstract StrokePathTessellationExplanation(Dynamic) {
	public var supported(get, set):Bool;
	inline function get_supported():Bool return untyped this["supported"];
	inline function set_supported(value:Bool):Bool return untyped this["supported"] = value;
}
