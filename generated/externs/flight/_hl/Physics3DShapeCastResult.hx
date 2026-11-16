package flight._hl;

abstract Physics3DShapeCastResult(hl.Bytes) {
	public var colliderIndex(get, set):Int;

	inline function get_colliderIndex():Int return this.getI32(32);

	inline function set_colliderIndex(value:Int):Int { this.setI32(32, value); return value; }
	public var hit(get, set):Bool;

	inline function get_hit():Bool return this.getUI8(64) != 0;

	inline function set_hit(value:Bool):Bool { this.setUI8(64, value ? 1 : 0); return value; }
	public var fraction(get, set):Single;

	inline function get_fraction():Single return this.getF32(36);

	inline function set_fraction(value:Single):Single { this.setF32(36, value); return value; }
	public var x(get, set):Single;

	inline function get_x():Single return this.getF32(40);

	inline function set_x(value:Single):Single { this.setF32(40, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return this.getF32(44);

	inline function set_y(value:Single):Single { this.setF32(44, value); return value; }
	public var z(get, set):Single;

	inline function get_z():Single return this.getF32(48);

	inline function set_z(value:Single):Single { this.setF32(48, value); return value; }
	public var normalX(get, set):Single;

	inline function get_normalX():Single return this.getF32(52);

	inline function set_normalX(value:Single):Single { this.setF32(52, value); return value; }
	public var normalY(get, set):Single;

	inline function get_normalY():Single return this.getF32(56);

	inline function set_normalY(value:Single):Single { this.setF32(56, value); return value; }
	public var normalZ(get, set):Single;

	inline function get_normalZ():Single return this.getF32(60);

	inline function set_normalZ(value:Single):Single { this.setF32(60, value); return value; }
}
