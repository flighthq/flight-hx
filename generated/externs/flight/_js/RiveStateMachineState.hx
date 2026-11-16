package flight._js;

abstract RiveStateMachineState(Dynamic) {
	public var animationId(get, set):Float;
	inline function get_animationId():Float return untyped this["animationId"];
	inline function set_animationId(value:Float):Float return untyped this["animationId"] = value;
	public var kind(get, set):String;
	inline function get_kind():String return untyped this["kind"];
	inline function set_kind(value:String):String return untyped this["kind"] = value;
}
