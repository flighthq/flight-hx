package flight._hl;

abstract Physics2DMouseJoint(hl.Bytes) {
	public var dampingRatio(get, set):Single;

	inline function get_dampingRatio():Single return this.getF32(136);

	inline function set_dampingRatio(value:Single):Single { this.setF32(136, value); return value; }
	public var frequencyHz(get, set):Single;

	inline function get_frequencyHz():Single return this.getF32(140);

	inline function set_frequencyHz(value:Single):Single { this.setF32(140, value); return value; }
	public var maxForce(get, set):Single;

	inline function get_maxForce():Single return this.getF32(144);

	inline function set_maxForce(value:Single):Single { this.setF32(144, value); return value; }
	public var targetX(get, set):Single;

	inline function get_targetX():Single return this.getF32(148);

	inline function set_targetX(value:Single):Single { this.setF32(148, value); return value; }
	public var targetY(get, set):Single;

	inline function get_targetY():Single return this.getF32(152);

	inline function set_targetY(value:Single):Single { this.setF32(152, value); return value; }
}
