package flight._js;

abstract ParticleFormatWarning(Dynamic) {
	public var code(get, set):String;
	inline function get_code():String return untyped this["code"];
	inline function set_code(value:String):String return untyped this["code"] = value;
	public var message(get, set):String;
	inline function get_message():String return untyped this["message"];
	inline function set_message(value:String):String return untyped this["message"] = value;
}
