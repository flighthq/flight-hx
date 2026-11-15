package flight._js;

@:jsRequire("flight")
private extern class SignalTimerState_Ffi {
	@:native("flight_get_signal_timer_state_now_ms") static function get_nowMs(ptr:Dynamic):Float;
	@:native("flight_set_signal_timer_state_now_ms") static function set_nowMs(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_signal_timer_state_next_id") static function get_nextId(ptr:Dynamic):haxe.Int64;
	@:native("flight_set_signal_timer_state_next_id") static function set_nextId(ptr:Dynamic, value:haxe.Int64):haxe.Int64;
}

abstract SignalTimerState(Dynamic) {
	public var nowMs(get, set):Float;

	inline function get_nowMs():Float return SignalTimerState_Ffi.get_nowMs(this);

	inline function set_nowMs(value:Float):Float return SignalTimerState_Ffi.set_nowMs(this, value);
	public var nextId(get, set):haxe.Int64;

	inline function get_nextId():haxe.Int64 return SignalTimerState_Ffi.get_nextId(this);

	inline function set_nextId(value:haxe.Int64):haxe.Int64 return SignalTimerState_Ffi.set_nextId(this, value);
}
