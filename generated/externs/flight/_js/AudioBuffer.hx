package flight._js;

abstract AudioBuffer(Dynamic) {
	public var sampleRate(get, set):Float;
	inline function get_sampleRate():Float return untyped this.sampleRate;
	inline function set_sampleRate(value:Float):Float return untyped this.sampleRate = value;
	public var length(get, set):Int;
	inline function get_length():Int return untyped this.length;
	inline function set_length(value:Int):Int return untyped this.length = value;
}
