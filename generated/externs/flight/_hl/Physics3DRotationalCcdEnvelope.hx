package flight._hl;

abstract Physics3DRotationalCcdEnvelope(hl.Bytes) {
	public var angularTravel(get, set):Float;

	inline function get_angularTravel():Float return this.getF64(0);

	inline function set_angularTravel(value:Float):Float { this.setF64(0, value); return value; }
	public var sampleCount(get, set):Int;

	inline function get_sampleCount():Int return this.getI32(8);

	inline function set_sampleCount(value:Int):Int { this.setI32(8, value); return value; }
	public var maxAngularIncrement(get, set):Float;

	inline function get_maxAngularIncrement():Float return this.getF64(16);

	inline function set_maxAngularIncrement(value:Float):Float { this.setF64(16, value); return value; }
	public var maxPointArcTravel(get, set):Float;

	inline function get_maxPointArcTravel():Float return this.getF64(24);

	inline function set_maxPointArcTravel(value:Float):Float { this.setF64(24, value); return value; }
	public var targetIncrementMet(get, set):Bool;

	inline function get_targetIncrementMet():Bool return this.getUI8(32) != 0;

	inline function set_targetIncrementMet(value:Bool):Bool { this.setUI8(32, value ? 1 : 0); return value; }
}
