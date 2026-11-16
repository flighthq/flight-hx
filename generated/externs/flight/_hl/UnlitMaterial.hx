package flight._hl;

abstract UnlitMaterial(hl.Bytes) {
	public var baseColor(get, set):Int;

	inline function get_baseColor():Int return this.getI32(112);

	inline function set_baseColor(value:Int):Int { this.setI32(112, value); return value; }
}
