package flight._cpp;

private extern class Clock_Ffi {
	@:native("flight_get_clock_scale") static function get_scale(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_get_clock_paused") static function get_paused(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_clock_paused") static function set_paused(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_clock_delta_time") static function get_deltaTime(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_clock_delta_time") static function set_deltaTime(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_clock_elapsed") static function get_elapsed(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_clock_elapsed") static function set_elapsed(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract Clock(cpp.Star<cpp.Void>) {
	public var scale(get, never):Float;

	inline function get_scale():Float return Clock_Ffi.get_scale(this);
	public var paused(get, set):Bool;

	inline function get_paused():Bool return Clock_Ffi.get_paused(this);

	inline function set_paused(value:Bool):Bool { Clock_Ffi.set_paused(this, value); return value; }
	public var deltaTime(get, set):Float;

	inline function get_deltaTime():Float return Clock_Ffi.get_deltaTime(this);

	inline function set_deltaTime(value:Float):Float { Clock_Ffi.set_deltaTime(this, value); return value; }
	public var elapsed(get, set):Float;

	inline function get_elapsed():Float return Clock_Ffi.get_elapsed(this);

	inline function set_elapsed(value:Float):Float { Clock_Ffi.set_elapsed(this, value); return value; }

	extern inline public function getEffectiveScale():Float {
		return flight._cpp._fn.Clock.getClockEffectiveScale(cast this);
	}
	extern inline public function getParent():cpp.Star<cpp.Void> {
		return flight._cpp._fn.Clock.getClockParent(cast this);
	}
	extern inline public function isEffectivelyPaused():Bool {
		return flight._cpp._fn.Clock.isClockEffectivelyPaused(cast this);
	}
	extern inline public function pause():Void {
		flight._cpp._fn.Clock.pauseClock(cast this);
	}
	extern inline public function reset():Void {
		flight._cpp._fn.Clock.resetClock(cast this);
	}
	extern inline public function resume():Void {
		flight._cpp._fn.Clock.resumeClock(cast this);
	}
	extern inline public function setScale(scale:Float):Void {
		flight._cpp._fn.Clock.setClockScale(cast this, scale);
	}
	extern inline public function freeRef():Void {
		flight._cpp._fn.Clock.freeClockRef(cast this);
	}
}
