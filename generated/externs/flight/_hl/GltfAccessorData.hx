package flight._hl;

abstract GltfAccessorData(hl.Bytes) {
	public var count(get, set):Int;

	inline function get_count():Int return this.getI32(16);

	inline function set_count(value:Int):Int { this.setI32(16, value); return value; }
}
