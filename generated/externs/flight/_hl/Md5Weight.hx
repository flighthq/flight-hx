package flight._hl;

abstract Md5Weight(hl.Bytes) {
	public var bias(get, set):Float;

	inline function get_bias():Float return this.getF64(0);

	inline function set_bias(value:Float):Float { this.setF64(0, value); return value; }
	public var jointIndex(get, set):Int;

	inline function get_jointIndex():Int return this.getI32(32);

	inline function set_jointIndex(value:Int):Int { this.setI32(32, value); return value; }
	public var positionX(get, set):Float;

	inline function get_positionX():Float return this.getF64(8);

	inline function set_positionX(value:Float):Float { this.setF64(8, value); return value; }
	public var positionY(get, set):Float;

	inline function get_positionY():Float return this.getF64(16);

	inline function set_positionY(value:Float):Float { this.setF64(16, value); return value; }
	public var positionZ(get, set):Float;

	inline function get_positionZ():Float return this.getF64(24);

	inline function set_positionZ(value:Float):Float { this.setF64(24, value); return value; }
}
