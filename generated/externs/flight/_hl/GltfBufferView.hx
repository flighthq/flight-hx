package flight._hl;

abstract GltfBufferView(hl.Bytes) {
	public var buffer(get, set):Float;

	inline function get_buffer():Float return this.getF64(32);

	inline function set_buffer(value:Float):Float { this.setF64(32, value); return value; }
	public var byteLength(get, set):Float;

	inline function get_byteLength():Float return this.getF64(40);

	inline function set_byteLength(value:Float):Float { this.setF64(40, value); return value; }
}
