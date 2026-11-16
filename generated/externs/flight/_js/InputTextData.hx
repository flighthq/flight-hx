package flight._js;

abstract InputTextData(Dynamic) {
	public var isComposing(get, set):Bool;
	inline function get_isComposing():Bool return untyped this["isComposing"];
	inline function set_isComposing(value:Bool):Bool return untyped this["isComposing"] = value;
	public var text(get, set):String;
	inline function get_text():String return untyped this["text"];
	inline function set_text(value:String):String return untyped this["text"] = value;
}
