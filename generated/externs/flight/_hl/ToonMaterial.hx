package flight._hl;

abstract ToonMaterial(hl.Bytes) {
	public var baseColor(get, set):Int;

	inline function get_baseColor():Int return this.getI32(120);

	inline function set_baseColor(value:Int):Int { this.setI32(120, value); return value; }
	public var steps(get, set):Int;

	inline function get_steps():Int return this.getI32(124);

	inline function set_steps(value:Int):Int { this.setI32(124, value); return value; }
}
