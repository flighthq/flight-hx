package flight._js;

abstract TexturePackerAtlasFrameTag(Dynamic) {
	public var from(get, set):Int;
	inline function get_from():Int return untyped this.from;
	inline function set_from(value:Int):Int return untyped this.from = value;
	public var to(get, set):Int;
	inline function get_to():Int return untyped this.to;
	inline function set_to(value:Int):Int return untyped this.to = value;
}
