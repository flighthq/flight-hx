package flight._js._fn;

@:jsRequire("@flighthq/debug")
extern class Debug {
	@:native("createDebugState")
	public static function createDebugState():flight._js.DebugState;
	@:native("disableDebug")
	public static function disableDebug(state:Dynamic, logState:Dynamic):Void;
	@:native("enableDebug")
	public static function enableDebug(state:Dynamic, logState:Dynamic, options:Null<flight._js.DebugOptions>):Void;
	@:native("isDebugEnabled")
	public static function isDebugEnabled(state:Dynamic):Bool;
	@:native("registerDebugSubsystem")
	public static function registerDebugSubsystem(state:Dynamic, name:String, hooks:flight._js.DebugSubsystemHooks):Void;
	@:native("unregisterDebugSubsystem")
	public static function unregisterDebugSubsystem(state:Dynamic, name:String):Bool;
	@:native("beginDebugSpan")
	public static function beginDebugSpan(state:Dynamic, nowMs:Float, name:String, channel:Null<String>):Null<flight._js.LogTimer>;
	@:native("endDebugSpan")
	public static function endDebugSpan(logState:Dynamic, nowMs:Float, timer:Null<flight._js.LogTimer>):Float;
	@:native("markDebugFrame")
	public static function markDebugFrame(state:Dynamic, logState:Dynamic, nowMs:Float, label:Null<String>, channel:Null<String>):Void;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeDebugState(ptr:flight._js.DebugState):Void {}
}
