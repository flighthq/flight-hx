package flight._js;

abstract BitmapFontPageRecord(Dynamic) {
	public var file(get, set):String;
	inline function get_file():String return untyped this["file"];
	inline function set_file(value:String):String return untyped this["file"] = value;
	public var id(get, set):Int;
	inline function get_id():Int return untyped this["id"];
	inline function set_id(value:Int):Int return untyped this["id"] = value;
}
