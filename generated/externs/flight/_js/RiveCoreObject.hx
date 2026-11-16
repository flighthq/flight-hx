package flight._js;

abstract RiveCoreObject(Dynamic) {
	public var typeKey(get, set):Float;
	inline function get_typeKey():Float return untyped this["typeKey"];
	inline function set_typeKey(value:Float):Float return untyped this["typeKey"] = value;
}
