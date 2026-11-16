package flight._js;

abstract VertexDisplaceModifier(Dynamic) {
	public var amplitude(get, set):Float;
	inline function get_amplitude():Float return untyped this.amplitude;
	inline function set_amplitude(value:Float):Float return untyped this.amplitude = value;
	public var frequency(get, set):Float;
	inline function get_frequency():Float return untyped this.frequency;
	inline function set_frequency(value:Float):Float return untyped this.frequency = value;
	public var speed(get, set):Float;
	inline function get_speed():Float return untyped this.speed;
	inline function set_speed(value:Float):Float return untyped this.speed = value;
}
