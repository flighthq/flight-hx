package flight._hl;

abstract Physics2DWeldJoint(hl.Bytes) {
	public var referenceAngle(get, set):Single;

	inline function get_referenceAngle():Single return this.getF32(136);

	inline function set_referenceAngle(value:Single):Single { this.setF32(136, value); return value; }
}
