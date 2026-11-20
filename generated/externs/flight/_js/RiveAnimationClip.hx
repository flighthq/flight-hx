package flight._js;

abstract RiveAnimationClip(Dynamic) {
	public var name(get, set):String;
	inline function get_name():String return untyped this.name;
	inline function set_name(value:String):String return untyped this.name = value;
	public var speed(get, set):Float;
	inline function get_speed():Float return untyped this.speed;
	inline function set_speed(value:Float):Float return untyped this.speed = value;
}
