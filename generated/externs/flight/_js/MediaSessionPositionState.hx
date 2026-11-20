package flight._js;

abstract MediaSessionPositionState(Dynamic) {
	public var duration(get, set):Float;
	inline function get_duration():Float return untyped this.duration;
	inline function set_duration(value:Float):Float return untyped this.duration = value;
	public var playbackRate(get, set):Float;
	inline function get_playbackRate():Float return untyped this.playbackRate;
	inline function set_playbackRate(value:Float):Float return untyped this.playbackRate = value;
	public var position(get, set):Float;
	inline function get_position():Float return untyped this.position;
	inline function set_position(value:Float):Float return untyped this.position = value;
}
