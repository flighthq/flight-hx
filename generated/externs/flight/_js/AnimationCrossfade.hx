package flight._js;

abstract AnimationCrossfade(Dynamic) {
	public var duration(get, set):Float;
	inline function get_duration():Float return untyped this.duration;
	inline function set_duration(value:Float):Float return untyped this.duration = value;
	public var elapsed(get, set):Float;
	inline function get_elapsed():Float return untyped this.elapsed;
	inline function set_elapsed(value:Float):Float return untyped this.elapsed = value;
	public var weight(get, set):Float;
	inline function get_weight():Float return untyped this.weight;
	inline function set_weight(value:Float):Float return untyped this.weight = value;
}
