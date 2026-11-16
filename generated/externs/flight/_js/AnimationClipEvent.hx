package flight._js;

abstract AnimationClipEvent(Dynamic) {
	public var name(get, set):String;
	inline function get_name():String return untyped this["name"];
	inline function set_name(value:String):String return untyped this["name"] = value;
	public var time(get, set):Float;
	inline function get_time():Float return untyped this["time"];
	inline function set_time(value:Float):Float return untyped this["time"] = value;
}
