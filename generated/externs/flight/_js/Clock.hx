package flight._js;

@:jsRequire("flight")
private extern class Clock_Ffi {
	@:native("flight_get_clock_paused") static function get_paused(ptr:Dynamic):Bool;
	@:native("flight_set_clock_paused") static function set_paused(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_clock_delta_time") static function get_deltaTime(ptr:Dynamic):Float;
	@:native("flight_set_clock_delta_time") static function set_deltaTime(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_clock_elapsed") static function get_elapsed(ptr:Dynamic):Float;
	@:native("flight_set_clock_elapsed") static function set_elapsed(ptr:Dynamic, value:Float):Float;
}

abstract Clock(Dynamic) {
	public var paused(get, set):Bool;

	inline function get_paused():Bool return Clock_Ffi.get_paused(this);

	inline function set_paused(value:Bool):Bool return Clock_Ffi.set_paused(this, value);
	public var deltaTime(get, set):Float;

	inline function get_deltaTime():Float return Clock_Ffi.get_deltaTime(this);

	inline function set_deltaTime(value:Float):Float return Clock_Ffi.set_deltaTime(this, value);
	public var elapsed(get, set):Float;

	inline function get_elapsed():Float return Clock_Ffi.get_elapsed(this);

	inline function set_elapsed(value:Float):Float return Clock_Ffi.set_elapsed(this, value);

	inline public function getEffectiveScale():Float {
		return flight._js._fn.Clock.getClockEffectiveScale(cast this);
	}
	inline public function getParent():Dynamic {
		return flight._js._fn.Clock.getClockParent(cast this);
	}
	inline public function isEffectivelyPaused():Bool {
		return flight._js._fn.Clock.isClockEffectivelyPaused(cast this);
	}
	inline public function pause():Void {
		flight._js._fn.Clock.pauseClock(cast this);
	}
	inline public function reset():Void {
		flight._js._fn.Clock.resetClock(cast this);
	}
	inline public function resume():Void {
		flight._js._fn.Clock.resumeClock(cast this);
	}
	inline public function setScale(scale:Float):Void {
		flight._js._fn.Clock.setClockScale(cast this, scale);
	}
}
