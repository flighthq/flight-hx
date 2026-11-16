package flight._js;

abstract RiveCoreObjectHandlerEntry(Dynamic) {
	public var typeKey(get, set):Int;
	inline function get_typeKey():Int return untyped this["typeKey"];
	inline function set_typeKey(value:Int):Int return untyped this["typeKey"] = value;
}
