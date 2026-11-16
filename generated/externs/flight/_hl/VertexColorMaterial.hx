package flight._hl;

abstract VertexColorMaterial(hl.Bytes) {
	public var tint(get, set):Int;

	inline function get_tint():Int return this.getI32(104);

	inline function set_tint(value:Int):Int { this.setI32(104, value); return value; }
}
