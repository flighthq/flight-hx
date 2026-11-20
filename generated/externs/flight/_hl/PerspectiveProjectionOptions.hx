package flight._hl;

abstract PerspectiveProjectionOptions(hl.Bytes) {
	public var fovY(get, set):Float;

	inline function get_fovY():Float return this.getF64(16);

	inline function set_fovY(value:Float):Float { this.setF64(16, value); return value; }
}
