package flight._cpp._fn;

extern class Signals {
	@:native("flight_disconnect_signal_connection")
	public static function disconnectSignalConnection(connection:flight._cpp.SignalConnection):Void;
	@:native("flight_is_signal_connection_connected")
	public static function isSignalConnectionConnected(connection:flight._cpp.SignalConnection):Bool;
	@:native("flight_is_signal_connection_paused")
	public static function isSignalConnectionPaused(connection:flight._cpp.SignalConnection):Bool;
	@:native("flight_pause_signal_connection")
	public static function pauseSignalConnection(connection:flight._cpp.SignalConnection):Void;
	@:native("flight_resume_signal_connection")
	public static function resumeSignalConnection(connection:flight._cpp.SignalConnection):Void;
	@:native("flight_create_signal_scope")
	public static function createSignalScope():flight._cpp.SignalScope;
	@:native("flight_disconnect_signal_scope")
	public static function disconnectSignalScope(scope:flight._cpp.SignalScope):Void;
	@:native("flight_create_signal_timer_state")
	public static function createSignalTimerState():flight._cpp.SignalTimerState;
	@:native("flight_advance_signal_timers")
	public static function advanceSignalTimers(state:cpp.Star<cpp.Void>, nowMs:Float):Void;
	@:native("flight_clear_signal_timeout")
	public static function clearSignalTimeout(state:cpp.Star<cpp.Void>, id:flight._cpp.TimerId):Void;
	@:native("flight_set_signal_timeout")
	public static function setSignalTimeout(state:cpp.Star<cpp.Void>, delayMs:Float, callback_Fn:cpp.Star<cpp.Void>, callback_Ctx:cpp.Star<cpp.Void>):flight._cpp.TimerId;
	@:native("flight_free_signal_scope")
	public static function freeSignalScope(ptr:flight._cpp.SignalScope):Void;
	@:native("flight_free_signal_timer_state")
	public static function freeSignalTimerState(ptr:flight._cpp.SignalTimerState):Void;
	@:native("flight_free_timer_id")
	public static function freeTimerId(ptr:flight._cpp.TimerId):Void;
}
