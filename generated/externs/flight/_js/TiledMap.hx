package flight._js;

abstract TiledMap(Dynamic) {
	public var height(get, set):Int;
	inline function get_height():Int return untyped this.height;
	inline function set_height(value:Int):Int return untyped this.height = value;
	public var infinite(get, set):Bool;
	inline function get_infinite():Bool return untyped this.infinite;
	inline function set_infinite(value:Bool):Bool return untyped this.infinite = value;
	public var tileHeight(get, set):Int;
	inline function get_tileHeight():Int return untyped this.tileHeight;
	inline function set_tileHeight(value:Int):Int return untyped this.tileHeight = value;
	public var tileWidth(get, set):Int;
	inline function get_tileWidth():Int return untyped this.tileWidth;
	inline function set_tileWidth(value:Int):Int return untyped this.tileWidth = value;
	public var version(get, set):String;
	inline function get_version():String return untyped this.version;
	inline function set_version(value:String):String return untyped this.version = value;
	public var width(get, set):Int;
	inline function get_width():Int return untyped this.width;
	inline function set_width(value:Int):Int return untyped this.width = value;
}
