package flight._hl;

abstract Physics2DStepExplanation(hl.Bytes) {
	public var bodyStateValid(get, set):Bool;

	inline function get_bodyStateValid():Bool return this.getUI8(0) != 0;

	inline function set_bodyStateValid(value:Bool):Bool { this.setUI8(0, value ? 1 : 0); return value; }
	public var contactStateValid(get, set):Bool;

	inline function get_contactStateValid():Bool return this.getUI8(1) != 0;

	inline function set_contactStateValid(value:Bool):Bool { this.setUI8(1, value ? 1 : 0); return value; }
	public var gravityValid(get, set):Bool;

	inline function get_gravityValid():Bool return this.getUI8(2) != 0;

	inline function set_gravityValid(value:Bool):Bool { this.setUI8(2, value ? 1 : 0); return value; }
	public var jointStateValid(get, set):Bool;

	inline function get_jointStateValid():Bool return this.getUI8(3) != 0;

	inline function set_jointStateValid(value:Bool):Bool { this.setUI8(3, value ? 1 : 0); return value; }
	public var positionIterationsValid(get, set):Bool;

	inline function get_positionIterationsValid():Bool return this.getUI8(4) != 0;

	inline function set_positionIterationsValid(value:Bool):Bool { this.setUI8(4, value ? 1 : 0); return value; }
	public var previousTimestepValid(get, set):Bool;

	inline function get_previousTimestepValid():Bool return this.getUI8(5) != 0;

	inline function set_previousTimestepValid(value:Bool):Bool { this.setUI8(5, value ? 1 : 0); return value; }
	public var solverConfigValid(get, set):Bool;

	inline function get_solverConfigValid():Bool return this.getUI8(6) != 0;

	inline function set_solverConfigValid(value:Bool):Bool { this.setUI8(6, value ? 1 : 0); return value; }
	public var timestepValid(get, set):Bool;

	inline function get_timestepValid():Bool return this.getUI8(12) != 0;

	inline function set_timestepValid(value:Bool):Bool { this.setUI8(12, value ? 1 : 0); return value; }
	public var velocityIterationsValid(get, set):Bool;

	inline function get_velocityIterationsValid():Bool return this.getUI8(13) != 0;

	inline function set_velocityIterationsValid(value:Bool):Bool { this.setUI8(13, value ? 1 : 0); return value; }
}
