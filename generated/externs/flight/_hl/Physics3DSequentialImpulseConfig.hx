package flight._hl;

abstract Physics3DSequentialImpulseConfig(hl.Bytes) {
	public var velocityIterations(get, set):Int;

	inline function get_velocityIterations():Int return this.getI32(0);

	inline function set_velocityIterations(value:Int):Int { this.setI32(0, value); return value; }
	public var positionIterations(get, set):Int;

	inline function get_positionIterations():Int return this.getI32(8);

	inline function set_positionIterations(value:Int):Int { this.setI32(8, value); return value; }
	public var penetrationSlop(get, set):Float;

	inline function get_penetrationSlop():Float return this.getF64(16);

	inline function set_penetrationSlop(value:Float):Float { this.setF64(16, value); return value; }
	public var positionCorrection(get, set):Float;

	inline function get_positionCorrection():Float return this.getF64(24);

	inline function set_positionCorrection(value:Float):Float { this.setF64(24, value); return value; }
	public var restitutionThreshold(get, set):Float;

	inline function get_restitutionThreshold():Float return this.getF64(32);

	inline function set_restitutionThreshold(value:Float):Float { this.setF64(32, value); return value; }
	public var warmStarting(get, set):Bool;

	inline function get_warmStarting():Bool return this.getUI8(40) != 0;

	inline function set_warmStarting(value:Bool):Bool { this.setUI8(40, value ? 1 : 0); return value; }
}
