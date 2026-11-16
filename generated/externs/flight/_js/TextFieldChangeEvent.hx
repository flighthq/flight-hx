package flight._js;

abstract TextFieldChangeEvent(Dynamic) {
	public var previousText(get, set):String;
	inline function get_previousText():String return untyped this["previousText"];
	inline function set_previousText(value:String):String return untyped this["previousText"] = value;
	public var text(get, set):String;
	inline function get_text():String return untyped this["text"];
	inline function set_text(value:String):String return untyped this["text"] = value;
}
