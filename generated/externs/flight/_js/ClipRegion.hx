package flight._js;

abstract ClipRegion(Dynamic) {
	public var version(get, set):Int;
	inline function get_version():Int return untyped this["version"];
	inline function set_version(value:Int):Int return untyped this["version"] = value;
}
