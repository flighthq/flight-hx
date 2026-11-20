package flight._hl;

abstract Physics3DContactConstraint(hl.Bytes) {
	public var contact(get, set):Int;

	inline function get_contact():Int return this.getI32(96);

	inline function set_contact(value:Int):Int { this.setI32(96, value); return value; }
	public var tangent0X(get, set):Float;

	inline function get_tangent0X():Float return this.getF64(40);

	inline function set_tangent0X(value:Float):Float { this.setF64(40, value); return value; }
	public var tangent0Y(get, set):Float;

	inline function get_tangent0Y():Float return this.getF64(48);

	inline function set_tangent0Y(value:Float):Float { this.setF64(48, value); return value; }
	public var tangent0Z(get, set):Float;

	inline function get_tangent0Z():Float return this.getF64(56);

	inline function set_tangent0Z(value:Float):Float { this.setF64(56, value); return value; }
	public var tangent1X(get, set):Float;

	inline function get_tangent1X():Float return this.getF64(64);

	inline function set_tangent1X(value:Float):Float { this.setF64(64, value); return value; }
	public var tangent1Y(get, set):Float;

	inline function get_tangent1Y():Float return this.getF64(72);

	inline function set_tangent1Y(value:Float):Float { this.setF64(72, value); return value; }
	public var tangent1Z(get, set):Float;

	inline function get_tangent1Z():Float return this.getF64(80);

	inline function set_tangent1Z(value:Float):Float { this.setF64(80, value); return value; }
	public var pointCount(get, set):Int;

	inline function get_pointCount():Int return this.getI32(88);

	inline function set_pointCount(value:Int):Int { this.setI32(88, value); return value; }
}
