package flight._hl._fn;

extern class Clock {
	@:hlNative("flight", "flight_create_child_clock")
	public static function createChildClock(parent:Dynamic, options:flight._hl.ClockOptions):Dynamic;
	@:hlNative("flight", "flight_create_clock")
	public static function createClock():Dynamic;
	@:hlNative("flight", "flight_add_clock_child")
	public static function addClockChild(parent:Dynamic, child:Dynamic):Void;
	@:hlNative("flight", "flight_advance_clock")
	public static function advanceClock(clock:Dynamic, deltaTime:Float):Void;
	@:hlNative("flight", "flight_dispose_clock")
	public static function disposeClock(clock:Dynamic):Void;
	@:hlNative("flight", "flight_get_clock_effective_scale")
	public static function getClockEffectiveScale(clock:flight._hl.Clock):Float;
	@:hlNative("flight", "flight_get_clock_parent")
	public static function getClockParent(clock:flight._hl.Clock):Dynamic;
	@:hlNative("flight", "flight_is_clock_effectively_paused")
	public static function isClockEffectivelyPaused(clock:flight._hl.Clock):Bool;
	@:hlNative("flight", "flight_pause_clock")
	public static function pauseClock(clock:flight._hl.Clock):Void;
	@:hlNative("flight", "flight_remove_clock_child")
	public static function removeClockChild(parent:Dynamic, child:Dynamic):Void;
	@:hlNative("flight", "flight_reset_clock")
	public static function resetClock(clock:flight._hl.Clock):Void;
	@:hlNative("flight", "flight_resume_clock")
	public static function resumeClock(clock:flight._hl.Clock):Void;
	@:hlNative("flight", "flight_set_clock_scale")
	public static function setClockScale(clock:flight._hl.Clock, scale:Float):Void;
}
