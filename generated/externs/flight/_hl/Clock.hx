package flight._hl;

abstract Clock(hl.Bytes) {
	public var scale(get, set):Float;

	inline function get_scale():Float return this.getF64(16);

	inline function set_scale(value:Float):Float { this.setF64(16, value); return value; }
	public var paused(get, set):Bool;

	inline function get_paused():Bool return this.getUI8(24) != 0;

	inline function set_paused(value:Bool):Bool { this.setUI8(24, value ? 1 : 0); return value; }
	public var deltaTime(get, set):Float;

	inline function get_deltaTime():Float return this.getF64(32);

	inline function set_deltaTime(value:Float):Float { this.setF64(32, value); return value; }
	public var elapsed(get, set):Float;

	inline function get_elapsed():Float return this.getF64(40);

	inline function set_elapsed(value:Float):Float { this.setF64(40, value); return value; }

	inline public function getEffectiveScale():Float {
		return flight._hl._fn.Clock.getClockEffectiveScale(cast this);
	}
	inline public function getParent():Dynamic {
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
