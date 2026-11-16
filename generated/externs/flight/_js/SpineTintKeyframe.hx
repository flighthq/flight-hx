package flight._js;

abstract SpineTintKeyframe(Dynamic) {
	public var color(get, set):String;
	inline function get_color():String return untyped this["color"];
	inline function set_color(value:String):String return untyped this["color"] = value;
	public var time(get, set):Float;
	inline function get_time():Float return untyped this["time"];
	inline function set_time(value:Float):Float return untyped this["time"] = value;
}
