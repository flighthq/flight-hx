package flight._hl;

abstract GltfNodePunctualLight(hl.Bytes) {
	public var light(get, set):Single;

	inline function get_light():Single return this.getF32(0);

	inline function set_light(value:Single):Single { this.setF32(0, value); return value; }
}
