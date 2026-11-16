package flight._js._fn;

@:jsRequire("@flighthq/clock")
extern class Clock {
	@:native("createChildClock")
	public static function createChildClock(parent:Dynamic, options:Null<flight._js.ClockOptions>):Dynamic;
	@:native("createClock")
	public static function createClock():Dynamic;
	@:native("addClockChild")
	public static function addClockChild(parent:Dynamic, child:Dynamic):Void;
	@:native("advanceClock")
	public static function advanceClock(clock:Dynamic, deltaTime:Float):Void;
	@:native("disposeClock")
	public static function disposeClock(clock:Dynamic):Void;
	@:native("getClockEffectiveScale")
	public static function getClockEffectiveScale(clock:flight._js.Clock):Float;
	@:native("getClockParent")
	public static function getClockParent(clock:flight._js.Clock):Null<Dynamic>;
	@:native("isClockEffectivelyPaused")
	public static function isClockEffectivelyPaused(clock:flight._js.Clock):Bool;
	@:native("pauseClock")
	public static function pauseClock(clock:flight._js.Clock):Void;
	@:native("removeClockChild")
	public static function removeClockChild(parent:Dynamic, child:Dynamic):Void;
	@:native("resetClock")
	public static function resetClock(clock:flight._js.Clock):Void;
	@:native("resumeClock")
	public static function resumeClock(clock:flight._js.Clock):Void;
	@:native("setClockScale")
	public static function setClockScale(clock:flight._js.Clock, scale:Float):Void;
}
