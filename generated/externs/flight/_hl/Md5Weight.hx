package flight._hl;

abstract Md5Weight(hl.Bytes) {
	public var bias(get, set):Single;

	inline function get_bias():Single return this.getF32(0);

	inline function set_bias(value:Single):Single { this.setF32(0, value); return value; }
	public var jointIndex(get, set):Int;

	inline function get_jointIndex():Int return this.getI32(4);

	inline function set_jointIndex(value:Int):Int { this.setI32(4, value); return value; }
	public var positionX(get, set):Single;

	inline function get_positionX():Single return this.getF32(8);

	inline function set_positionX(value:Single):Single { this.setF32(8, value); return value; }
	public var positionY(get, set):Single;

	inline function get_positionY():Single return this.getF32(12);

	inline function set_positionY(value:Single):Single { this.setF32(12, value); return value; }
	public var positionZ(get, set):Single;

	inline function get_positionZ():Single return this.getF32(16);

	inline function set_positionZ(value:Single):Single { this.setF32(16, value); return value; }
}
