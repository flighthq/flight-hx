package flight._hl;

abstract Scene3DHit(hl.Bytes) {
	public var distance(get, set):Single;

	inline function get_distance():Single return this.getF32(32);

	inline function set_distance(value:Single):Single { this.setF32(32, value); return value; }
	public var triangleIndex(get, set):Int;

	inline function get_triangleIndex():Int return this.getI32(36);

	inline function set_triangleIndex(value:Int):Int { this.setI32(36, value); return value; }
	public var u(get, set):Single;

	inline function get_u():Single return this.getF32(40);

	inline function set_u(value:Single):Single { this.setF32(40, value); return value; }
	public var v(get, set):Single;

	inline function get_v():Single return this.getF32(44);

	inline function set_v(value:Single):Single { this.setF32(44, value); return value; }
	public var w(get, set):Single;

	inline function get_w():Single return this.getF32(48);

	inline function set_w(value:Single):Single { this.setF32(48, value); return value; }
	public var pointX(get, set):Single;

	inline function get_pointX():Single return this.getF32(52);

	inline function set_pointX(value:Single):Single { this.setF32(52, value); return value; }
	public var pointY(get, set):Single;

	inline function get_pointY():Single return this.getF32(56);

	inline function set_pointY(value:Single):Single { this.setF32(56, value); return value; }
	public var pointZ(get, set):Single;

	inline function get_pointZ():Single return this.getF32(60);

	inline function set_pointZ(value:Single):Single { this.setF32(60, value); return value; }
	public var normalX(get, set):Single;

	inline function get_normalX():Single return this.getF32(64);

	inline function set_normalX(value:Single):Single { this.setF32(64, value); return value; }
	public var normalY(get, set):Single;

	inline function get_normalY():Single return this.getF32(68);

	inline function set_normalY(value:Single):Single { this.setF32(68, value); return value; }
	public var normalZ(get, set):Single;

	inline function get_normalZ():Single return this.getF32(72);

	inline function set_normalZ(value:Single):Single { this.setF32(72, value); return value; }
}
