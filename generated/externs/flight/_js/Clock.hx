package flight._js;

abstract Clock(Dynamic) {
	public var scale(get, set):Float;
	inline function get_scale():Float return untyped this.scale;
	inline function set_scale(value:Float):Float return untyped this.scale = value;
	public var paused(get, set):Bool;
	inline function get_paused():Bool return untyped this.paused;
	inline function set_paused(value:Bool):Bool return untyped this.paused = value;
	public var deltaTime(get, set):Float;
	inline function get_deltaTime():Float return untyped this.deltaTime;
	inline function set_deltaTime(value:Float):Float return untyped this.deltaTime = value;
	public var elapsed(get, set):Float;
	inline function get_elapsed():Float return untyped this.elapsed;
	inline function set_elapsed(value:Float):Float return untyped this.elapsed = value;
	inline public function getEffectiveScale():Float {
		return flight._js._fn.Clock.getClockEffectiveScale(cast this);
	}
	inline public function getParent():Null<Dynamic> {
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
