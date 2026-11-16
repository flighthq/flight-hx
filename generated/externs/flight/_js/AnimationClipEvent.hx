package flight._js;

abstract AnimationClipEvent(Dynamic) {
	public var time(get, set):Float;
	inline function get_time():Float return untyped this.time;
	inline function set_time(value:Float):Float return untyped this.time = value;
}
