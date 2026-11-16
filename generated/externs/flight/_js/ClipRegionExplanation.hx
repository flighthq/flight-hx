package flight._js;

abstract ClipRegionExplanation(Dynamic) {
	public var conservative(get, set):Bool;
	inline function get_conservative():Bool return untyped this["conservative"];
	inline function set_conservative(value:Bool):Bool return untyped this["conservative"] = value;
}
