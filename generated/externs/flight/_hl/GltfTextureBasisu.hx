package flight._hl;

abstract GltfTextureBasisu(hl.Bytes) {
	public var source(get, set):Float;

	inline function get_source():Float return this.getF64(0);

	inline function set_source(value:Float):Float { this.setF64(0, value); return value; }
}
