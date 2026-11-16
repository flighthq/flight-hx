package flight._js;

abstract BitmapEncodeFailureExplanation(Dynamic) {
	public var reason(get, set):String;
	inline function get_reason():String return untyped this["reason"];
	inline function set_reason(value:String):String return untyped this["reason"] = value;
}
