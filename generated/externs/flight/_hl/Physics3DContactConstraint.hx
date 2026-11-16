package flight._hl;

abstract Physics3DContactConstraint(hl.Bytes) {
	public var contact(get, set):Int;

	inline function get_contact():Int return this.getI32(48);

	inline function set_contact(value:Int):Int { this.setI32(48, value); return value; }
	public var tangent0X(get, set):Single;

	inline function get_tangent0X():Single return this.getF32(52);

	inline function set_tangent0X(value:Single):Single { this.setF32(52, value); return value; }
	public var tangent0Y(get, set):Single;

	inline function get_tangent0Y():Single return this.getF32(56);

	inline function set_tangent0Y(value:Single):Single { this.setF32(56, value); return value; }
	public var tangent0Z(get, set):Single;

	inline function get_tangent0Z():Single return this.getF32(60);

	inline function set_tangent0Z(value:Single):Single { this.setF32(60, value); return value; }
	public var tangent1X(get, set):Single;

	inline function get_tangent1X():Single return this.getF32(64);

	inline function set_tangent1X(value:Single):Single { this.setF32(64, value); return value; }
	public var tangent1Y(get, set):Single;

	inline function get_tangent1Y():Single return this.getF32(68);

	inline function set_tangent1Y(value:Single):Single { this.setF32(68, value); return value; }
	public var tangent1Z(get, set):Single;

	inline function get_tangent1Z():Single return this.getF32(72);

	inline function set_tangent1Z(value:Single):Single { this.setF32(72, value); return value; }
	public var pointCount(get, set):Int;

	inline function get_pointCount():Int return this.getI32(40);

	inline function set_pointCount(value:Int):Int { this.setI32(40, value); return value; }
}
