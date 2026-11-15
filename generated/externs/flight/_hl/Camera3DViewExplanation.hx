package flight._hl;

abstract Camera3DViewExplanation(hl.Bytes) {
	public var determinant(get, set):Single;

	inline function get_determinant():Single return this.getF32(0);

	inline function set_determinant(value:Single):Single { this.setF32(0, value); return value; }
	public var isOrthonormal(get, set):Bool;

	inline function get_isOrthonormal():Bool return this.getUI8(4) != 0;

	inline function set_isOrthonormal(value:Bool):Bool { this.setUI8(4, value ? 1 : 0); return value; }
	public var isReflection(get, set):Bool;

	inline function get_isReflection():Bool return this.getUI8(5) != 0;

	inline function set_isReflection(value:Bool):Bool { this.setUI8(5, value ? 1 : 0); return value; }
	public var scaleDeviation(get, set):Single;

	inline function get_scaleDeviation():Single return this.getF32(8);

	inline function set_scaleDeviation(value:Single):Single { this.setF32(8, value); return value; }
	public var shearDeviation(get, set):Single;

	inline function get_shearDeviation():Single return this.getF32(12);

	inline function set_shearDeviation(value:Single):Single { this.setF32(12, value); return value; }
}
