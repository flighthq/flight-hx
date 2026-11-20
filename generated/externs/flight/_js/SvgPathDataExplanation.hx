package flight._js;

abstract SvgPathDataExplanation(Dynamic) {
	public var position(get, set):Int;
	inline function get_position():Int return untyped this.position;
	inline function set_position(value:Int):Int return untyped this.position = value;
	public var reason(get, set):String;
	inline function get_reason():String return untyped this.reason;
	inline function set_reason(value:String):String return untyped this.reason = value;
}
