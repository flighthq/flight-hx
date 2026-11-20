package flight._cpp._fn;

extern class Debug {
	@:native("flight_create_debug_state")
	public static function createDebugState():flight._cpp.DebugState;
	@:native("flight_disable_debug")
	public static function disableDebug(state:cpp.Star<cpp.Void>, logState:cpp.Star<cpp.Void>):Void;
	@:native("flight_enable_debug")
	public static function enableDebug(state:cpp.Star<cpp.Void>, logState:cpp.Star<cpp.Void>, options:flight._cpp.DebugOptions):Void;
	@:native("flight_is_debug_enabled")
	public static function isDebugEnabled(state:cpp.Star<cpp.Void>):Bool;
	@:native("flight_register_debug_subsystem")
	public static function registerDebugSubsystem(state:cpp.Star<cpp.Void>, name:cpp.ConstCharStar, hooks:flight._cpp.DebugSubsystemHooks):Void;
	@:native("flight_unregister_debug_subsystem")
	public static function unregisterDebugSubsystem(state:cpp.Star<cpp.Void>, name:cpp.ConstCharStar):Bool;
	@:native("flight_begin_debug_span")
	public static function beginDebugSpan(state:cpp.Star<cpp.Void>, nowMs:Float, name:cpp.ConstCharStar, channel:cpp.ConstCharStar):flight._cpp.LogTimer;
	@:native("flight_end_debug_span")
	public static function endDebugSpan(logState:cpp.Star<cpp.Void>, nowMs:Float, timer:flight._cpp.LogTimer):Float;
	@:native("flight_mark_debug_frame")
	public static function markDebugFrame(state:cpp.Star<cpp.Void>, logState:cpp.Star<cpp.Void>, nowMs:Float, label:cpp.ConstCharStar, channel:cpp.ConstCharStar):Void;
	@:native("flight_free_debug_state")
	public static function freeDebugState(ptr:flight._cpp.DebugState):Void;
}
