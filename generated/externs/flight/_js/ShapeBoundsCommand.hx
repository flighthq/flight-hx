package flight._js;

abstract ShapeBoundsCommand(Dynamic) {
	public var key(get, set):String;
	inline function get_key():String return untyped this["key"];
	inline function set_key(value:String):String return untyped this["key"] = value;
}
