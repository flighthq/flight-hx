package flight._js;

abstract RiveAnimationClip(Dynamic) {
	public var speed(get, set):Float;
	inline function get_speed():Float return untyped this.speed;
	inline function set_speed(value:Float):Float return untyped this.speed = value;
}
