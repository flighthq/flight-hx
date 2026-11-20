package flight._hl;

abstract SkinInfluence(hl.Bytes) {
	public var jointIndex(get, set):Float;

	inline function get_jointIndex():Float return this.getF64(0);

	inline function set_jointIndex(value:Float):Float { this.setF64(0, value); return value; }
	public var weight(get, set):Float;

	inline function get_weight():Float return this.getF64(8);

	inline function set_weight(value:Float):Float { this.setF64(8, value); return value; }
}
