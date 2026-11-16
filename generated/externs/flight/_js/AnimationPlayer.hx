package flight._js;

abstract AnimationPlayer(Dynamic) {
	public var loopEnabled(get, set):Bool;
	inline function get_loopEnabled():Bool return untyped this["loopEnabled"];
	inline function set_loopEnabled(value:Bool):Bool return untyped this["loopEnabled"] = value;
	public var playing(get, set):Bool;
	inline function get_playing():Bool return untyped this["playing"];
	inline function set_playing(value:Bool):Bool return untyped this["playing"] = value;
	public var repeatCount(get, set):Int;
	inline function get_repeatCount():Int return untyped this["repeatCount"];
	inline function set_repeatCount(value:Int):Int return untyped this["repeatCount"] = value;
	public var speed(get, set):Float;
	inline function get_speed():Float return untyped this["speed"];
	inline function set_speed(value:Float):Float return untyped this["speed"] = value;
	public var time(get, set):Float;
	inline function get_time():Float return untyped this["time"];
	inline function set_time(value:Float):Float return untyped this["time"] = value;
}
