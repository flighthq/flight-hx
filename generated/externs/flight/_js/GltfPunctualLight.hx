package flight._js;

abstract GltfPunctualLight(Dynamic) {
	public var type(get, set):String;
	inline function get_type():String return untyped this["type"];
	inline function set_type(value:String):String return untyped this["type"] = value;
}
