package flight._js;

abstract Physics2DWorld(Dynamic) {
	public var gravityX(get, set):Float;
	inline function get_gravityX():Float return untyped this["gravityX"];
	inline function set_gravityX(value:Float):Float return untyped this["gravityX"] = value;
	public var gravityY(get, set):Float;
	inline function get_gravityY():Float return untyped this["gravityY"];
	inline function set_gravityY(value:Float):Float return untyped this["gravityY"] = value;
	public var nextBodyIndex(get, set):Int;
	inline function get_nextBodyIndex():Int return untyped this["nextBodyIndex"];
	inline function set_nextBodyIndex(value:Int):Int return untyped this["nextBodyIndex"] = value;
	public var previousTimestep(get, set):Float;
	inline function get_previousTimestep():Float return untyped this["previousTimestep"];
	inline function set_previousTimestep(value:Float):Float return untyped this["previousTimestep"] = value;
	public var version(get, set):Int;
	inline function get_version():Int return untyped this["version"];
	inline function set_version(value:Int):Int return untyped this["version"] = value;
}
