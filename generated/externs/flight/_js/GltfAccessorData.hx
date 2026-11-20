package flight._js;

abstract GltfAccessorData(Dynamic) {
	public var count(get, set):Int;
	inline function get_count():Int return untyped this.count;
	inline function set_count(value:Int):Int return untyped this.count = value;
}
