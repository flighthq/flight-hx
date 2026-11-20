package flight._js;

abstract SignalTimerState(Dynamic) {
	public var nowMs(get, set):Float;
	inline function get_nowMs():Float return untyped this.nowMs;
	inline function set_nowMs(value:Float):Float return untyped this.nowMs = value;
	public var nextId(get, set):Float;
	inline function get_nextId():Float return untyped this.nextId;
	inline function set_nextId(value:Float):Float return untyped this.nextId = value;
}
