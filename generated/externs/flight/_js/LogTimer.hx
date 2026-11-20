package flight._js;

abstract LogTimer(Dynamic) {
	public var label(get, set):String;
	inline function get_label():String return untyped this.label;
	inline function set_label(value:String):String return untyped this.label = value;
	public var startedAt(get, set):Float;
	inline function get_startedAt():Float return untyped this.startedAt;
	inline function set_startedAt(value:Float):Float return untyped this.startedAt = value;
}
