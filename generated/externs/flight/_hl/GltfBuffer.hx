package flight._hl;

abstract GltfBuffer(hl.Bytes) {
	public var byteLength(get, set):Float;

	inline function get_byteLength():Float return this.getF64(24);

	inline function set_byteLength(value:Float):Float { this.setF64(24, value); return value; }
}
