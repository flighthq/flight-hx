package flight._js;

abstract Awd2SkeletonAnimationEntry(Dynamic) {
	public var key(get, set):Int;
	inline function get_key():Int return untyped this["key"];
	inline function set_key(value:Int):Int return untyped this["key"] = value;
}
