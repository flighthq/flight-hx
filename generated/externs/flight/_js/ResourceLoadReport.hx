package flight._js;

abstract ResourceLoadReport(Dynamic) {
	public var attempts(get, set):Int;
	inline function get_attempts():Int return untyped this.attempts;
	inline function set_attempts(value:Int):Int return untyped this.attempts = value;
	public var bytes(get, set):Float;
	inline function get_bytes():Float return untyped this.bytes;
	inline function set_bytes(value:Float):Float return untyped this.bytes = value;
	public var elapsedMs(get, set):Float;
	inline function get_elapsedMs():Float return untyped this.elapsedMs;
	inline function set_elapsedMs(value:Float):Float return untyped this.elapsedMs = value;
	public var key(get, set):String;
	inline function get_key():String return untyped this.key;
	inline function set_key(value:String):String return untyped this.key = value;
}
