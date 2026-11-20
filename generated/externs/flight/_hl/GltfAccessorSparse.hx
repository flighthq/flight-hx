package flight._hl;

abstract GltfAccessorSparse(hl.Bytes) {
	public var count(get, set):Float;

	inline function get_count():Float return this.getF64(16);

	inline function set_count(value:Float):Float { this.setF64(16, value); return value; }
}
