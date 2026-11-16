package flight._hl;

abstract LambertMaterial(hl.Bytes) {
	public var diffuse(get, set):Int;

	inline function get_diffuse():Int return this.getI32(120);

	inline function set_diffuse(value:Int):Int { this.setI32(120, value); return value; }
	public var emissive(get, set):Int;

	inline function get_emissive():Int return this.getI32(124);

	inline function set_emissive(value:Int):Int { this.setI32(124, value); return value; }
}
