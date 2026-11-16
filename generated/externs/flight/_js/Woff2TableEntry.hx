package flight._js;

abstract Woff2TableEntry(Dynamic) {
	public var originalLength(get, set):Int;
	inline function get_originalLength():Int return untyped this["originalLength"];
	inline function set_originalLength(value:Int):Int return untyped this["originalLength"] = value;
	public var tag(get, set):String;
	inline function get_tag():String return untyped this["tag"];
	inline function set_tag(value:String):String return untyped this["tag"] = value;
	public var transformLength(get, set):Int;
	inline function get_transformLength():Int return untyped this["transformLength"];
	inline function set_transformLength(value:Int):Int return untyped this["transformLength"] = value;
	public var transformVersion(get, set):Int;
	inline function get_transformVersion():Int return untyped this["transformVersion"];
	inline function set_transformVersion(value:Int):Int return untyped this["transformVersion"] = value;
	public var transformed(get, set):Bool;
	inline function get_transformed():Bool return untyped this["transformed"];
	inline function set_transformed(value:Bool):Bool return untyped this["transformed"] = value;
}
