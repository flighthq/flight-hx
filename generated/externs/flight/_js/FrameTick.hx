package flight._js;

abstract FrameTick(Dynamic) {
	public var deltaTime(get, set):Float;
	inline function get_deltaTime():Float return untyped this["deltaTime"];
	inline function set_deltaTime(value:Float):Float return untyped this["deltaTime"] = value;
}
