package flight._js;

abstract AbortError(Dynamic) {
	public var name(get, set):String;
	inline function get_name():String return untyped this.name;
	inline function set_name(value:String):String return untyped this.name = value;
	public var message(get, set):String;
	inline function get_message():String return untyped this.message;
	inline function set_message(value:String):String return untyped this.message = value;
}
