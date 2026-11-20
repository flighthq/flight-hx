package flight._hl;

abstract Camera3DViewExplanation(hl.Bytes) {
	public var determinant(get, set):Float;

	inline function get_determinant():Float return this.getF64(0);

	inline function set_determinant(value:Float):Float { this.setF64(0, value); return value; }
	public var isOrthonormal(get, set):Bool;

	inline function get_isOrthonormal():Bool return this.getUI8(8) != 0;

	inline function set_isOrthonormal(value:Bool):Bool { this.setUI8(8, value ? 1 : 0); return value; }
	public var isReflection(get, set):Bool;

	inline function get_isReflection():Bool return this.getUI8(9) != 0;

	inline function set_isReflection(value:Bool):Bool { this.setUI8(9, value ? 1 : 0); return value; }
	public var scaleDeviation(get, set):Float;

	inline function get_scaleDeviation():Float return this.getF64(16);

	inline function set_scaleDeviation(value:Float):Float { this.setF64(16, value); return value; }
	public var shearDeviation(get, set):Float;

	inline function get_shearDeviation():Float return this.getF64(24);

	inline function set_shearDeviation(value:Float):Float { this.setF64(24, value); return value; }
}
