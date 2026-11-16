package flight._hl;

abstract Physics3DJointFrames(hl.Bytes) {
	public var localRotationAx(get, set):Single;

	inline function get_localRotationAx():Single return this.getF32(0);

	inline function set_localRotationAx(value:Single):Single { this.setF32(0, value); return value; }
	public var localRotationAy(get, set):Single;

	inline function get_localRotationAy():Single return this.getF32(4);

	inline function set_localRotationAy(value:Single):Single { this.setF32(4, value); return value; }
	public var localRotationAz(get, set):Single;

	inline function get_localRotationAz():Single return this.getF32(8);

	inline function set_localRotationAz(value:Single):Single { this.setF32(8, value); return value; }
	public var localRotationAw(get, set):Single;

	inline function get_localRotationAw():Single return this.getF32(12);

	inline function set_localRotationAw(value:Single):Single { this.setF32(12, value); return value; }
	public var localRotationBx(get, set):Single;

	inline function get_localRotationBx():Single return this.getF32(16);

	inline function set_localRotationBx(value:Single):Single { this.setF32(16, value); return value; }
	public var localRotationBy(get, set):Single;

	inline function get_localRotationBy():Single return this.getF32(20);

	inline function set_localRotationBy(value:Single):Single { this.setF32(20, value); return value; }
	public var localRotationBz(get, set):Single;

	inline function get_localRotationBz():Single return this.getF32(24);

	inline function set_localRotationBz(value:Single):Single { this.setF32(24, value); return value; }
	public var localRotationBw(get, set):Single;

	inline function get_localRotationBw():Single return this.getF32(28);

	inline function set_localRotationBw(value:Single):Single { this.setF32(28, value); return value; }
}
