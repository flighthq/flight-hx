package flight._hl;

abstract PerspectiveProjection(hl.Bytes) {
	public var aspect(get, set):Single;

	inline function get_aspect():Single return this.getF32(16);

	inline function set_aspect(value:Single):Single { this.setF32(16, value); return value; }
	public var fovY(get, set):Single;

	inline function get_fovY():Single return this.getF32(20);

	inline function set_fovY(value:Single):Single { this.setF32(20, value); return value; }
}
