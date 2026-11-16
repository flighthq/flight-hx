package flight._hl;

abstract GltfPerspectiveCamera(hl.Bytes) {
	public var yfov(get, set):Single;

	inline function get_yfov():Single return this.getF32(16);

	inline function set_yfov(value:Single):Single { this.setF32(16, value); return value; }
	public var znear(get, set):Single;

	inline function get_znear():Single return this.getF32(20);

	inline function set_znear(value:Single):Single { this.setF32(20, value); return value; }
}
