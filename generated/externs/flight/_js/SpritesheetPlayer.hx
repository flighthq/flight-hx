package flight._js;

abstract SpritesheetPlayer(Dynamic) {
	public var complete(get, set):Bool;
	inline function get_complete():Bool return untyped this.complete;
	inline function set_complete(value:Bool):Bool return untyped this.complete = value;
	public var elapsed(get, set):Float;
	inline function get_elapsed():Float return untyped this.elapsed;
	inline function set_elapsed(value:Float):Float return untyped this.elapsed = value;
	public var paused(get, set):Bool;
	inline function get_paused():Bool return untyped this.paused;
	inline function set_paused(value:Bool):Bool return untyped this.paused = value;
	public var speed(get, set):Float;
	inline function get_speed():Float return untyped this.speed;
	inline function set_speed(value:Float):Float return untyped this.speed = value;
	public var frameIndex(get, set):Float;
	inline function get_frameIndex():Float return untyped this.frameIndex;
	inline function set_frameIndex(value:Float):Float return untyped this.frameIndex = value;
}
