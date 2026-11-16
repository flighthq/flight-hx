package flight._js;

abstract VelocityExplanation(Dynamic) {
	public var currentFrameId(get, set):Int;
	inline function get_currentFrameId():Int return untyped this["currentFrameId"];
	inline function set_currentFrameId(value:Int):Int return untyped this["currentFrameId"] = value;
	public var explicit(get, set):Bool;
	inline function get_explicit():Bool return untyped this["explicit"];
	inline function set_explicit(value:Bool):Bool return untyped this["explicit"] = value;
	public var lastFrameId(get, set):Int;
	inline function get_lastFrameId():Int return untyped this["lastFrameId"];
	inline function set_lastFrameId(value:Int):Int return untyped this["lastFrameId"] = value;
	public var x(get, set):Float;
	inline function get_x():Float return untyped this["x"];
	inline function set_x(value:Float):Float return untyped this["x"] = value;
	public var y(get, set):Float;
	inline function get_y():Float return untyped this["y"];
	inline function set_y(value:Float):Float return untyped this["y"] = value;
}
