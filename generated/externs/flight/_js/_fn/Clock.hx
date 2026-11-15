package flight._js._fn;

@:jsRequire("flight")
extern class Clock {
	@:native("flight_create_child_clock")
	public static function createChildClock(parent:Dynamic, options:flight._js.ClockOptions):Dynamic;
	@:native("flight_create_clock")
	public static function createClock():Dynamic;
	@:native("flight_add_clock_child")
	public static function addClockChild(parent:Dynamic, child:Dynamic):Void;
	@:native("flight_advance_clock")
	public static function advanceClock(clock:Dynamic, deltaTime:Float):Void;
	@:native("flight_dispose_clock")
	public static function disposeClock(clock:Dynamic):Void;
	@:native("flight_get_clock_effective_scale")
	public static function getClockEffectiveScale(clock:flight._js.Clock):Float;
	@:native("flight_get_clock_parent")
	public static function getClockParent(clock:flight._js.Clock):Dynamic;
	@:native("flight_is_clock_effectively_paused")
	public static function isClockEffectivelyPaused(clock:flight._js.Clock):Bool;
	@:native("flight_pause_clock")
	public static function pauseClock(clock:flight._js.Clock):Void;
	@:native("flight_remove_clock_child")
	public static function removeClockChild(parent:Dynamic, child:Dynamic):Void;
	@:native("flight_reset_clock")
	public static function resetClock(clock:flight._js.Clock):Void;
	@:native("flight_resume_clock")
	public static function resumeClock(clock:flight._js.Clock):Void;
	@:native("flight_set_clock_scale")
	public static function setClockScale(clock:flight._js.Clock, scale:Float):Void;
}
