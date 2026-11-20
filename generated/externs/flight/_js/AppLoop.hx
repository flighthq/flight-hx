package flight._js;

abstract AppLoop(Dynamic) {
	public var deltaTime(get, set):Float;
	inline function get_deltaTime():Float return untyped this.deltaTime;
	inline function set_deltaTime(value:Float):Float return untyped this.deltaTime = value;
	public var elapsedTime(get, set):Float;
	inline function get_elapsedTime():Float return untyped this.elapsedTime;
	inline function set_elapsedTime(value:Float):Float return untyped this.elapsedTime = value;
	public var frameCount(get, set):Int;
	inline function get_frameCount():Int return untyped this.frameCount;
	inline function set_frameCount(value:Int):Int return untyped this.frameCount = value;
	public var interpolationAlpha(get, set):Float;
	inline function get_interpolationAlpha():Float return untyped this.interpolationAlpha;
	inline function set_interpolationAlpha(value:Float):Float return untyped this.interpolationAlpha = value;
	public var isRunning(get, set):Bool;
	inline function get_isRunning():Bool return untyped this.isRunning;
	inline function set_isRunning(value:Bool):Bool return untyped this.isRunning = value;
}
