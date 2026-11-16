package flight._js;

abstract RiveStateMachineState(Dynamic) {
	public var animationId(get, set):Float;
	inline function get_animationId():Float return untyped this.animationId;
	inline function set_animationId(value:Float):Float return untyped this.animationId = value;
}
