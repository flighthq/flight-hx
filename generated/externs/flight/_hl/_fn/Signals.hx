package flight._hl._fn;

extern class Signals {
	@:hlNative("flight", "flight_disconnect_signal_connection")
	public static function disconnectSignalConnection(connection:flight._hl.SignalConnection):Void;
	@:hlNative("flight", "flight_is_signal_connection_connected")
	public static function isSignalConnectionConnected(connection:flight._hl.SignalConnection):Bool;
	@:hlNative("flight", "flight_is_signal_connection_paused")
	public static function isSignalConnectionPaused(connection:flight._hl.SignalConnection):Bool;
	@:hlNative("flight", "flight_pause_signal_connection")
	public static function pauseSignalConnection(connection:flight._hl.SignalConnection):Void;
	@:hlNative("flight", "flight_resume_signal_connection")
	public static function resumeSignalConnection(connection:flight._hl.SignalConnection):Void;
	@:hlNative("flight", "flight_create_signal_scope")
	public static function createSignalScope():flight._hl.SignalScope;
	@:hlNative("flight", "flight_disconnect_signal_scope")
	public static function disconnectSignalScope(scope:flight._hl.SignalScope):Void;
	@:hlNative("flight", "flight_create_signal_timer_state")
	public static function createSignalTimerState():flight._hl.SignalTimerState;
	@:hlNative("flight", "flight_advance_signal_timers")
	public static function advanceSignalTimers(state:Dynamic, nowMs:Float):Void;
	@:hlNative("flight", "flight_clear_signal_timeout")
	public static function clearSignalTimeout(state:Dynamic, id:flight._hl.TimerId):Void;
	@:hlNative("flight", "flight_set_signal_timeout")
	public static function setSignalTimeout(state:Dynamic, delayMs:Float, callback_Fn:Dynamic, callback_Ctx:Dynamic):flight._hl.TimerId;
	@:hlNative("flight", "flight_free_signal_scope")
	public static function freeSignalScope(ptr:flight._hl.SignalScope):Void;
	@:hlNative("flight", "flight_free_signal_timer_state")
	public static function freeSignalTimerState(ptr:flight._hl.SignalTimerState):Void;
	@:hlNative("flight", "flight_free_timer_id")
	public static function freeTimerId(ptr:flight._hl.TimerId):Void;
}
