package flight._js;

abstract TextureContainer(Dynamic) {
	public var width(get, set):Int;
	inline function get_width():Int return untyped this["width"];
	inline function set_width(value:Int):Int return untyped this["width"] = value;
	public var height(get, set):Int;
	inline function get_height():Int return untyped this["height"];
	inline function set_height(value:Int):Int return untyped this["height"] = value;
	public var depth(get, set):Int;
	inline function get_depth():Int return untyped this["depth"];
	inline function set_depth(value:Int):Int return untyped this["depth"] = value;
	public var mipLevels(get, set):Int;
	inline function get_mipLevels():Int return untyped this["mipLevels"];
	inline function set_mipLevels(value:Int):Int return untyped this["mipLevels"] = value;
	public var layers(get, set):Int;
	inline function get_layers():Int return untyped this["layers"];
	inline function set_layers(value:Int):Int return untyped this["layers"] = value;
	public var faces(get, set):Int;
	inline function get_faces():Int return untyped this["faces"];
	inline function set_faces(value:Int):Int return untyped this["faces"] = value;
}
