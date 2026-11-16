package flight._hl;

abstract Physics3DRotationalCcdEnvelope(hl.Bytes) {
	public var angularTravel(get, set):Single;

	inline function get_angularTravel():Single return this.getF32(8);

	inline function set_angularTravel(value:Single):Single { this.setF32(8, value); return value; }
	public var sampleCount(get, set):Int;

	inline function get_sampleCount():Int return this.getI32(0);

	inline function set_sampleCount(value:Int):Int { this.setI32(0, value); return value; }
	public var maxAngularIncrement(get, set):Single;

	inline function get_maxAngularIncrement():Single return this.getF32(12);

	inline function set_maxAngularIncrement(value:Single):Single { this.setF32(12, value); return value; }
	public var maxPointArcTravel(get, set):Single;

	inline function get_maxPointArcTravel():Single return this.getF32(16);

	inline function set_maxPointArcTravel(value:Single):Single { this.setF32(16, value); return value; }
	public var targetIncrementMet(get, set):Bool;

	inline function get_targetIncrementMet():Bool return this.getUI8(20) != 0;

	inline function set_targetIncrementMet(value:Bool):Bool { this.setUI8(20, value ? 1 : 0); return value; }
}
