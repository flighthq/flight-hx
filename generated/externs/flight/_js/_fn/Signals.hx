package flight._js._fn;

@:jsRequire("flight")
extern class Signals {
	@:native("flight_disconnect_signal_connection")
	public static function disconnectSignalConnection(connection:flight._js.SignalConnection):Void;
	@:native("flight_is_signal_connection_connected")
	public static function isSignalConnectionConnected(connection:flight._js.SignalConnection):Bool;
	@:native("flight_is_signal_connection_paused")
	public static function isSignalConnectionPaused(connection:flight._js.SignalConnection):Bool;
	@:native("flight_pause_signal_connection")
	public static function pauseSignalConnection(connection:flight._js.SignalConnection):Void;
	@:native("flight_resume_signal_connection")
	public static function resumeSignalConnection(connection:flight._js.SignalConnection):Void;
	@:native("flight_create_signal_scope")
	public static function createSignalScope():flight._js.SignalScope;
	@:native("flight_disconnect_signal_scope")
	public static function disconnectSignalScope(scope:flight._js.SignalScope):Void;
	@:native("flight_create_signal_timer_state")
	public static function createSignalTimerState():flight._js.SignalTimerState;
	@:native("flight_advance_signal_timers")
	public static function advanceSignalTimers(state:Dynamic, nowMs:Float):Void;
	@:native("flight_clear_signal_timeout")
	public static function clearSignalTimeout(state:Dynamic, id:flight._js.TimerId):Void;
	@:native("flight_set_signal_timeout")
	public static function setSignalTimeout(state:Dynamic, delayMs:Float, callback_Fn:Dynamic, callback_Ctx:Dynamic):flight._js.TimerId;
	@:native("flight_free_signal_scope")
	public static function freeSignalScope(ptr:flight._js.SignalScope):Void;
	@:native("flight_free_signal_timer_state")
	public static function freeSignalTimerState(ptr:flight._js.SignalTimerState):Void;
	@:native("flight_free_timer_id")
	public static function freeTimerId(ptr:flight._js.TimerId):Void;
}
