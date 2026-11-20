package flight._hl;

abstract CollisionManifold3D(hl.Bytes) {
	public var overlapping(get, set):Bool;

	inline function get_overlapping():Bool return this.getUI8(0) != 0;

	inline function set_overlapping(value:Bool):Bool { this.setUI8(0, value ? 1 : 0); return value; }
	public var normalX(get, set):Float;

	inline function get_normalX():Float return this.getF64(8);

	inline function set_normalX(value:Float):Float { this.setF64(8, value); return value; }
	public var normalY(get, set):Float;

	inline function get_normalY():Float return this.getF64(16);

	inline function set_normalY(value:Float):Float { this.setF64(16, value); return value; }
	public var normalZ(get, set):Float;

	inline function get_normalZ():Float return this.getF64(24);

	inline function set_normalZ(value:Float):Float { this.setF64(24, value); return value; }
	public var depth(get, set):Float;

	inline function get_depth():Float return this.getF64(32);

	inline function set_depth(value:Float):Float { this.setF64(32, value); return value; }
}
