package flight._hl;

abstract GltfNodePunctualLight(hl.Bytes) {
	public var light(get, set):Float;

	inline function get_light():Float return this.getF64(0);

	inline function set_light(value:Float):Float { this.setF64(0, value); return value; }
}
