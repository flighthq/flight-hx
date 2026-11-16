package flight._hl;

private extern class Clock_Ffi {
	@:hlNative("flight", "flight_get_clock_scale")
	static function get_scale(ptr:hl.Bytes):Float;
	@:hlNative("flight", "flight_set_clock_scale")
	static function set_scale(ptr:hl.Bytes, value:Float):Void;
	@:hlNative("flight", "flight_get_clock_paused")
	static function get_paused(ptr:hl.Bytes):Bool;
	@:hlNative("flight", "flight_set_clock_paused")
	static function set_paused(ptr:hl.Bytes, value:Bool):Bool;
	@:hlNative("flight", "flight_get_clock_delta_time")
	static function get_deltaTime(ptr:hl.Bytes):Float;
	@:hlNative("flight", "flight_set_clock_delta_time")
	static function set_deltaTime(ptr:hl.Bytes, value:Float):Float;
	@:hlNative("flight", "flight_get_clock_elapsed")
	static function get_elapsed(ptr:hl.Bytes):Float;
	@:hlNative("flight", "flight_set_clock_elapsed")
	static function set_elapsed(ptr:hl.Bytes, value:Float):Float;
}

abstract Clock(hl.Bytes) {
	public var scale(get, set):Float;

	inline function get_scale():Float return Clock_Ffi.get_scale(this);
	inline function set_scale(value:Float):Float { Clock_Ffi.set_scale(this, value); return value; }
	public var paused(get, set):Bool;

	inline function get_paused():Bool return Clock_Ffi.get_paused(this);
	inline function set_paused(value:Bool):Bool { Clock_Ffi.set_paused(this, value); return value; }
	public var deltaTime(get, set):Float;

	inline function get_deltaTime():Float return Clock_Ffi.get_deltaTime(this);
	inline function set_deltaTime(value:Float):Float { Clock_Ffi.set_deltaTime(this, value); return value; }
	public var elapsed(get, set):Float;

	inline function get_elapsed():Float return Clock_Ffi.get_elapsed(this);
	inline function set_elapsed(value:Float):Float { Clock_Ffi.set_elapsed(this, value); return value; }

	inline public function getEffectiveScale():Float {
		return flight._hl._fn.Clock.getClockEffectiveScale(cast this);
	}
	inline public function getParent():hl.Bytes {
		return flight._hl._fn.Clock.getClockParent(cast this);
	}
	inline public function isEffectivelyPaused():Bool {
		return flight._hl._fn.Clock.isClockEffectivelyPaused(cast this);
	}
	inline public function pause():Void {
		flight._hl._fn.Clock.pauseClock(cast this);
	}
	inline public function reset():Void {
		flight._hl._fn.Clock.resetClock(cast this);
	}
	inline public function resume():Void {
		flight._hl._fn.Clock.resumeClock(cast this);
	}
	inline public function setScale(scale:Float):Void {
		flight._hl._fn.Clock.setClockScale(cast this, scale);
	}
}
