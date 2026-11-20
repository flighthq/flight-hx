package flight._hl._fn;

extern class Debug {
	@:hlNative("flight", "flight_create_debug_state")
	public static function createDebugState():flight._hl.DebugState;
	@:hlNative("flight", "flight_disable_debug")
	public static function disableDebug(state:hl.Bytes, logState:hl.Bytes):Void;
	@:hlNative("flight", "flight_enable_debug")
	public static function enableDebug(state:hl.Bytes, logState:hl.Bytes, options:flight._hl.DebugOptions):Void;
	@:hlNative("flight", "flight_is_debug_enabled")
	public static function isDebugEnabled(state:hl.Bytes):Bool;
	@:hlNative("flight", "flight_register_debug_subsystem")
	public static function registerDebugSubsystem(state:hl.Bytes, name:hl.Bytes, hooks:flight._hl.DebugSubsystemHooks):Void;
	@:hlNative("flight", "flight_unregister_debug_subsystem")
	public static function unregisterDebugSubsystem(state:hl.Bytes, name:hl.Bytes):Bool;
	@:hlNative("flight", "flight_begin_debug_span")
	public static function beginDebugSpan(state:hl.Bytes, nowMs:Float, name:hl.Bytes, channel:hl.Bytes):flight._hl.LogTimer;
	@:hlNative("flight", "flight_end_debug_span")
	public static function endDebugSpan(logState:hl.Bytes, nowMs:Float, timer:flight._hl.LogTimer):Float;
	@:hlNative("flight", "flight_mark_debug_frame")
	public static function markDebugFrame(state:hl.Bytes, logState:hl.Bytes, nowMs:Float, label:hl.Bytes, channel:hl.Bytes):Void;
	@:hlNative("flight", "flight_free_debug_state")
	public static function freeDebugState(ptr:flight._hl.DebugState):Void;
}
