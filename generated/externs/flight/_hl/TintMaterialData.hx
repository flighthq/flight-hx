package flight._hl;

abstract TintMaterialData(hl.Bytes) {
	public var tint(get, set):Int;

	inline function get_tint():Int return this.getI32(16);

	inline function set_tint(value:Int):Int { this.setI32(16, value); return value; }
}
