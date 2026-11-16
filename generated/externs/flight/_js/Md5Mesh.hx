package flight._js;

abstract Md5Mesh(Dynamic) {
	public var shader(get, set):String;
	inline function get_shader():String return untyped this["shader"];
	inline function set_shader(value:String):String return untyped this["shader"] = value;
}
