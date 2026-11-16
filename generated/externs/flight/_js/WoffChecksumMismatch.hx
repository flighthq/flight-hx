package flight._js;

abstract WoffChecksumMismatch(Dynamic) {
	public var stored(get, set):Int;
	inline function get_stored():Int return untyped this["stored"];
	inline function set_stored(value:Int):Int return untyped this["stored"] = value;
	public var computed(get, set):Int;
	inline function get_computed():Int return untyped this["computed"];
	inline function set_computed(value:Int):Int return untyped this["computed"] = value;
	public var tag(get, set):String;
	inline function get_tag():String return untyped this["tag"];
	inline function set_tag(value:String):String return untyped this["tag"] = value;
}
