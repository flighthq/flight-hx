package flight._js;

abstract Scene2DSlotReference(Dynamic) {
	public var name(get, set):String;
	inline function get_name():String return untyped this["name"];
	inline function set_name(value:String):String return untyped this["name"] = value;
	public var required(get, set):Bool;
	inline function get_required():Bool return untyped this["required"];
	inline function set_required(value:Bool):Bool return untyped this["required"] = value;
}
