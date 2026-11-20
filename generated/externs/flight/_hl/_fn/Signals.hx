package flight._hl._fn;

extern class Signals {
	@:hlNative("flight", "flight_disconnect_signal_connection")
	public static function disconnectSignalConnection(connection:flight._hl.SignalConnection):Void;
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
	public static function advanceSignalTimers(state:hl.Bytes, nowMs:Float):Void;
	@:hlNative("flight", "flight_clear_signal_timeout")
	public static function clearSignalTimeout(state:hl.Bytes, id:flight._hl.TimerId):Void;
	@:hlNative("flight", "flight_free_signal_scope")
	public static function freeSignalScope(ptr:flight._hl.SignalScope):Void;
	@:hlNative("flight", "flight_free_signal_timer_state")
	public static function freeSignalTimerState(ptr:flight._hl.SignalTimerState):Void;
	@:hlNative("flight", "flight_free_timer_id")
	public static function freeTimerId(ptr:flight._hl.TimerId):Void;
	@:hlNative("flight", "flight_free_slot_id")
	public static function freeSlotId(ptr:flight._hl.SlotId):Void;
}
