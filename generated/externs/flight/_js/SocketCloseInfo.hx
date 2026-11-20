package flight._js;

abstract SocketCloseInfo(Dynamic) {
	public var code(get, set):Int;
	inline function get_code():Int return untyped this.code;
	inline function set_code(value:Int):Int return untyped this.code = value;
	public var reason(get, set):String;
	inline function get_reason():String return untyped this.reason;
	inline function set_reason(value:String):String return untyped this.reason = value;
	public var wasClean(get, set):Bool;
	inline function get_wasClean():Bool return untyped this.wasClean;
	inline function set_wasClean(value:Bool):Bool return untyped this.wasClean = value;
}
