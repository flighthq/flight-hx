package flight._hl;

abstract Physics3DJointFrames(hl.Bytes) {
	public var localRotationAx(get, set):Float;

	inline function get_localRotationAx():Float return this.getF64(0);

	inline function set_localRotationAx(value:Float):Float { this.setF64(0, value); return value; }
	public var localRotationAy(get, set):Float;

	inline function get_localRotationAy():Float return this.getF64(8);

	inline function set_localRotationAy(value:Float):Float { this.setF64(8, value); return value; }
	public var localRotationAz(get, set):Float;

	inline function get_localRotationAz():Float return this.getF64(16);

	inline function set_localRotationAz(value:Float):Float { this.setF64(16, value); return value; }
	public var localRotationAw(get, set):Float;

	inline function get_localRotationAw():Float return this.getF64(24);

	inline function set_localRotationAw(value:Float):Float { this.setF64(24, value); return value; }
	public var localRotationBx(get, set):Float;

	inline function get_localRotationBx():Float return this.getF64(32);

	inline function set_localRotationBx(value:Float):Float { this.setF64(32, value); return value; }
	public var localRotationBy(get, set):Float;

	inline function get_localRotationBy():Float return this.getF64(40);

	inline function set_localRotationBy(value:Float):Float { this.setF64(40, value); return value; }
	public var localRotationBz(get, set):Float;

	inline function get_localRotationBz():Float return this.getF64(48);

	inline function set_localRotationBz(value:Float):Float { this.setF64(48, value); return value; }
	public var localRotationBw(get, set):Float;

	inline function get_localRotationBw():Float return this.getF64(56);

	inline function set_localRotationBw(value:Float):Float { this.setF64(56, value); return value; }
}
