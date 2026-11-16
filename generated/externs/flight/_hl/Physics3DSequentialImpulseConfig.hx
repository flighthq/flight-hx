package flight._hl;

abstract Physics3DSequentialImpulseConfig(hl.Bytes) {
	public var velocityIterations(get, set):Int;

	inline function get_velocityIterations():Int return this.getI32(0);

	inline function set_velocityIterations(value:Int):Int { this.setI32(0, value); return value; }
	public var positionIterations(get, set):Int;

	inline function get_positionIterations():Int return this.getI32(8);

	inline function set_positionIterations(value:Int):Int { this.setI32(8, value); return value; }
	public var penetrationSlop(get, set):Single;

	inline function get_penetrationSlop():Single return this.getF32(16);

	inline function set_penetrationSlop(value:Single):Single { this.setF32(16, value); return value; }
	public var positionCorrection(get, set):Single;

	inline function get_positionCorrection():Single return this.getF32(20);

	inline function set_positionCorrection(value:Single):Single { this.setF32(20, value); return value; }
	public var restitutionThreshold(get, set):Single;

	inline function get_restitutionThreshold():Single return this.getF32(24);

	inline function set_restitutionThreshold(value:Single):Single { this.setF32(24, value); return value; }
	public var warmStarting(get, set):Bool;

	inline function get_warmStarting():Bool return this.getUI8(28) != 0;

	inline function set_warmStarting(value:Bool):Bool { this.setUI8(28, value ? 1 : 0); return value; }
}
