package flight._js;

abstract TextureAtlasAsepriteFrameTag(Dynamic) {
	public var from(get, set):Int;
	inline function get_from():Int return untyped this.from;
	inline function set_from(value:Int):Int return untyped this.from = value;
	public var name(get, set):String;
	inline function get_name():String return untyped this.name;
	inline function set_name(value:String):String return untyped this.name = value;
	public var to(get, set):Int;
	inline function get_to():Int return untyped this.to;
	inline function set_to(value:Int):Int return untyped this.to = value;
}
