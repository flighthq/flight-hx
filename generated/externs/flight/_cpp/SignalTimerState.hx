package flight._cpp;

private extern class SignalTimerState_Ffi {
	@:native("flight_get_signal_timer_state_now_ms") static function get_nowMs(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_signal_timer_state_now_ms") static function set_nowMs(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_signal_timer_state_next_id") static function get_nextId(ptr:cpp.Star<cpp.Void>):haxe.Int64;
	@:native("flight_set_signal_timer_state_next_id") static function set_nextId(ptr:cpp.Star<cpp.Void>, value:haxe.Int64):haxe.Int64;
}

abstract SignalTimerState(cpp.Star<cpp.Void>) {
	public var nowMs(get, set):Float;

	inline function get_nowMs():Float return SignalTimerState_Ffi.get_nowMs(this);

	inline function set_nowMs(value:Float):Float { SignalTimerState_Ffi.set_nowMs(this, value); return value; }
	public var nextId(get, set):haxe.Int64;

	inline function get_nextId():haxe.Int64 return SignalTimerState_Ffi.get_nextId(this);

	inline function set_nextId(value:haxe.Int64):haxe.Int64 { SignalTimerState_Ffi.set_nextId(this, value); return value; }
}
