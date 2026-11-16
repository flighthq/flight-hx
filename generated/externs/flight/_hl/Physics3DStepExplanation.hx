package flight._hl;

abstract Physics3DStepExplanation(hl.Bytes) {
	public var bodyStateValid(get, set):Bool;

	inline function get_bodyStateValid():Bool return this.getUI8(4) != 0;

	inline function set_bodyStateValid(value:Bool):Bool { this.setUI8(4, value ? 1 : 0); return value; }
	public var colliderStateValid(get, set):Bool;

	inline function get_colliderStateValid():Bool return this.getUI8(5) != 0;

	inline function set_colliderStateValid(value:Bool):Bool { this.setUI8(5, value ? 1 : 0); return value; }
	public var contactStateValid(get, set):Bool;

	inline function get_contactStateValid():Bool return this.getUI8(6) != 0;

	inline function set_contactStateValid(value:Bool):Bool { this.setUI8(6, value ? 1 : 0); return value; }
	public var gravityValid(get, set):Bool;

	inline function get_gravityValid():Bool return this.getUI8(7) != 0;

	inline function set_gravityValid(value:Bool):Bool { this.setUI8(7, value ? 1 : 0); return value; }
	public var jointStateValid(get, set):Bool;

	inline function get_jointStateValid():Bool return this.getUI8(8) != 0;

	inline function set_jointStateValid(value:Bool):Bool { this.setUI8(8, value ? 1 : 0); return value; }
	public var solverConfigValid(get, set):Bool;

	inline function get_solverConfigValid():Bool return this.getUI8(9) != 0;

	inline function set_solverConfigValid(value:Bool):Bool { this.setUI8(9, value ? 1 : 0); return value; }
	public var substepsValid(get, set):Bool;

	inline function get_substepsValid():Bool return this.getUI8(10) != 0;

	inline function set_substepsValid(value:Bool):Bool { this.setUI8(10, value ? 1 : 0); return value; }
	public var timestepValid(get, set):Bool;

	inline function get_timestepValid():Bool return this.getUI8(11) != 0;

	inline function set_timestepValid(value:Bool):Bool { this.setUI8(11, value ? 1 : 0); return value; }
	public var velocityIterationsValid(get, set):Bool;

	inline function get_velocityIterationsValid():Bool return this.getUI8(12) != 0;

	inline function set_velocityIterationsValid(value:Bool):Bool { this.setUI8(12, value ? 1 : 0); return value; }
	public var positionIterationsValid(get, set):Bool;

	inline function get_positionIterationsValid():Bool return this.getUI8(13) != 0;

	inline function set_positionIterationsValid(value:Bool):Bool { this.setUI8(13, value ? 1 : 0); return value; }
}
