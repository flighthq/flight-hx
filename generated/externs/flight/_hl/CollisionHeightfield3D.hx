package flight._hl;

abstract CollisionHeightfield3D(hl.Bytes) {
	public var columns(get, set):Int;

	inline function get_columns():Int return this.getI32(0);

	inline function set_columns(value:Int):Int { this.setI32(0, value); return value; }
	public var rows(get, set):Int;

	inline function get_rows():Int return this.getI32(8);

	inline function set_rows(value:Int):Int { this.setI32(8, value); return value; }
	public var cellSizeX(get, set):Single;

	inline function get_cellSizeX():Single return this.getF32(40);

	inline function set_cellSizeX(value:Single):Single { this.setF32(40, value); return value; }
	public var cellSizeZ(get, set):Single;

	inline function get_cellSizeZ():Single return this.getF32(44);

	inline function set_cellSizeZ(value:Single):Single { this.setF32(44, value); return value; }
	public var version(get, set):haxe.Int64;

	inline function get_version():haxe.Int64 return haxe.Int64.make(this.getI32(52), this.getI32(48));

	inline function set_version(value:haxe.Int64):haxe.Int64 { { this.setI32(48, value.low); this.setI32(52, value.high); }; return value; }
	public var x(get, set):Single;

	inline function get_x():Single return this.getF32(56);

	inline function set_x(value:Single):Single { this.setF32(56, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return this.getF32(60);

	inline function set_y(value:Single):Single { this.setF32(60, value); return value; }
	public var z(get, set):Single;

	inline function get_z():Single return this.getF32(64);

	inline function set_z(value:Single):Single { this.setF32(64, value); return value; }
	public var rotationX(get, set):Single;

	inline function get_rotationX():Single return this.getF32(68);

	inline function set_rotationX(value:Single):Single { this.setF32(68, value); return value; }
	public var rotationY(get, set):Single;

	inline function get_rotationY():Single return this.getF32(72);

	inline function set_rotationY(value:Single):Single { this.setF32(72, value); return value; }
	public var rotationZ(get, set):Single;

	inline function get_rotationZ():Single return this.getF32(76);

	inline function set_rotationZ(value:Single):Single { this.setF32(76, value); return value; }
	public var rotationW(get, set):Single;

	inline function get_rotationW():Single return this.getF32(80);

	inline function set_rotationW(value:Single):Single { this.setF32(80, value); return value; }
}
