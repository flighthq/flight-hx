package flight._js;

abstract RegExp(Dynamic) {
	public var flags(get, set):String;
	inline function get_flags():String return untyped this.flags;
	inline function set_flags(value:String):String return untyped this.flags = value;
	public var lastIndex(get, set):Int;
	inline function get_lastIndex():Int return untyped this.lastIndex;
	inline function set_lastIndex(value:Int):Int return untyped this.lastIndex = value;
	public var source(get, set):String;
	inline function get_source():String return untyped this.source;
	inline function set_source(value:String):String return untyped this.source = value;
}
