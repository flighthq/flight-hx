package flight._cpp._fn;

extern class Clock {
	@:native("flight_create_child_clock")
	public static function createChildClock(parent:cpp.Star<cpp.Void>, options:flight._cpp.ClockOptions):cpp.Star<cpp.Void>;
	@:native("flight_create_clock")
	public static function createClock():cpp.Star<cpp.Void>;
	@:native("flight_add_clock_child")
	public static function addClockChild(parent:cpp.Star<cpp.Void>, child:cpp.Star<cpp.Void>):Void;
	@:native("flight_advance_clock")
	public static function advanceClock(clock:cpp.Star<cpp.Void>, deltaTime:Float):Void;
	@:native("flight_dispose_clock")
	public static function disposeClock(clock:cpp.Star<cpp.Void>):Void;
	@:native("flight_get_clock_effective_scale")
	public static function getClockEffectiveScale(clock:flight._cpp.Clock):Float;
	@:native("flight_get_clock_parent")
	public static function getClockParent(clock:flight._cpp.Clock):cpp.Star<cpp.Void>;
	@:native("flight_is_clock_effectively_paused")
	public static function isClockEffectivelyPaused(clock:flight._cpp.Clock):Bool;
	@:native("flight_pause_clock")
	public static function pauseClock(clock:flight._cpp.Clock):Void;
	@:native("flight_remove_clock_child")
	public static function removeClockChild(parent:cpp.Star<cpp.Void>, child:cpp.Star<cpp.Void>):Void;
	@:native("flight_reset_clock")
	public static function resetClock(clock:flight._cpp.Clock):Void;
	@:native("flight_resume_clock")
	public static function resumeClock(clock:flight._cpp.Clock):Void;
	@:native("flight_set_clock_scale")
	public static function setClockScale(clock:flight._cpp.Clock, scale:Float):Void;
}
