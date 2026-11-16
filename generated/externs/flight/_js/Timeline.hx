package flight._js;

abstract Timeline(Dynamic) {
	public var currentFrame(get, set):Int;
	inline function get_currentFrame():Int return untyped this["currentFrame"];
	inline function set_currentFrame(value:Int):Int return untyped this["currentFrame"] = value;
	public var isPlaying(get, set):Bool;
	inline function get_isPlaying():Bool return untyped this["isPlaying"];
	inline function set_isPlaying(value:Bool):Bool return untyped this["isPlaying"] = value;
	public var timeElapsed(get, set):Float;
	inline function get_timeElapsed():Float return untyped this["timeElapsed"];
	inline function set_timeElapsed(value:Float):Float return untyped this["timeElapsed"] = value;
	public var lastFrameUpdate(get, set):Int;
	inline function get_lastFrameUpdate():Int return untyped this["lastFrameUpdate"];
	inline function set_lastFrameUpdate(value:Int):Int return untyped this["lastFrameUpdate"] = value;
}
