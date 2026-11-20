package flight._js;

abstract MotionPath(Dynamic) {
	public var distance(get, set):Float;
	inline function get_distance():Float return untyped this.distance;
	inline function set_distance(value:Float):Float return untyped this.distance = value;
	public var length(get, set):Float;
	inline function get_length():Float return untyped this.length;
	inline function set_length(value:Float):Float return untyped this.length = value;
	public var speed(get, set):Float;
	inline function get_speed():Float return untyped this.speed;
	inline function set_speed(value:Float):Float return untyped this.speed = value;
}
