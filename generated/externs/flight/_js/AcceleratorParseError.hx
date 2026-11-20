package flight._js;

abstract AcceleratorParseError(Dynamic) {
	public var token(get, set):String;
	inline function get_token():String return untyped this.token;
	inline function set_token(value:String):String return untyped this.token = value;
}
