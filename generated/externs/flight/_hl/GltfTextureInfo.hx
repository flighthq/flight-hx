package flight._hl;

abstract GltfTextureInfo(hl.Bytes) {
	public var index(get, set):Float;

	inline function get_index():Float return this.getF64(16);

	inline function set_index(value:Float):Float { this.setF64(16, value); return value; }
}
