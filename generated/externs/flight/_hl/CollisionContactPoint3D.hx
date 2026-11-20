package flight._hl;

abstract CollisionContactPoint3D(hl.Bytes) {
	public var x(get, set):Float;

	inline function get_x():Float return this.getF64(0);

	inline function set_x(value:Float):Float { this.setF64(0, value); return value; }
	public var y(get, set):Float;

	inline function get_y():Float return this.getF64(8);

	inline function set_y(value:Float):Float { this.setF64(8, value); return value; }
	public var z(get, set):Float;

	inline function get_z():Float return this.getF64(16);

	inline function set_z(value:Float):Float { this.setF64(16, value); return value; }
	public var depth(get, set):Float;

	inline function get_depth():Float return this.getF64(24);

	inline function set_depth(value:Float):Float { this.setF64(24, value); return value; }
	public var featureId(get, set):haxe.Int64;

	inline function get_featureId():haxe.Int64 return haxe.Int64.make(this.getI32(36), this.getI32(32));

	inline function set_featureId(value:haxe.Int64):haxe.Int64 { { this.setI32(32, value.low); this.setI32(36, value.high); }; return value; }
}
