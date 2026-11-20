package flight._js;

abstract AudioChannel(Dynamic) {
	public var currentTime(get, set):Float;
	inline function get_currentTime():Float return untyped this.currentTime;
	inline function set_currentTime(value:Float):Float return untyped this.currentTime = value;
	public var gain(get, set):Float;
	inline function get_gain():Float return untyped this.gain;
	inline function set_gain(value:Float):Float return untyped this.gain = value;
	public var length(get, set):Float;
	inline function get_length():Float return untyped this.length;
	inline function set_length(value:Float):Float return untyped this.length = value;
	public var loopEnd(get, set):Float;
	inline function get_loopEnd():Float return untyped this.loopEnd;
	inline function set_loopEnd(value:Float):Float return untyped this.loopEnd = value;
	public var loops(get, set):Int;
	inline function get_loops():Int return untyped this.loops;
	inline function set_loops(value:Int):Int return untyped this.loops = value;
	public var loopStart(get, set):Float;
	inline function get_loopStart():Float return untyped this.loopStart;
	inline function set_loopStart(value:Float):Float return untyped this.loopStart = value;
	public var muted(get, set):Bool;
	inline function get_muted():Bool return untyped this.muted;
	inline function set_muted(value:Bool):Bool return untyped this.muted = value;
	public var pan(get, set):Float;
	inline function get_pan():Float return untyped this.pan;
	inline function set_pan(value:Float):Float return untyped this.pan = value;
	public var playbackRate(get, set):Float;
	inline function get_playbackRate():Float return untyped this.playbackRate;
	inline function set_playbackRate(value:Float):Float return untyped this.playbackRate = value;
}
