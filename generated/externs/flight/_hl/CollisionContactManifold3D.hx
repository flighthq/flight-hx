package flight._hl;

abstract CollisionContactManifold3D(hl.Bytes) {
	public var overlapping(get, set):Bool;

	inline function get_overlapping():Bool return this.getUI8(0) != 0;

	inline function set_overlapping(value:Bool):Bool { this.setUI8(0, value ? 1 : 0); return value; }
	public var normalX(get, set):Single;

	inline function get_normalX():Single return this.getF32(4);

	inline function set_normalX(value:Single):Single { this.setF32(4, value); return value; }
	public var normalY(get, set):Single;

	inline function get_normalY():Single return this.getF32(8);

	inline function set_normalY(value:Single):Single { this.setF32(8, value); return value; }
	public var normalZ(get, set):Single;

	inline function get_normalZ():Single return this.getF32(12);

	inline function set_normalZ(value:Single):Single { this.setF32(12, value); return value; }
	public var pointCount(get, set):Int;

	inline function get_pointCount():Int return this.getI32(16);

	inline function set_pointCount(value:Int):Int { this.setI32(16, value); return value; }
}
