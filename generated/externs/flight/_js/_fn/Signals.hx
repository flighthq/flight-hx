package flight._js._fn;

@:jsRequire("@flighthq/signals")
extern class Signals {
	@:native("disconnectSignalConnection")
	public static function disconnectSignalConnection(connection:flight._js.SignalConnection):Void;
	@:native("pauseSignalConnection")
	public static function pauseSignalConnection(connection:flight._js.SignalConnection):Void;
	@:native("resumeSignalConnection")
	public static function resumeSignalConnection(connection:flight._js.SignalConnection):Void;
	@:native("createSignalScope")
	public static function createSignalScope():flight._js.SignalScope;
	@:native("disconnectSignalScope")
	public static function disconnectSignalScope(scope:flight._js.SignalScope):Void;
	@:native("createSignalTimerState")
	public static function createSignalTimerState():flight._js.SignalTimerState;
	@:native("advanceSignalTimers")
	public static function advanceSignalTimers(state:Dynamic, nowMs:Float):Void;
	@:native("clearSignalTimeout")
	public static function clearSignalTimeout(state:Dynamic, id:flight._js.TimerId):Void;
	@:native("setSignalTimeout")
	public static function setSignalTimeout(state:Dynamic, delayMs:Float, callback_:Dynamic):flight._js.TimerId;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeSignalScope(ptr:flight._js.SignalScope):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeSignalTimerState(ptr:flight._js.SignalTimerState):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeTimerId(ptr:flight._js.TimerId):Void {}
}
