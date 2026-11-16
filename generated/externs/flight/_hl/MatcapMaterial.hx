package flight._hl;

abstract MatcapMaterial(hl.Bytes) {
	public var tint(get, set):Int;

	inline function get_tint():Int return this.getI32(112);

	inline function set_tint(value:Int):Int { this.setI32(112, value); return value; }
}
