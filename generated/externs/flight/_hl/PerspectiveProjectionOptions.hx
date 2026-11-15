package flight._hl;

abstract PerspectiveProjectionOptions(hl.Bytes) {
	public var fovY(get, set):Single;

	inline function get_fovY():Single return this.getF32(8);

	inline function set_fovY(value:Single):Single { this.setF32(8, value); return value; }
}
