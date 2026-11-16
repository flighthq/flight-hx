package flight._js;

abstract AnimationStateMachine(Dynamic) {
	public var currentStateIndex(get, set):Int;
	inline function get_currentStateIndex():Int return untyped this["currentStateIndex"];
	inline function set_currentStateIndex(value:Int):Int return untyped this["currentStateIndex"] = value;
	public var transitionDuration(get, set):Float;
	inline function get_transitionDuration():Float return untyped this["transitionDuration"];
	inline function set_transitionDuration(value:Float):Float return untyped this["transitionDuration"] = value;
	public var transitionElapsed(get, set):Float;
	inline function get_transitionElapsed():Float return untyped this["transitionElapsed"];
	inline function set_transitionElapsed(value:Float):Float return untyped this["transitionElapsed"] = value;
	public var transitionWeight(get, set):Float;
	inline function get_transitionWeight():Float return untyped this["transitionWeight"];
	inline function set_transitionWeight(value:Float):Float return untyped this["transitionWeight"] = value;
}
